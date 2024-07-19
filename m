Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADFEC3DA5D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 08:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4E510EB3A;
	Fri, 19 Jul 2024 08:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXG6F/Ex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E518910EB3A
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721378884; x=1752914884;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SzNQ9Z3vRbh/kvDfTPYQJ2+179SWk8snUDE6HYC/6nA=;
 b=ZXG6F/ExovbySdNJUucD5LWXsiTk2KDoKDj+OSx7x4zv7MjJp843p/mt
 wFayKhmMd6fWdorZDIxN0k3Q9HjYOYVB3rKYbDmTZBIb7urx78sZa4rkL
 lZFnftXsXm6AblYy6jFf6Ou3siqsp0PH6sgwvPpavswN1v1We+gM6/Twd
 RLybG5TADHFgmwNSSLIQGDBJ5jkifLSFzbWSLOjowqytXEOnWETTOEF49
 YCqEOQkGDvaM9mELRWK8dyundaFZbNmaSSNO3GrLNBPf5uULKv3ldUJdp
 2GDiIxFezWM6A0JJlTG/ujnDRcMNZBhc+hRsDISwZHVz3Q7b9F3hfdDKF A==;
X-CSE-ConnectionGUID: Xo6oz1xJSDqKFHWe3oMrEw==
X-CSE-MsgGUID: wrcFbCKeSiOELvM8hBbtQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="29593226"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="29593226"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 01:47:54 -0700
X-CSE-ConnectionGUID: dtTxfD6uSvmfP6IlJno2Fw==
X-CSE-MsgGUID: lCmlkJu5S964zUZGpEZDaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="50741075"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 01:47:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 01:47:54 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 01:47:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 01:47:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 01:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJMcfg1Hf/E56uMz9LM+JumadoNjZnU2mdmMZzL3FaX4bgsicgBjHA3OK3vgcnqqdmC7JjCP0rOeHzXzkVFNRkKXmFr2beoFdYGPMF6gveMIZL8oZUWLymxdHEHm0QorRfJ6ngxF6zUt/0ECQvEwIarw7pvvghk8v04mnANo/LeYMpYoyuNfS54pJiFcdTnaVuZDIBmRoXBAAWznqo2DRNs5l9J0mQ5/wNfuiI3/ehrsQhMIDWS+fwbHCK68EWYXUTf6//QOyplEiTNigYw7yuzcgMZFrDGqF0fuoIZau3sTmHbR5GrSjCXcmc9HBW13V+VzOhHBWa9ASORyd/wWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42tRDWrZh2vyCGaR4aKjbxK8Tg6S5zDPkmgdR06WHK0=;
 b=u4IFaMtV5BZAKgAT98ARPYr6KxhVRYSyMtFIIcb1wDY0Q2z8ZJwaVH68Ny3jmGyJcMjHvyjqMCcEK7ybORhQ86SLJXHdIJD134BdCBoGTTGuMg+aH/Vgjz1b/UbIwb7IMH/nOc8vKlgD11yfxTDNicFCURqTLqrrkqBoiB3U8xIabX7UdmDldTKzuAxMRkH9cT4R3VYMarXH+u39X+MFtXIyKvUYs3GSVlP23ti9FspRab+MhRDEpU/7SkCTLht3zCAgzA4cQOWSuurxatx7NAabCkuydoUjxasbFAc7YIsJP8is/hHn18WHp6rqZiZG8MVDFb4KFbj6LN14DqVhcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM3PR11MB8733.namprd11.prod.outlook.com (2603:10b6:0:40::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.17; Fri, 19 Jul 2024 08:46:59 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%5]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 08:46:59 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_pm_residency: convert all tests to
 dynamic subtests
Thread-Topic: [PATCH i-g-t] tests/intel/xe_pm_residency: convert all tests to
 dynamic subtests
Thread-Index: AQHa2C5ttB0dStXimUWQAFnDqRipt7H9v5mw
Date: Fri, 19 Jul 2024 08:46:59 +0000
Message-ID: <CY5PR11MB6211FC8FF92CA7DF6846080495AD2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240717100057.4186183-1-riana.tauro@intel.com>
In-Reply-To: <20240717100057.4186183-1-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM3PR11MB8733:EE_
x-ms-office365-filtering-correlation-id: e189fc14-29eb-4207-1743-08dca7cf5a6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?sG1yRKbkpRCa9jycMWu565KGqjnq+wphUugAVlTb02M1sKvdpOwb7OFXPOBn?=
 =?us-ascii?Q?lQ/biXmJ+UA/3TuTLgu2na4In/76AqrKJ0BRZYLWiAv8aWqRq4MpflBf7i7q?=
 =?us-ascii?Q?AVBFpJ3oCTojw0CKARG7W6UKKmwPi2ayhFSwdd6xki1Z/heoLy0NN7hkvcGI?=
 =?us-ascii?Q?S1hE7SWJNHlG1unNID+Xcr5z1WVT3THaOMTfGfQxv1NBcOZHEHFsaolgy99j?=
 =?us-ascii?Q?9ctAwNJLzUCVlu3M8HS5A0JKFj73kU3HnFGsX9kdRjnDZibMIP3bk4lDJAv/?=
 =?us-ascii?Q?+FuGICgadJ//HWP1DVRSRSTe/6utQX9YWsFmBW7w36CO4/mv+c0IZG8xkA3o?=
 =?us-ascii?Q?sZ01aU82bHiKygJIE1/fSeHDkW4jD/LCEvxrMsh0vQKGnz1YNYSlfEPmVPXD?=
 =?us-ascii?Q?uVykNwogDLwA7WoT3IffehzSc6rK5Pn0Edcqxez0JUPptAUW34iGR4g6ozh1?=
 =?us-ascii?Q?0v5EEtQ2KisNm09kXCUeoJcCvaoovsu5wW9GCdGpKgwI8Re7+OO06dEerrYm?=
 =?us-ascii?Q?f1QvUSRC8T9mmm7048T436mnSWEEYjVXnsuOfo0BUbySQPOaHSnXplN0FMow?=
 =?us-ascii?Q?cuaLQ3E1ymc0b7Mx9kOwt9NJJz8XmL1IIuicOYrBrPxYTiZ8eO0mR1+8nUsn?=
 =?us-ascii?Q?zRh9TAmNUIMNnVfUsNEqtLnoeUHhcE7gEb2gjfe0+XZxd/7l6o1Eg8IymHi2?=
 =?us-ascii?Q?s1K3mi4k/1C3vHwRIfTVPNJB1x2vAwgeuV5SczGIq47qqdPOYwkj1Kc1w2sF?=
 =?us-ascii?Q?/N+gIjb2GGtO+GWr3Weu+enANMjjb/evxSHFzwZulhPugBJomgpYXY1tSxkx?=
 =?us-ascii?Q?e37Ucw+BSF2AkTWCAcmVswmPTdiS9+bdU3cM631T6r10ekaL0oEXxyDEdK1U?=
 =?us-ascii?Q?IlzCcS/2rVvVRjKKUSx/X7ocUoDA7ME9Su4nvxWYTtQ9+ObHr5Bm7yxXiUZH?=
 =?us-ascii?Q?qNHGgg6PZbRtYS0kxkke7YJrzmzSz8xtZ05Axn1ln7XEiC5AzvGTqSobwaUC?=
 =?us-ascii?Q?tgW71cLHEftINCeiHVqdIkNh+SymRa6Bz1xTr3bRs3SYXFPJlVB65UGqPaan?=
 =?us-ascii?Q?i1ISTjDIA1C8popt9pG8VPwhFuwn24gYgIxKKUa/nUAg7Feomn+fiKY1dDWh?=
 =?us-ascii?Q?jHmF42O+qb9YqXl68yfzDPTiW6+06uBx79XgA+EMZVC+wu4d3ZKR7lMVuwt6?=
 =?us-ascii?Q?+fOL6rU7LXoUkdaoajHWbCGa8mymkVCwqcxCmaYJKUByS/4g61el0atm+eGQ?=
 =?us-ascii?Q?o/nI5EVzsDNo35luwXAXxR/4Yy16dSi8azsu06kKFbE73OHDbTlR/IIqueNx?=
 =?us-ascii?Q?l91KbISF3+bRqTC2eSzlNukJLQ5ctCcLeADJ5nStQzf96vXNve5jIT0xtG/L?=
 =?us-ascii?Q?B4Jqx381JdgiHaafqc+WFcX8vEYbIhoU8DQH7YmIVHlXIlpI+g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0BEQAwaYzN68vaNW94qdOrxZMp/+bpzjW+AHegU2YzHVpHga/9PV8UjFCISP?=
 =?us-ascii?Q?zdQ6N/W8No8F8uZWnw3fdlgmofS8Hx3RngfF4XkMQWejMAge/sHQAAceKUej?=
 =?us-ascii?Q?p/EYfts7kbPiaiqVkIWWrTQpFEb5XwOZOeuimVGPryJv7zzek76jwq/MwM/k?=
 =?us-ascii?Q?KQLS6c90WWt3tMFx3QjS+CDpg6RftDJndRzsIIQUJaeNhspmg12kxjLVeMLn?=
 =?us-ascii?Q?NqDp56s6fsCBWjDGysvgJU9dCldDaEINUhGE1qPQ1iug0xljetPuNHos42Zk?=
 =?us-ascii?Q?h+ss6pZ9ydpYxDi/6xzkk60BejVw15wJm+kWdwybSngKOtbeTszhI0OrxyyK?=
 =?us-ascii?Q?VzhJ6yCTG5GcXlxuVAErth9y3a59bDlsmiaKcJ2u2224tgXu9uLSrE1hqXOQ?=
 =?us-ascii?Q?+yOPtAmGbbcGGpcqO7/fDYlsVuD6qOfI54OLOESJWJL6km53cl0By0fdDIXP?=
 =?us-ascii?Q?aS6+Sev3Vb/062AE8rho6bYPv43Bu+oYV0UvdxXidRTTplizCptVYpUnUp28?=
 =?us-ascii?Q?bhERvkX1bsh+MtXIzmcwOjwoILChZ04KRd/8/oORgvSet871YVojElq4aoJU?=
 =?us-ascii?Q?qJ9RMmzcAlzzwv02WRNaH+NLiM+8ZS2gztsuoG1fo7SnArwk/RJOA7qFUfJ5?=
 =?us-ascii?Q?6GbWXT6RzHp4FTeF7GU5tPnJ6o60e7aZfzI5L4AgE5loDAQtvgjiTrkOvW41?=
 =?us-ascii?Q?bppx+FMYt4VdhPUnZnKJuRGkW+dgroj+fiDE90SPmA8/ZB2qmEIvk54QVS+V?=
 =?us-ascii?Q?lexHbUHMAtJ+Fa/R3+zkdpwCRPDtXBUm1B9ka8r1DfyH46127Lrwq/tAU7TS?=
 =?us-ascii?Q?z7yecCQH7BoVAkO0GyDIkpNSLPvckO+KHBjp5gf7anD+kk+6Pc9jir8BHRsL?=
 =?us-ascii?Q?x4E8mSbER2PGkUgKOwsx5B/k0Whoyc0i1YiKVy3wkrb/vyVIYe2OUtH3ok1K?=
 =?us-ascii?Q?RF6qd1EtlKn8n5V3QY6kRrkcmJb/N2oc7bYToUjzR7TPnQJg5991mb8RH14S?=
 =?us-ascii?Q?9sk99SWP5xxkpA/SpfrHiWcEwwKd+E5BNZ+8YVWUUNw8lqO1vo5zE4p7pv3V?=
 =?us-ascii?Q?2YyOiFsit7CDnxG4XyGPqSTHWAWOBRszPj2WT4kTm/Dtjg5rXKosGHSCH9HC?=
 =?us-ascii?Q?9C+W1iehGC+UdbtmtK/NMbMzPmYtnzLs3AcPzo+ONAlMh72nFAdRmnPTtv+H?=
 =?us-ascii?Q?a40DqeydUFriazqgJTBSU0I3xU+a3bb4yDZ/QdQU5crRuQnv3cimMhU7p0Dd?=
 =?us-ascii?Q?rbP31yxDaldjEZyaxpYjjfB1EOegTTga1dKqi/kNeQ4UUKBKgB4HC06dzM/x?=
 =?us-ascii?Q?9rDCWmxRnnZS6P1E1C580vIHg5rGqhXjc1bylUx7ohrZApBViBLhfJ0P0noo?=
 =?us-ascii?Q?2DfRXNcues3EY/obSD0Jzb6cZUWlH9b2+D5YY44cslUHNJ0D4eoJs+oPVqDm?=
 =?us-ascii?Q?dC4meM/r1TyBBy1aMnSDxWX94QjeoSzz2PXogeRes4rMwU4Ts+e+dQb2pYuD?=
 =?us-ascii?Q?BTM00lNd1FKl9rTv5Xffr5/CA0qw4GkDW+u7Gc0B0uL0pj9EKWxXqOLRsvIc?=
 =?us-ascii?Q?VeIoXEj9JpY9wnr7wqa0r3SjDbbrpvctHpGZypUd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e189fc14-29eb-4207-1743-08dca7cf5a6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 08:46:59.6485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CcDqZF3gBz+Tafa2KQwBTixHV8INzFPMjCsEkpN5wZZsZsvnE6+Mq4lHyctLPMBs+L8ck1bkirnbfcS+2CEg3q3gFJkAD3z/p3WqhPRXWe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8733
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



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Wednesday, July 17, 2024 3:31 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_pm_residency: convert all tests to
> dynamic subtests
>=20
> Convert all tests to dynamic subtests to identify which GT the tests are
> running on.
>=20
> No functional changes
LGTM.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Do you need to add the new test to our test list ?
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c
> index 367b1027c..51735d887 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -233,8 +233,8 @@ static void idle_residency_on_exec(int fd, struct
> drm_xe_engine_class_instance *
>  	unsigned long end, start;
>  	unsigned long elapsed_ms, residency_end, residency_start;
>=20
> -	igt_debug("Running on %s:%d\n",
> -		  xe_engine_class_string(hwe->engine_class), hwe-
> >engine_instance);
> +	igt_info("Running on %s:%d\n",
> +		 xe_engine_class_string(hwe->engine_class), hwe-
> >engine_instance);
>  	done =3D mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1,
> 0);
>  	igt_assert(done !=3D MAP_FAILED);
>  	memset(done, 0, 4096);
> @@ -321,35 +321,44 @@ igt_main
>  	}
>=20
>  	igt_describe("Validate GT C6 on idle");
> -	igt_subtest("gt-c6-on-idle")
> +	igt_subtest_with_dynamic("gt-c6-on-idle") {
>  		xe_for_each_gt(fd, gt)
> -			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
> "GT %d not in C6\n", gt);
> +			igt_dynamic_f("gt%u", gt)
> +				igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt),
> 1000, 1),
> +					     "GT %d not in C6\n", gt);
> +	}
>=20
>  	igt_describe("Validate idle residency measured over suspend cycle is
> within the tolerance");
> -	igt_subtest("gt-c6-freeze") {
> +	igt_subtest_with_dynamic("gt-c6-freeze") {
>  		if (xe_has_vram(fd)) {
>  			igt_device_get_pci_slot_name(fd, pci_slot_name);
>  			igt_pm_get_d3cold_allowed(pci_slot_name,
> &d3cold_allowed);
>  			igt_pm_set_d3cold_allowed(pci_slot_name, 0);
>  		}
>  		xe_for_each_gt(fd, gt)
> -			test_idle_residency(fd, gt, TEST_S2IDLE);
> +			igt_dynamic_f("gt%u", gt)
> +				test_idle_residency(fd, gt, TEST_S2IDLE);
>=20
>  		if (xe_has_vram(fd))
>  			igt_pm_set_d3cold_allowed(pci_slot_name,
> d3cold_allowed);
>  	}
>=20
>  	igt_describe("Validate idle residency measured over a time interval is
> within the tolerance");
> -	igt_subtest("idle-residency")
> +	igt_subtest_with_dynamic("idle-residency") {
>  		xe_for_each_gt(fd, gt)
> -			test_idle_residency(fd, gt, TEST_IDLE);
> +			igt_dynamic_f("gt%u", gt)
> +				test_idle_residency(fd, gt, TEST_IDLE);
> +	}
>=20
>  	igt_describe("Validate idle residency on exec");
> -	igt_subtest("idle-residency-on-exec") {
> +	igt_subtest_with_dynamic("idle-residency-on-exec") {
>  		xe_for_each_gt(fd, gt) {
>  			xe_for_each_engine(fd, hwe) {
> -				if (gt =3D=3D hwe->gt_id && !hwe-
> >engine_instance)
> -					idle_residency_on_exec(fd, hwe);
> +				if (gt =3D=3D hwe->gt_id && !hwe-
> >engine_instance) {
> +					igt_dynamic_f("gt%u-engine-%s", gt,
> +
> xe_engine_class_string(hwe->engine_class))
> +						idle_residency_on_exec(fd,
> hwe);
> +				}
>  			}
>  		}
>  	}
> --
> 2.40.0

