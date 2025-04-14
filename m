Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789E1C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 12:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233F410E5A4;
	Mon, 14 Apr 2025 12:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NaFcMlpH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE4110E07F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744635519; x=1776171519;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AetXkzWKSDAT3COuQgPbZC/Rp0naWu5SrcrQ3ujzsX8=;
 b=NaFcMlpHA9on/sryIYBbMX0fnCHHBWYGYoH/GHvqoLznrgyJwcz/XLXQ
 iIFQ7T+uh+GJt+ncQhqeB+bIQ45cce9XQz+Dg9P32yHKJDeCfiPxbmiIN
 C9e9kfjv4nS9zd4Tl0Wd4IazXnXHO1iyNKbvg0pgjNXolnFxWQWnqniS3
 4yIg3QrHLIfLsRvZbDdPGszg84IfEdSYGwKSCEsGlitcQEJkHhSE4rAg4
 Z2gwqAMuL3fHVwabirM7Z1zr4F3Mi5t7n2Raoa1V+ybbVohtAjslN+GJH
 cLO1GDjpont5Zzl8nzMFKXMngfVur5GL13t0RUBU3JrKN61gOId4E5B3O g==;
X-CSE-ConnectionGUID: IbkUanXTRv6v26qiXncA+A==
X-CSE-MsgGUID: rw0C1Ir6TWyQ5TY4lZeDew==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45983595"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="45983595"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 05:58:39 -0700
X-CSE-ConnectionGUID: 6YN7JM8uTfGkPrtOi1ZYcg==
X-CSE-MsgGUID: 8Bc3q8HsRp6bJowLdjNtZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="130787446"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 05:58:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 05:58:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 05:58:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 05:58:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUosfRUPOuOPqXNzUbEDikjIPSKNMRiO35PLuk9ZW/N08eYNVzVCkPGfQm45laApVRLHGZ1IBH6zugw6WbGP0zJtN5/eNv3rCh7b42D2M6xuGoS9zm5r4JaNp4hM9eTJD89W+/rO+JW4q/OqSc0penemCjRCQVjWTAmcbGXvstJqfZYTpjvbaaj8dPBa5yUGTgDMlf3mgzyfLy6k03ASiIeyOUPuPzHr2PMsnDolT9GdrAXeveL5psnXKIEAXsoZVeX6Dw1/9tA37/bv1vD1AKpd3wUD36cz3er1lnzq1xuFDDSX56zQoZfZN09bYfW3znL4RRpVGZx4yKp+gyy+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSdVsLM8H6SfIXigHzdPnq51QLzxvBx/sgzgbRPaF7s=;
 b=CxVyuktHFYC8l67FQ4dlzLhK8VtRpza9dUlclpLfhHeJf0b5+CBI4Rt/Xm5oSCMq050hlyHt9dy98VWHv57oJ7b9SkBD5LDvbKUbgGXg34ninXHVJrQ/18bbzR2+xaSmVtRBHZ4zv0tY21ZX6wI5KXp3nXyo4+JHWfZQUcCNlRDXKlkzCy8UarSLQRk0/rbu+NkbcsWlP9brhW9aozf9Ivm1bAQninGysT3Bsolm7jOZy2nrnwMT5BgESfZntt8oRMKW12BovrmzdDclRu39u8BhzQ3YsPnxX0/yLcRpE+hG8oiBPOrfqKV1u5HJjw/moWVDpqtAl0ixu0RpH4JhmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SA0PR11MB4702.namprd11.prod.outlook.com (2603:10b6:806:92::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.34; Mon, 14 Apr 2025 12:58:36 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 12:58:36 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Sokolowski, Jan" <jan.sokolowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, "Sokolowski, Jan"
 <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] tests/xe_eudebug_online: Implement faultable
 variations of some testcases
Thread-Topic: [PATCH i-g-t v2 2/2] tests/xe_eudebug_online: Implement
 faultable variations of some testcases
Thread-Index: AQHbouWWhiyFc9gysUWVVOt6l1VIVrOjMvCA
Date: Mon, 14 Apr 2025 12:58:36 +0000
Message-ID: <DS0PR11MB72642EC7EE5D5E1716970298D9B32@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250401090651.298768-1-jan.sokolowski@intel.com>
 <20250401090651.298768-3-jan.sokolowski@intel.com>
In-Reply-To: <20250401090651.298768-3-jan.sokolowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SA0PR11MB4702:EE_
x-ms-office365-filtering-correlation-id: 5964dc48-2912-4df4-73f4-08dd7b5411c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?dHhHNuXS6IKhIoqzSbcQ6/Y5ym/+COeGcNQre3FZkt8qjfYaTZV1pIigxe?=
 =?iso-8859-2?Q?UGIix6EhP3z1ADHou7xfXin0XBZRHathg05+vSw3rIl7On6NNhWofrl5SM?=
 =?iso-8859-2?Q?ScqdfM4V1cr+dg4o3n1aUJYtbdSD4BB+NCwbMnfaHXLfIyJMrZTFm/2qmH?=
 =?iso-8859-2?Q?YUa+WXWA5tfBoO4WKjo4fl1f9QakMUGSpCpqHKg1SioXaQsrbC+oSCJIqT?=
 =?iso-8859-2?Q?HipNfdf56wfMe3pVbwgkFy3IYGBi20EyNxnUiaVxrLGOvFXkEE50TlzD4s?=
 =?iso-8859-2?Q?Vx8Yv+3ymBVir4wTYfD08aE2U11naVgVk6xhZlcllTpv/FJawmqbmpCuEV?=
 =?iso-8859-2?Q?FXMJyjmobZXtxRs07rRaD7ZkpheqRVixfA2yM8HpSy1WoBwkZCLeykos8r?=
 =?iso-8859-2?Q?GmdPSh09tkV46WolZv8sCv8QEfUwgyReZdOllcHxA1591Y/+fkBlP1mAKn?=
 =?iso-8859-2?Q?N0yq+WSSdqQQvFCNHuHPK+ftwhDU48eFm3I7/7eo8U1hvnZb2ZPHdE+DDb?=
 =?iso-8859-2?Q?uStUtpErXIW2PwjO6Uk1EKDiCyTK8ayg22A1AlEZJhtyMr1+eYew20B45B?=
 =?iso-8859-2?Q?ntjDZA4VIfLQQ8qmUZMKVfy57yBENl/PXdbF+7x7eYtgQx3V24S7sBkGtW?=
 =?iso-8859-2?Q?sVF5XjOSRl1UlDBBiDanqoKrpRxwMye9ssSAjaN5SfI/VoohKO1WDl/zNE?=
 =?iso-8859-2?Q?H72bfP37fOp4l89eh3xsON5KDIQt7j/0B49Ev8cMwVMNzoze+6Zs/xrI6u?=
 =?iso-8859-2?Q?vrcTF267osCdFE6kx0/VbaAremIgs50GoEoVY/N0dE2LaGJWtDFslpy9Eh?=
 =?iso-8859-2?Q?YI1TPZ84XIzSkkL3xHRu45kts3p7OTHaHT+47QiMqNF52WFwxAmNMdh19G?=
 =?iso-8859-2?Q?6c8KxjdZpEnnfPWNHwFSjXBdVFG1XM+nB9KHfbOFMGv/9FOTWuMZQoPEPS?=
 =?iso-8859-2?Q?7fVT4epqbVI9j9ziyaxN1g2pvVtHHCjkY1kOA9pSFDDnyoNgniU6I2F0ad?=
 =?iso-8859-2?Q?m3Fh8NwY2rmvV9R/P3+KJopsxVBPres8Nc2+ICberlZ0heoNKs710J1U+q?=
 =?iso-8859-2?Q?Wx5hOxG79nkax/SnHm/YeA+Xcqud90xvISfXD575z6tClBUaZdh6cJ5r5P?=
 =?iso-8859-2?Q?6QOAcIVP+O28p4EGkMAmkSOjUQL5KaiK3v79fYPMTPbpHs6oZmU6SMf2Aj?=
 =?iso-8859-2?Q?Q8DVfWEOPv3iV7dYjtFPG0xsjHTDQRMKZQVsZ1aZtV999TcsJpydgfQfJz?=
 =?iso-8859-2?Q?3sCqw4AL/q6G5eVHdUHmtg/DpH5+KMnyaMvDGAqHMtSyC1T4JCLy0+mCx/?=
 =?iso-8859-2?Q?cgBVz50oEt2yCyqDPglTiyhTprOkg8PE8m8CoDecFP9AGOD91v3hzkRdFi?=
 =?iso-8859-2?Q?CP5ziCuUL4W4eQNJ+tvMXTsX1MCLkZIHt3HLA09cnuV2FivFEoBXC5RmRv?=
 =?iso-8859-2?Q?B8qsnDC64xnz+IPzrRFHJn9Z5Hc6UquFA9gkR4ga5LbKCqmSlDHJtA12Ku?=
 =?iso-8859-2?Q?IXsVmiMyMaxA1PbHssyDoxP6cZ+oxa8Hfpo6yAc/LjMh5QT8LRJBiRVrFb?=
 =?iso-8859-2?Q?QRwmPmk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?GcOJ2qyHoJYlVuMV8hevwMU5B5WMgDmqVFKlhrRRLBs+zeakr9ljFBHRlw?=
 =?iso-8859-2?Q?uJ9fqrd8PYlBnsMB+TBEUzjTbtDSGfVtspmVkYZZ3l5Z8YRzDaMg7D6Btn?=
 =?iso-8859-2?Q?9FLO0UNzQD5xGcp19wIwnFpcwEEIcnScMTmCNIk5XYrwibEu9JIn10PfrO?=
 =?iso-8859-2?Q?CYdTm/jHBEAwSMVs/QTqp/3cY9qA4QxuTOxZbPNLBoUq9laSrFbJ42MSRZ?=
 =?iso-8859-2?Q?ICv6pV/pwuOyLHqANVDbjp01o51FyBOtaCSNOpdn1SUrWcFiH35nIX6faq?=
 =?iso-8859-2?Q?oa/xrtEAFfEKmoStdTEhIl1znELCb/dsPfVMhu/ie1/eJNSGL9qQGWs3pS?=
 =?iso-8859-2?Q?UjhcU1qD9BIitLYLG4GiG4pAFMczKLsFbOKG1KZUcVVmRzzG567xYsfxmG?=
 =?iso-8859-2?Q?Tes4fZTSmG+OXkkXCHRrwIAIu7Jw0V3g1AthQBaymLmRpHWxsSowB9VrAH?=
 =?iso-8859-2?Q?n5NMBjO+24kU1yCvpdqzoUDjkXud/mqMe44JJ8lCIuq0QiOvABDlilyft5?=
 =?iso-8859-2?Q?vR0pXx2PFdvBlgytxg5kfckON6sDqG0/+glZsiXa6D18Deax0WOg2AOl33?=
 =?iso-8859-2?Q?b+yMx4X8MXzFY7H7FwyDnn6mDeA3oYuQrAqTRJaMaNvyJpL+Zu3NkthVE9?=
 =?iso-8859-2?Q?BYtfAEczG/Wr946qoY6g1eHfYucFb+u2FNfVo9h5V5Y2p9l6pF1lkfxE7S?=
 =?iso-8859-2?Q?+Qt9jZbmI0OXW+sQs3bnKFqWWq1y5vbyr1mmnseJT8OWoCH5TW1z7/cqyx?=
 =?iso-8859-2?Q?BzF50a5xoxMu/Pp7U+unpfGHNH7c4m4O96YJuQyQnpwoTdV2dQk97434fo?=
 =?iso-8859-2?Q?/Y8JtRVjdu3sm953HJr3nEPviWLutpbCL8ZPEnREAlSbwfOmUPlM8yOSM7?=
 =?iso-8859-2?Q?OwtYVvweydZxjdOJTAeQl1rqrOOIJ/0bIio0PkT41sgdg8yIhY69yhYpgr?=
 =?iso-8859-2?Q?g9vCsUX80IUevkXGhjg9Jb+5d1Wl1/T7Z+Xha8LForRDmJ/KupDpjwWfb6?=
 =?iso-8859-2?Q?iUqwKUzy1VI+BF00Opui8jPUS7XseL4SHcIg/IsB58XqyqJdJ7BgkOyB4E?=
 =?iso-8859-2?Q?apqcIjOalj6CuO6bvmc2xLnHsu2TanJNQNvHlcQLv7sZzUkOQ5qPcnbjIf?=
 =?iso-8859-2?Q?LxKUxqq1T0/47F23Kc5jw+Rbk3MJ25OjMGqcE8jQ8w9jpbiwu+CisPojnX?=
 =?iso-8859-2?Q?N2qtjs/9YWipVmPIZ36YpiSPM+CnLLWSd9BW3v1qwru2A0Tatqp35I3amC?=
 =?iso-8859-2?Q?AQFe+toZRNGWiInZFWDe2dtj9RZDh+u6+ZJ9LYJL+NJzIadY/hlyg7XuC6?=
 =?iso-8859-2?Q?oFyc/cqoU8A+E4y+LUhboMHgiV0vh9O/DBAdiEWAgjS9k02R9dazftdstO?=
 =?iso-8859-2?Q?7HLryL0fgFZjGz9WQuMdKbgRyv8JXHpHM4Qj+QzUVdfyEGfrwBPy0J1gK5?=
 =?iso-8859-2?Q?wn/E7gahTIvg1Ew6RpFPoIfvLvuj+yJsmfHHKp3er+mYlHewDu3iznci9C?=
 =?iso-8859-2?Q?CjzaRpOvNpCxKfIIvcpUwqpcD3q1nvT6vFmo+2fyJSJZ2gHyMlJ2HwjZxS?=
 =?iso-8859-2?Q?27rPRKOMJeExQ4YKJ17B7YSShe4cXgRVM5YmOfS00E0DxEdB+jqSR2q3Ae?=
 =?iso-8859-2?Q?kFyRLOt6qeEgPh/XzjcuGuBMSOSsNcB7jrteNtvwn91LJPOn8HN4BduQ?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5964dc48-2912-4df4-73f4-08dd7b5411c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 12:58:36.1984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LuyBpFDsPTFj2/WBFQPMsk46+fpFSPh2b75VMTxw+KXnSdJSSnlTpsKJff6pyCERXlhu36NgpQLAAeG1CqfKwjiiftmmBQ46wzW8Vv4M0M/fpFbDWJsLAl1xf2Ss7KYe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4702
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

Hi Jan,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jan
> Sokolowski
> Sent: Tuesday, April 1, 2025 11:07 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Grzegorzek, Dominik <dominik.grzegorzek@intel.com>; Sokolowski, Jan
> <jan.sokolowski@intel.com>
> Subject: [PATCH i-g-t v2 2/2] tests/xe_eudebug_online: Implement faultabl=
e
> variations of some testcases
>=20
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>=20
> Implement fault variation of tests, which are accessing the memory via
> debugfd, by creating a vm in FAULT_MODE.
>=20
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index 84ba748c1..a29e5a086 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -38,6 +38,7 @@
>  #define TARGET_IN_VRAM			(1 << 13)
>  #define SHADER_PAGEFAULT_READ		(1 << 14)
>  #define SHADER_PAGEFAULT_WRITE		(1 << 15)
> +#define FAULTABLE_VM			(1 << 16)
>  #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
>  #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
>  #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
> @@ -1098,7 +1099,8 @@ static void run_online_client(struct
> xe_eudebug_client *c)
>  							   2 *
> sizeof(**metadata), metadata[1]);
>=20
>  	vm_flags =3D DRM_XE_VM_CREATE_FLAG_LR_MODE;
> -	vm_flags |=3D c->flags & SHADER_PAGEFAULT ?
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
> +	vm_flags |=3D c->flags & (SHADER_PAGEFAULT | FAULTABLE_VM) ?
> +			DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
>=20
>  	create.vm_id =3D xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
>=20
> @@ -1481,6 +1483,12 @@ static void test_basic_online(int fd, struct
> drm_xe_engine_class_instance *hwe,
>   * SUBTEST: set-breakpoint
>   * Description:
>   *	Checks for attention after setting a dynamic breakpoint in the ufence
> event.
> + *
> + * SUBTEST: set-breakpoint-faultable
> + * Sub-category: EUdebug online
> + * Functionality: dynamic breakpoint with FAULTABLE_VM
> + * Description:
> + *	Faultable variation of test set-breakpoint.
>   */
>=20
>  static void test_set_breakpoint_online(int fd, struct
> drm_xe_engine_class_instance *hwe, int flags)
> @@ -1488,6 +1496,8 @@ static void test_set_breakpoint_online(int fd,
> struct drm_xe_engine_class_instan
>  	struct xe_eudebug_session *s;
>  	struct online_debug_data *data;
>=20
> +	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
> +
>  	data =3D online_debug_data_create(hwe);
>  	s =3D xe_eudebug_session_create(fd, run_online_client, flags, data);
>  	xe_eudebug_debugger_add_trigger(s->debugger,
> DRM_XE_EUDEBUG_EVENT_OPEN,
> @@ -1739,6 +1749,12 @@ static void test_reset_with_attention_online(int
> fd, struct drm_xe_engine_class_
>   *	interrupts all threads, once attention event come it sets breakpoint =
on
>   *	the very next instruction and resumes stopped threads back. It
> expects
>   *	that every thread hits the breakpoint.
> + *
> + * SUBTEST: interrupt-all-set-breakpoint-faultable
> + * Sub-category: EUdebug online
> + * Functionality: dynamic breakpoint with FAULTABLE_VM
> + * Description:
> + *	Faultable variation of test interrupt-all-set-breakpoint.
>   */
>  static void test_interrupt_all(int fd, struct drm_xe_engine_class_instan=
ce
> *hwe, int flags)
>  {
> @@ -1746,6 +1762,8 @@ static void test_interrupt_all(int fd, struct
> drm_xe_engine_class_instance *hwe,
>  	struct online_debug_data *data;
>  	uint32_t val;
>=20
> +	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
> +
>  	data =3D online_debug_data_create(hwe);
>  	s =3D xe_eudebug_session_create(fd, run_online_client, flags, data);
>=20
> @@ -2521,6 +2539,9 @@ igt_main
>  	test_gt_render_or_compute("set-breakpoint", fd, hwe)
>  		test_set_breakpoint_online(fd, hwe, SHADER_NOP |
> TRIGGER_UFENCE_SET_BREAKPOINT);
>=20
> +	test_gt_render_or_compute("set-breakpoint-faultable", fd, hwe)
> +		test_set_breakpoint_online(fd, hwe, SHADER_NOP |
> TRIGGER_UFENCE_SET_BREAKPOINT | FAULTABLE_VM);

Nitpick: this line is a bit long. Otherwise, LGTM.
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> +
>  	test_gt_render_or_compute("set-breakpoint-sigint-debugger", fd,
> hwe)
>  		test_set_breakpoint_online_sigint_debugger(fd, hwe,
>  							   SHADER_NOP |
> TRIGGER_UFENCE_SET_BREAKPOINT);
> @@ -2563,6 +2584,9 @@ igt_main
>  	test_gt_render_or_compute("interrupt-all-set-breakpoint", fd, hwe)
>  		test_interrupt_all(fd, hwe, SHADER_LOOP |
> TRIGGER_RESUME_SET_BP);
>=20
> +	test_gt_render_or_compute("interrupt-all-set-breakpoint-faultable",
> fd, hwe)
> +		test_interrupt_all(fd, hwe, SHADER_LOOP |
> TRIGGER_RESUME_SET_BP | FAULTABLE_VM);
> +
>  	test_gt_render_or_compute("tdctl-parameters", fd, hwe)
>  		test_tdctl_parameters(fd, hwe, SHADER_LOOP);
>=20
> --
> 2.34.1

