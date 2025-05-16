Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23172C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9A910EB44;
	Fri, 16 May 2025 17:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHL1XG+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5DA10EB44
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747415632; x=1778951632;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=MmJaG5Pqzi7ApAs+D0TtqODAxAXQXzhMbQ714u0mBc8=;
 b=WHL1XG+rKmIHi9648jdTY3D1z7tIa08QfRMkAQ2U4K+ONYc6RNvVpvLV
 DHrQdHQFfm2bs/fhLxmKdEqS3GvCYsnZ/pkyQMem7zwLtkvcISZgKqUoi
 EucNubYeR7ZiQNQkWG+qCFzLetvisQnFOLgqNt46foqyyezfaDH//u6oI
 BErNPpSm1r8LUowYq+E5fPlMEnJ4uG3m9NK5HcW/uxn69iyiRdLv+PJ1a
 hCLEyHBWgKBOncQG/MUpnAx0l1dMUXyVr73VxMAYClMjSLUwCRLUEenIt
 9G5gV+59tmYKpT0ZosyDOa+WKe4fEBSJRK9I4tc/nuz+Hm4/U4Bm2rjNP Q==;
X-CSE-ConnectionGUID: KkKyhmYWQWuCfUrgZlzisA==
X-CSE-MsgGUID: w4T+uc55RY+EMkXjQ278zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60786277"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208,217";a="60786277"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:13:52 -0700
X-CSE-ConnectionGUID: VlPbk0lOQRekQWzES+Y71A==
X-CSE-MsgGUID: cb3xfi3hQMmGOy2VzfQf2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
 d="scan'208,217";a="143632154"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:13:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 10:13:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 10:13:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 10:13:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMOHPvfERkkMmhTyaql6XxYBU36laLxGFY+df9iL63YNCWbaw0K34AI9CnYmIEVxXD23WrF6F9ad0WIQl5AgB9E6NNfCoTg3NfVR4dacyfz0h7DlMapFeEkvoAjW7ssjKvKN3SUZt6541eA4QoDKcKEXeUp5kJhcUhfVygPuaOHYXjy/WaveT2mIjwGy72xYXHCfJNud5SNrDRk9rAzm3ZJueLDuWpehgH8kMhV37F706d+uV5Ft2AMVVCscRCEhuKg79XiZVbZApnCv5+TU5M7rHlTOhDCe4yS0MsWJJYxxcRs7uzuYtHJGBe2giepMQuX4PYjV6EGPQMA09gmApw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMffU9Nhq0usqrDkvdqcffgmCfahTvhdmzZtbC45jQI=;
 b=EJTT9DwQEKVzG1VZGmHkAMvSnKJ4/XMrvIhyK8WdtpoNJoOQ55poOe16tAMJLk7i48b3PeAe8Lk2eM4uA8DSBciOkRvMqL45ch+FIJDSZscmZczkq1Enk1GjyzW3gP6WnPw22y/c6fTwPjRxdH+mf4v2EmHOe8N51pqgoIuLryWnglH+Pdjf0T/laK3oD+RylUWdByvxCMyrqWcQYXBKKDamuDDT9TsX1dpV20SpHbCrlT1W7bKhZO9BbARr0PToJxvW38bgrZd0r7opNfUOnyr0LsnNVThxsSI7sEiU1T1HPTVnUeyzvMICSQqITCoLiVVM45vhtSCCjLtbO5wdAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14)
 by DS0PR11MB7560.namprd11.prod.outlook.com (2603:10b6:8:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 17:13:20 +0000
Received: from IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240]) by IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240%7]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 17:13:20 +0000
From: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "markyacoub@google.com" <markyacoub@google.com>, 
 "seanpaul@google.com" <seanpaul@google.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Singh, Sapna1" <sapna1.singh@intel.com>
Subject: Re: [PATCH i-g-t v6 09/14] lib/igt_core: Implement conditional
 backtrace support using HAVE_LIBUNWIND
Thread-Topic: [PATCH i-g-t v6 09/14] lib/igt_core: Implement conditional
 backtrace support using HAVE_LIBUNWIND
Thread-Index: AQHbxnyHANJIYx9B10eiG9+U+yQvGbPVdz6AgAAHKPo=
Date: Fri, 16 May 2025 17:13:20 +0000
Message-ID: <IA0PR11MB73531FA41842B9F1EB0D22F1ED93A@IA0PR11MB7353.namprd11.prod.outlook.com>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
 <20250516160551.58760-10-jeevaka.badrappan@intel.com>
 <20250516164645.h4vn4h7mmmza2cej@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250516164645.h4vn4h7mmmza2cej@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7353:EE_|DS0PR11MB7560:EE_
x-ms-office365-filtering-correlation-id: 45ba8a1c-1124-4626-2248-08dd949cf51b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|8096899003; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?FNx6euBIVbCIU6f9omadWM0i3AWw+7EQFz3RDwvHr3wF1UDkDvxCRP5Uiu?=
 =?iso-8859-1?Q?CrxmBnIsipVAg8axIsIAx0qk0Wz+70qW55SM7LT4w/OllYd2vLr+w0vxKt?=
 =?iso-8859-1?Q?6MpAxtP6iEbWF6S8uGIHabm4S3CiTa/qAwl8wOLUO2+JJi0BUkrg2znfaL?=
 =?iso-8859-1?Q?pG5snZS+1//gaTebkT5WVLBWGxUw3jzOUFzVWNOloQ+/+4GouARmQ712UF?=
 =?iso-8859-1?Q?C9GNKjErXTguEkqhHBRvbKaet1/Wi4EWp56ToiXjH8pQpJqbZ6TV6KrHKT?=
 =?iso-8859-1?Q?q1PzOVlpX17KISd7uNVMtXA0gF2Lo7GQstXJ9ywSDe/EVwwC7b9+RrnQBr?=
 =?iso-8859-1?Q?2KbEQrvm356gobQioaLyxZezKqI1zUe1kLrFpnTO+exgw9R6b/aoPujXK5?=
 =?iso-8859-1?Q?AWrdYpLWw7SosCaOHAcdx9QGYceDpjKQtEzCwbWm+tv1CCgM6XrqLXzSDt?=
 =?iso-8859-1?Q?gOlPXvATMMtFSaYraHshyCiIaFPFB6jc3S2FpEU93gQh6KJEZWOb8lfz8u?=
 =?iso-8859-1?Q?KOGsoYBtxmpDUGRK/27WypLQeTC6T+6X+CswT5D1JPY+YpBS3XnStHPxec?=
 =?iso-8859-1?Q?pX/20OpD2cxfQzeJR+lszRA4LFStST7OY1gX3ol4t55wHrUa8HEic+brMG?=
 =?iso-8859-1?Q?Nr1WSeM4JyzhyDrgwaxllpWA/d9mUO6TZ/hsiNh7DMyQ0rN1Me3Tb1HuYO?=
 =?iso-8859-1?Q?3+GkQ88VvTjDS1+M2WzdKEkDcpCD20I8ZSv+2xZJw4Vzo13U5EwNUgpvd6?=
 =?iso-8859-1?Q?A8Nn8EPnwFfKm8Tyx6dVogCaTHG+G1Q0NYcnQTb6JAQ4xZ+s/QyUE3/WB/?=
 =?iso-8859-1?Q?IilmCG7gtIFER8mwFstxkE4HDngkNFIFyQ9GI0tXv+eB+rv8R7EUyPbKNk?=
 =?iso-8859-1?Q?29vNvzDr4zj8rJosCvns5SaSeE+wvQyy/RR4blkfhT/xm7RIfdrgPk7T2o?=
 =?iso-8859-1?Q?SNmzcP6bVtfm/QNq1eVbmoNfbts7KA2TVhK3a89okTiVECDgeXIw/orCxX?=
 =?iso-8859-1?Q?UMRJZdavP6iftCrrbXkZksNmzL5te81KeQVRTPtmfv633SaTcNXXJqnx+P?=
 =?iso-8859-1?Q?LVu7kOQVgvfchFRZuFn3+N/5R1rYbkaq5ZyAa34h1I5ATKQup08cS4Plis?=
 =?iso-8859-1?Q?O8Senx215ZWZMK1O8ER5PYap8sFii/VQ1wVEy3v2jV0oIyN46Kn1jT5P5V?=
 =?iso-8859-1?Q?8xSsg1zp8cmYWi8Lg+JK5kLADyQo9PoR30V+TttaTj+ERP3zbUsLlqt1zG?=
 =?iso-8859-1?Q?nbYvSPLX1C/AwurxJLZYM/265+2vbyU8ml2qlpt4HwbuMQDViWL+3kd519?=
 =?iso-8859-1?Q?f0de6Lx8bxaiT3ANg83nHM5GzTTkg26qDQNhJP74izO+5sdCtjUwX0e/4j?=
 =?iso-8859-1?Q?Mtdyum7XKofYzdsQpq0ZJvclFm7iegSspBTWnYiS3UDk2/vQYpD3F8LOx6?=
 =?iso-8859-1?Q?U2ZBqrKwVjARiaN5xd0IdgfM1dBr+mKfmAFuryiFnDbemtDq9CIkr0VcId?=
 =?iso-8859-1?Q?LNZOwAU+matsfJ5dqPe+V+wHHo3d4MYsucvxeo7PRcBlNUrSpMLEUSYMOb?=
 =?iso-8859-1?Q?tbKuJ+g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7353.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(8096899003); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gxP6ocM6YIJ547Mi71hBf+eG1etqfERtqRLxLa/lYxYmZHRIVMSe1zpui+?=
 =?iso-8859-1?Q?XXoZ8t6dm4C1xGkRk4NCYHMGDJBiYMXk7XsBkvnGoXqCgf7lIideH1sEZI?=
 =?iso-8859-1?Q?kAVwnF9whem+ZPqN4HkC5/AD4EbzY5eQS5w5AhmynohRkeTQYX0DYQDOQG?=
 =?iso-8859-1?Q?B4Pfj2itJko7Z+V5MaEy7kvdDqA29YC2pxmAfO0ZQUiMLCF4Ys2xVl0aLA?=
 =?iso-8859-1?Q?Un9TVhWffk+GBfT0uD27yiljmVzMOJAB5w7wQja5E9FS61NqpQeaUF8tQk?=
 =?iso-8859-1?Q?s8KRSRAX/OCXD1zkmO/AE/SFQI+baoca8YpLUueBBEutu8DBcenKvw7sk9?=
 =?iso-8859-1?Q?1siDGhxIefVOHqFcMAKYP5mhC6pFoVWg//3a5OkgbBAFYBN3goaCUsADGx?=
 =?iso-8859-1?Q?CIAY/QMHz+OkFzHOXKJGOnIdOm8KKMNsMEJ82Qx7RZ8yp8CQljWCHyBwDh?=
 =?iso-8859-1?Q?cXKn7rUNx31nFAqpK7Z8/Yk+CYn2kwHpLXF38crcdx8M2S8lE34nX+71Up?=
 =?iso-8859-1?Q?RnOZb8QfF9qdIgkQEKRqK+1a2gq5nUPeFB1RRhrJahg4ND1YxMgfrD/QA3?=
 =?iso-8859-1?Q?9aHU0Pf+eiJ2JJueUnal7BidxUihkKgU5jQzrw2yOAD15jhtPxS2y5/GRS?=
 =?iso-8859-1?Q?vraomOBrddbNQkuXXsRK10CQWSDdl4Kvt0Q5ySeUoYFMEl8kG8H7iD7qGm?=
 =?iso-8859-1?Q?QGYhil2dqeky9bziBfPHRRu6vzRZ9B1qhr/GcH8qYRj5CnHNt8t+fQro9s?=
 =?iso-8859-1?Q?7KznaTAlgqtN/eN1kscBXB9CQA4SrpZ1knMfWzz/tlQ7Cgnx81Uknroyjb?=
 =?iso-8859-1?Q?n28KWXWlxuv5oQprLk1YC/bxM6Ahkfr9++BgCKJkf4I54cGFiuJSevReyl?=
 =?iso-8859-1?Q?7oymngNInlwS8RvqWIT24O2+wW+MZqIy6NJSGTcqiE8+waLP41/PXZXOia?=
 =?iso-8859-1?Q?gL4jeeqWN3W+XzMOi6Ed5GfTYK+ozAMdbqCIW6oy/NcnTBsQSivGRIe4wn?=
 =?iso-8859-1?Q?qLv/yxtHvo9ddBJ9HtbtbXh6vUfdYRPmmeI3ER898bhRoNSPMcD3HHgn0O?=
 =?iso-8859-1?Q?Cr7hx/rtSms3lFam89zcwgGYNKrKXYgbMqU9R/wTY8C1w9MuM0lwfA6E4h?=
 =?iso-8859-1?Q?AM7sP1pVNCfKxTvRltjDF/8lagRueFGlfneolINTVLvauW5ilgyVIK90xc?=
 =?iso-8859-1?Q?8l5x2sSoRnYYRikRblK2TJdVCReVk//FHRYcoEuMWXz0djPrwjkLTTXXTR?=
 =?iso-8859-1?Q?wdDx9bW4S4dZiphdA9/FZ9LnK0FBgMvPGG2swyvFlya73azZdxvKQRaxEo?=
 =?iso-8859-1?Q?h3/KJHGmzeErVWUsrDcwbV/hYepwqcWnDRzUAQGMxWRs9jyPij7mAU4Olz?=
 =?iso-8859-1?Q?ursxPyps6v7QQJci0sufodK0/09uMYyalPdOnTietwdHr56K7EUwfI640b?=
 =?iso-8859-1?Q?qmyv/c4E9UCNO6Z0WibulAyg5p/diXPzWgYWmLO+m8rPYpkZN4/G7XV4AS?=
 =?iso-8859-1?Q?Z11utVZZRD4EIPPEVcD2AusnBCpNQ86NA+RiUrqP1Nv4eUhv1Joh5KRHNc?=
 =?iso-8859-1?Q?Ovijf0xZ12QJ5W/2nKKt9Htvrxwz3ChkiYRwRBqgNccssXmI4qT/f1doVl?=
 =?iso-8859-1?Q?tnuJf/OpGDiMz/AZOoIgyX5aH8mhqTuMz2?=
Content-Type: multipart/alternative;
 boundary="_000_IA0PR11MB73531FA41842B9F1EB0D22F1ED93AIA0PR11MB7353namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7353.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ba8a1c-1124-4626-2248-08dd949cf51b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 17:13:20.4074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNuGA9RtqIA9OPdXOMjztCz4d3kCv/53XWxLDvJHgQqmgNLtjJO+I/4xh6B4C89UeGz2Ftq23m6U8+/eW2FnF5LYf3ZHdl43gd/tWTJoZ9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7560
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--_000_IA0PR11MB73531FA41842B9F1EB0D22F1ED93AIA0PR11MB7353namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

On 2025-05-16 at 16:05:46 +0000, Jeevaka Prabu Badrappan wrote:
> Add a log message indicating "backtrace not implemented" in the
> print_backtrace function and return when HAVE_LIBUNWIND is not defined.
>
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/igt_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 1d7402cb7..097a556c9 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -383,6 +383,9 @@ static int _igt_dynamic_tests_executed =3D -1;
>
>  static void print_backtrace(void)
>  {
> +#ifndef HAVE_LIBUNWIND

> I added here

> #error "an error"

> and this did not compile on my machine. You need to add HAVE_LIBUNWIND
> into lib/meson.build
> For example how to do it please grep for HAVE_VALGRIND
> and make similar change.

Addressed and new version pushed.

Thanks and Regards,
Jeevaka

> +     igt_info("backtrace not implemented\n");
> +#else
>        unw_cursor_t cursor;
>        unw_context_t uc;
>        int stack_num =3D 0;
> @@ -440,6 +443,7 @@ static void print_backtrace(void)
>
>        if (dwfl)
>                dwfl_end(dwfl);
> +#endif
>  }
>
>  __attribute__((format(printf, 2, 3)))
> --
> 2.49.0
>

--_000_IA0PR11MB73531FA41842B9F1EB0D22F1ED93AIA0PR11MB7353namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Kamil,<br>
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
On 2025-05-16 at 16:05:46 +0000, Jeevaka Prabu Badrappan wrote:<br>
&gt; Add a log message indicating &quot;backtrace not implemented&quot; in =
the<br>
&gt; print_backtrace function and return when HAVE_LIBUNWIND is not defined=
.<br>
&gt;<br>
&gt; Signed-off-by: Jeevaka Prabu Badrappan &lt;jeevaka.badrappan@intel.com=
&gt;<br>
&gt; ---<br>
&gt;&nbsp; lib/igt_core.c | 4 ++++<br>
&gt;&nbsp; 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/lib/igt_core.c b/lib/igt_core.c<br>
&gt; index 1d7402cb7..097a556c9 100644<br>
&gt; --- a/lib/igt_core.c<br>
&gt; +++ b/lib/igt_core.c<br>
&gt; @@ -383,6 +383,9 @@ static int _igt_dynamic_tests_executed =3D -1;<br>
&gt;&nbsp;<br>
&gt;&nbsp; static void print_backtrace(void)<br>
&gt;&nbsp; {<br>
&gt; +#ifndef HAVE_LIBUNWIND<br>
<br>
&gt; I added here<br>
<br>
&gt; #error &quot;an error&quot;<br>
<br>
&gt; and this did not compile on my machine. You need to add HAVE_LIBUNWIND=
<br>
&gt; into lib/meson.build<br>
&gt; For example how to do it please grep for HAVE_VALGRIND<br>
&gt; and make similar change.<br>
<br>
Addressed and new version pushed.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
Thanks and Regards,<br>
Jeevaka<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;backtrace not implemented\n&q=
uot;);<br>
&gt; +#else<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unw_cursor_t cursor;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unw_context_t uc;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int stack_num =3D 0;<br>
&gt; @@ -440,6 +443,7 @@ static void print_backtrace(void)<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dwfl)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; dwfl_end(dwfl);<br>
&gt; +#endif<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp; __attribute__((format(printf, 2, 3)))<br>
&gt; --<br>
&gt; 2.49.0<br>
&gt;<br>
</div>
</body>
</html>

--_000_IA0PR11MB73531FA41842B9F1EB0D22F1ED93AIA0PR11MB7353namp_--
