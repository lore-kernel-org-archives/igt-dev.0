Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE8AC5B555
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 21:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A183A10E58D;
	Mon,  2 Jun 2025 21:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJ5EhY17";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B47E10E58D
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 21:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748898584; x=1780434584;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZbE8C9oGPVW4Wx5GJuo5XcM6Dl5xlNZX4vn7M+F7pBw=;
 b=jJ5EhY17CyAsqW8+BgUMBRLWVbAvbhL6Bk+4FNyw46gvxZ4lP2qkaSjg
 U5HtUgGuJ1P4mjoFfZaC8H4xFVisKAGhQlALkCvsF94/Jnx3pegO+9teQ
 VsaM+GQG6eDvpFa8krI06ZaJX9gu/vqvpTIrfi4tA+DwugwnOUcpwFFVl
 D2rgG5/3r0j6Jucm1WcEhoyMqH5tldago1fXC8AxYofEqJGbVBIW+PSkP
 e3RNP9B4mWT4mgAQcqzNtS5MEtl4kh0yibC4PdknA2iKZDnn5HUlDPIsZ
 ZpNwjYjVnnI7sCgP2KZhhbyoL1EdrLwrbPhLi+00Ggj5ik+2WjWDd7hs2 w==;
X-CSE-ConnectionGUID: kp20z3f4SNyusaugFN4p5g==
X-CSE-MsgGUID: yZRV9/btT8evLKzXweo0gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50978949"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50978949"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 14:09:42 -0700
X-CSE-ConnectionGUID: h6GGRgT/Sdi8jjH+28Gp/Q==
X-CSE-MsgGUID: yuYjdV3sTH2cL7YiyAAjlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="144527592"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 14:09:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 14:09:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 14:09:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.57) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 14:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5XH2yEKZ8fSNz2HR8uQTcr4gUOh5nPBMHxZm+3D2Yob3FWKduSbLBJ44sdtI9bJKiLyrh0drFzGjVQkIoU/LZdSuzE8S5Bbub6w5YqTodkDy0c4p97cEWxu+UbB5loi22HZdCPsFLjJSiv3QSLLzoL/9/ZXV6te1KDwFUQkmY9nwXHLkaQ2Ynrgbrl6MGR2Dn7hrqpxDJELPtP4MefYlnnt4i9fhD5lKMyKLV6tb5UTTUkCZ9udkpy6uZjgMuwxeZ8EiI8Jze3nlZ3mqHPSvGnRvUrsRolk6nksPspfIK3Okr44cdOqgfj6ju1IWIxZGP6gX+agvXMbvy9xZnAaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PG5qtfsomcZRQLv1/BoELSK4q3qShoy4EAO156n+0j8=;
 b=rWbl+XVbJkOALc/PsaV6b4A6hywJoovCeJwiyW6pH0Y2+L+/JLc5nSRhuuAiqcSm0AnyRFIKIU7It05knLcL7S+IrdglBqxRzX0rdmxvk11IN6d4vE7wdyavNXE9xfR3a/r9dPzEVP5YxZwCBjq/gchvq+MxbNxejLACMaF4OQxRkQNEB8c7VWhZgnf6oDJX5StM2swMQ7y5LEP3/p1mdKrKr3aXB5qHOB9kMOgXEIEcfv6luRMsHI9jm3vrBnsEaRydurwGEh8mcAsv8ypf6kD5peKaewGZSg1OtwQY/nSgfNwXyv6Dvi1lpjSxG8qxvb2P7GlI25LOaKEQ7EQmyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.34; Mon, 2 Jun 2025 21:09:40 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 21:09:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Topic: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Index: AQHb0JvCnpB9WjrebkeSiFKJEHnUQrPpyteAgABEq4CABibEgIAAAGNggAAi0ACAAAHvEA==
Date: Mon, 2 Jun 2025 21:09:39 +0000
Message-ID: <CH0PR11MB5444F7ACF82C01C9953BF9D4E562A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
 <b9aa7f22-aa4e-4f9a-9c5d-98d58066fcbb@intel.com>
 <0d4c919f-88a1-497d-84f5-25b8cb854d50@intel.com>
 <74ce12fa-b60b-4103-b92b-6f54a3696c44@intel.com>
 <CH0PR11MB5444AA07F3B7B81735949572E562A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <157b95f4-4090-4740-9c0c-48f10661ce15@intel.com>
In-Reply-To: <157b95f4-4090-4740-9c0c-48f10661ce15@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Michal.Wajdeczko@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB6328:EE_
x-ms-office365-filtering-correlation-id: 8821915d-a085-4203-8358-08dda219c9a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?koa5ZWx5gh2TRfVXWMC5HajjroP4Myxy+dseE+qEubFB9uKibbhqzNTb9niq?=
 =?us-ascii?Q?/d2TjOtqDk72VuxHwzaTiDRtAXpYrrge5aMauIhyoJ+kiFMXGVhWOSNawDd5?=
 =?us-ascii?Q?0JaPkpvjuiIRfTGGpzHIUrJuBVCcbYBU77EPfyVJRS/Mc1pmLeL4wZpF9YQT?=
 =?us-ascii?Q?d0JJsw1jVsGSBbuHydFyWFvvz5T/ILgUTUcVvqoqG3jiu2z9y7pjplZsHifD?=
 =?us-ascii?Q?h0lBy2e//qKhPERnrFRMCYjsbq317oKN/PJukBDlR2iyN3Nj8RJGb0OBUg7d?=
 =?us-ascii?Q?WBLQhxdPSL8MqM88OTX4mRFAU3UpbI+BrCW0v/6N13+JlCS9nCNqafoMkp3U?=
 =?us-ascii?Q?dCQWkL+xSbk9zBQQiTnBx1qBbFirefq5+xDtXVrGxkU7d1rXmUVzBqD/YFAD?=
 =?us-ascii?Q?C5CJDdn4LKtUEFoK59PJZCiX9zMo0t0NcN6wLc4CZzQEQXnifdp3QUdm/RHv?=
 =?us-ascii?Q?6wSHxsAyqfEeVShwequ2ZImKmDJZBWQQsM2zEQTjzMPvhpfRBggmBfs98df3?=
 =?us-ascii?Q?wf9Poc1beH1OWuwMiWujatJMrih1PsBJUyevTzuwJhoxyj03LggU9D8RfFNa?=
 =?us-ascii?Q?SUAAikEVBHu5wi+/KRwH3nkUkKpEwzEB4EogIrqZUAclheVsKqxpCHeQuWML?=
 =?us-ascii?Q?TdGCkNaVyJtQQ+sEwsNn7LkXOZHrrgD9vDSQKVxCl8Rt5nA1M67HVBx2Ka2l?=
 =?us-ascii?Q?iIMz2N65Z+zRm6PjBxl15l5lTDWIPcnnp/Wgz/XOPLgZDfGHZ2NX9tyx4/rw?=
 =?us-ascii?Q?+dzUN+Z06mG3pqLLCZBxCsmJsDrmL/YpSharJihH1KqGcgLZaOEyegnl7AOn?=
 =?us-ascii?Q?5c2R+BmXmmlCYBmZJG1joFnAO3ePQvOdUlKw8aX8yej3/vbmei1DCcw4qxM8?=
 =?us-ascii?Q?E+7oAozr3E21biYuDzkY+y2KJvck58itVx2RZDpJTQYSsF80SrSfJqxd+E5h?=
 =?us-ascii?Q?5yIf6G/UDFkUccBfx3IMEcDKcKBc/mQeJvm2++gi9edvw325hxUii1NHtyKa?=
 =?us-ascii?Q?ZxgPZOjo6n/05a52zVGn39ltzlB+oW9J7ZxXIdO7l4toqpz9MNfSLc9vRpF7?=
 =?us-ascii?Q?EoxqDqudbhF3OXzZOxbbtxpysrT3VBGRP6JV2TVrnGh5xDgiTVdLNxYePnqs?=
 =?us-ascii?Q?PAQw1nLXUkkGltZWXdnPtsAcZfCMsTMIz4Vv5IO0PEG866lv3iduMuwpx61z?=
 =?us-ascii?Q?scILzB9EkD+/LGv0WTGq8//mDyd9v5sxX5slXSO+hsuHFEKLP9Enbm0C7xbZ?=
 =?us-ascii?Q?M8ODcJ4nkUJwHtk4xf+lYCsWNBu+QohtFOE3XI/mr01JG1hLxKjB1nTZoZKo?=
 =?us-ascii?Q?wtBXE5C45JHVQBl4whI69RabfDcALv6GAOSqdug1Sj09CvMgYl6wAN9OCpkt?=
 =?us-ascii?Q?rRqprT3O31JmqKqxG6PGiWn1PhXZIEpZ7h0gTcmPBg862HcuUuDvlvf9qgl/?=
 =?us-ascii?Q?qG/lMIt04c78+pvApjGNs5QUeVlUIZEK+Yu9zibDUPbzuUe9tqiIXqG9Ex3J?=
 =?us-ascii?Q?d1zt9MOg49BYhe0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LR0iqAI62RrkDxYF2DWPH+g8PHKRxBWtkv6A5bcxJvlZVYgGU5XheisLOb9w?=
 =?us-ascii?Q?DWCPvJqXhtPpbHg2mEcupIVI06aJYLQa3pdAnd938uClsRo7jYMpAkYu+UrC?=
 =?us-ascii?Q?FcX9PzH0TgTiUI72WoOLfN95pGzRsnrIWFtBHW6KO2JfOdWKjJKqprXXFIan?=
 =?us-ascii?Q?TZPTaV3BZU1/PFXhQAuttyRt9m8i9QHJMuEFi0rzJSA7F0MqYZFidPSjFZPn?=
 =?us-ascii?Q?dy1XcVVEzqEySpuIQ99y0P0vMuhCdJ43daFC+/2pAjoLBrna25NUdaMSuX0y?=
 =?us-ascii?Q?/n+NJZdDT7dg0HcwMoauaeZKsJcKP+lQBpaWf/mbnzPNjXQxKvucPf3W1cOh?=
 =?us-ascii?Q?arJiC+GgQo8zwaLoeM4O5V/B1nWmrjA7eutSZaQF6UZQqN1g9yYAUtXf7+ry?=
 =?us-ascii?Q?Pu3iLZ3it6R9PUvVJ3iaAqh6pfIrkcBZQlhqdXPzTy3ZIiwZO+5EozX2rmAo?=
 =?us-ascii?Q?6ZpwY76IWDPZwwaCVu/AkJ7xyp9U6xGzoa/R+0qAlKsx3Joqjqowear7MWEJ?=
 =?us-ascii?Q?ETtf+vWGaEq+pkYj2dm6ZH181PJUQvLqOoPCDgIyUD9hi5f8uLWaYEdRDUUW?=
 =?us-ascii?Q?xYQNiFLq9sum2jap43+0WE17v1uyLLO3pyEov7RmZ9oSGwUMkEiEsL4qVZSk?=
 =?us-ascii?Q?zPYHV5YHmquQJnAS5Kd7o7m+ET02hJ4VFDjxghO56UtNr+sIalibyDS6jGk8?=
 =?us-ascii?Q?M9Uj4st7HaXgLWNAG0SHowpbvDG/qOUNBps+gGzOMYMUEvLUKoBc9Ccwummh?=
 =?us-ascii?Q?YNM+hLgGBC+RuzswwqF6BRgUYQGPHyD5HHGjk8NwQHuRX4wj1sgH2EGCoWqZ?=
 =?us-ascii?Q?U3ckzEErwm8aKe8+vlgwbbKUliX+w6KqOydzfQkSybRtivHfZKb9ofiDKGSf?=
 =?us-ascii?Q?poQJUBFMmlvyW4PWh5Ug+Ue15iz7AP6f/WYz0+eMQfTlIkTZA+Ng8xMrIUrA?=
 =?us-ascii?Q?q1bLvuSAjB/PjwtErzzrIsrR9FW7QUSaVxSRCNhUF64ig38DZ9qOdrOUtQzt?=
 =?us-ascii?Q?q/Lk2O5dcM6WS3uvS1hLKc2uuaGDjVrQ3HIQMNhbhCcdTGMhE+P83ZGBAvKC?=
 =?us-ascii?Q?OIq/o/VTMxGqkdbAZ47NT5Ec4rPm0m/w+qZHSXJiDM72LpCSW7ShRtz0YeHC?=
 =?us-ascii?Q?st+xTVWRGZxySy2J+rSaGk0RMprC2ftQ6QqyXlCQ5r83SW2PtrdUyhYMiZdM?=
 =?us-ascii?Q?Cdyzb55Rqp3JxR6wrNTE8SS6s+VZsh0XCLi5oN8MRnqfQrp0xTv7BgyAEOP3?=
 =?us-ascii?Q?DCxh18izEnLrwTcFccbvymUVqI8EDABrHFFEVMU4Xmh+tgl77tsB9FoDb/9Z?=
 =?us-ascii?Q?4sWhLUwAhIpTkF6VcXr/IgWyBR1Iz0e5H5e0tcF6rpw2g8JwtkDw9yZLBe17?=
 =?us-ascii?Q?Im0q2IrNAy10as3GnG0JbJKfVmdDYRoozgo04516z3G/7DT6TFb9uYsV7EcB?=
 =?us-ascii?Q?s2Lrqr9VoPXTuGEWhLFcCC8/Hl75aUN6PQbJ6mxWOroQehp7bYPLoKvu0pCK?=
 =?us-ascii?Q?6tbnVykaxXEp2BMd1gqW3DZlv4eQuHLUEUphBXAIBra46iPtQGCIZ0DQi4Ui?=
 =?us-ascii?Q?gljW7gYezFhA7W73B4Cfq6SErDbqG/7XyDNw4/Ll?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8821915d-a085-4203-8358-08dda219c9a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 21:09:39.7258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S8hLFkOlmGINwtC3O1vzrUeNWE0QUD5I6a+f9g0L6F4tSgY+/zQQ5fTI6vJxi+FI/KdVAnUolPU7aH2FhBQJrEcYYuVCR513prKjWdYUHOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
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

-----Original Message-----
From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>=20
Sent: Monday, June 2, 2025 1:32 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Wajdeczko, Michal <Michal=
.Wajdeczko@intel.com>; K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>=
; igt-dev@lists.freedesktop.org; De Marchi, Lucas <lucas.demarchi@intel.com=
>
Cc: Dugast, Francois <francois.dugast@intel.com>; Harrison, John C <john.c.=
harrison@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all error=
s while injecting fault
>=20
> On 6/2/2025 11:30 AM, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> > Sent: Monday, June 2, 2025 11:26 AM
> > To: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; K V P, Satyanarayan=
a <satyanarayana.k.v.p@intel.com>; igt-dev@lists.freedesktop.org; De Marchi=
, Lucas <lucas.demarchi@intel.com>
> > Cc: Dugast, Francois <francois.dugast@intel.com>; Cavitt, Jonathan <jon=
athan.cavitt@intel.com>; Harrison, John C <john.c.harrison@intel.com>
> > Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all e=
rrors while injecting fault
> >> On 5/29/2025 1:29 PM, Michal Wajdeczko wrote:
> >>> On 29.05.2025 18:23, Daniele Ceraolo Spurio wrote:
> >>>> On 5/29/2025 6:31 AM, Satyanarayana K V P wrote:
> >>>>> Currently, numerous fault messages have been included in the dmesg
> >>>>> ignore list,
> >>>>> and this list continues to expand. Each time a new fault injection
> >>>>> point is
> >>>>> introduced or a new feature is activated, additional fault messages
> >>>>> appear,
> >>>>> making it cumbersome to manage the dmesg ignore list.
> >>>>>
> >>>>> This new patch automatically ignores all error messages from dmesg,
> >>>>> eliminating
> >>>>> the need to add or maintain a dmesg ignore message list.
> >>>> This would make the test almost meaningless. If the test finds an ac=
tual
> >>>> bug (i.e., an error we didn't expect), how would CI detect and repor=
t it
> >>> but how can you tell upfront, without actually running a test, which
> >>> error is expected and which is not?
> >>>
> >>>> if all errors are ignored? The only situations we would still fail o=
n is
> >>>> when the kernel just dies.
> >>> and that perfectly fins, sine we should look only for BUG and WARNs, =
as
> >>> it's quite natural and expected that once we inject an error, the dri=
ver
> >>> will likely fail to load or proceed, and/or may report some error
> >>> messages, or even try to silently recover, *but* it shouldn't ever cr=
ash
> >>>
> >>> and that should be taken as a test goal, not that we look for specifi=
c
> >>> error messages that could be changed, omitted, replaced by the differ=
ent
> >>> driver release or when running on different platform or function
> >> The patch does not look for WARNs though, it ignores all errors with a
> >> "*" filter, even WARNs. I'm still not fully convinced about ignoring
> >> anything, but I can understand the POV of ignoring just messages with
> >> the "ERROR" tag, as suggested in the other replies. I'd be happy with
> >> that kind of solution.
> > Huh?  I thought the alignment was that we were to ignore all messages
> > that *don't* have the ERROR tag, not the other way around?
> > -Jonathan Cavitt
>=20
> We are injecting an error, so some messages with the ERROR tag are=20
> expected and should be ignored. The question is whether we should ignore=
=20
> all of them or keep a list if expected ones and ignore just those ones.

Keeping a list of expected errors and ignoring just those ones is what the =
regex
does currently.  This chain of emails occurred because the list needed to b=
e
expanded to suppress more expected errors, and that caused some concerns
among reviewers:

[PATCH i-g-t] tests/intel/xe_fault_injection: Ignore enable activity stats =
error

If keeping a list of expected errors is a better solution to this problem, =
then
the above patch could use some additional review notes.
-Jonathan Cavitt

>=20
> We definitely can't ignore warnings or asserts, as those signal that=20
> something is going very wrong.
>=20
> Daniele
>=20
> >
> >> Daniele
> >>
> >>> Michal
> >>>
> >>>> Daniele
> >>>>
> >>
>=20
>=20
