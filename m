Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9035C5AD49
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 14:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F7A10E653;
	Wed, 28 May 2025 14:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6hcrk5/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2436410E6E6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748442085; x=1779978085;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S2ZpjDPudEXE3OoqSRDqFY6dM3/7jHIvLoYbN34lHRo=;
 b=e6hcrk5/lRcADjLDmiXyheuPTP/An6lehK+QspCWkZkiBz1LCocxR+if
 MrYNE2voDcKZ7Oupp7AFj2Sos8jLxb4KQFKQpzAgHwouUxmlPbpqPHI3k
 xuX/G0JNTKVjWN+/f10ByJeuLRFcA8CnHXP33Sk0xAgkWB5yypWUfdNOu
 UEY8Whj15aCH6MJlqyyF4v0YLpb/0yyxPfIh0qMQoe28PUo8NTKt/soIc
 LlQN8nMhSRnBRaml2R6IxGf7QHdJpyeuoDpNHTks9n6KXZhfo2IDvrMSu
 dZw3INF6Lk1MvVS//Px/elbb7S8buAU/PJZdEAH5hJfKrNyExKzPLPl4P A==;
X-CSE-ConnectionGUID: q/UOARRvTuywKnK6WbMDGg==
X-CSE-MsgGUID: wySDbbApQtGGdj7rAMGA0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61818212"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="61818212"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 07:21:24 -0700
X-CSE-ConnectionGUID: agtx1+LfQCST9F1EavaCOg==
X-CSE-MsgGUID: BSiA/207SuyPfwv5zRdG8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="148021015"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 07:21:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 07:21:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 07:21:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.76) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 07:21:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEeOhYQXuotn3OU2YoRePGKfwHTRNpFeSJGJeB9z/jHoHEoyxrcww5efVq1kEjG9CnXNuhabdyOXPpL3k2vMTUDcx4diUSwSOaD57CfW8QYOKMw0yrStrJZIXYvyhVymi7h86xDkoO+k3E3PWXikHFcuvuTm1IHTUTVJP9/ZBvjc/Yqf/1ceNyUMzPU8f8Du0VGG0dUnpfOIeqUAGT27KUh9BYRHlnecw+CCO9Ob6X2fvmgnkUL37TntdwTL+glw5QvUiI8gKK2Idw+CfG2ckva5V2m9ZtebrG44CRLuige5AwZE7PRNORSQnspEDOk9sdgLlPpkKzKGSB1NQ2VelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A76o/uwL2Sjg/y1p/2eEv6o/zwTAf5bBwll3bgGJD9k=;
 b=LssnDH5gucitixGRTcytHCrMkoU3WVoksi+Hm1I86bQ6GaF9zZeTICCjWSjxdpwPCX7P6+e6KDg8VFaUpE9Sbt5qN7xmlaSMQP6HtQlZmz0eIT7zaoLh0WRDTeOv/ZBDDOOKWVLPSm2vbTqb7YjtKkW8RtW7LrujFcL5awZBcuirqn7XILe6E7MXyZ7gLGKxbK+eOY3bfazA0AH1J1g4AGOaE1+GIn+eQW11klMW9TlW90ciVisd0XWITrbgdznFLPAJ41r0LWugDM2+c2LnwCit2SsOAGY6uI3GGyqniHj3295TG+UBswpxH1f0Fswz8OiacWvwXGsbwf8DtMDZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB8860.namprd11.prod.outlook.com (2603:10b6:806:468::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.23; Wed, 28 May
 2025 14:21:16 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 14:21:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_fault_injection: Fix typo error tab
Thread-Topic: [PATCH i-g-t] tests/intel/xe_fault_injection: Fix typo error tab
Thread-Index: AQHbz9r99lpgejpkhkqD4DwQPHJ3kbPoF4Vw
Date: Wed, 28 May 2025 14:21:16 +0000
Message-ID: <CH0PR11MB5444BC8239B1340D90A14155E567A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250528141454.2729293-1-zhanjun.dong@intel.com>
In-Reply-To: <20250528141454.2729293-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB8860:EE_
x-ms-office365-filtering-correlation-id: 4a2f1e27-7a1c-4daa-cc2d-08dd9df2e875
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?HJRPlrnJ6P6m8NbG5a66S91b197D9RbkfJx0ugAdTqxI3fPFwdCEcVI9bL9h?=
 =?us-ascii?Q?IZlw5F3SU++lKpwBOj6XPwEQrm0ZPomKggPTD0lBwvfcbQzSrm1i5sVfIkZu?=
 =?us-ascii?Q?DWLch1UJHB8a/iebDS7dgBx5NKRZYJV3rz+VwnHN45NUTKaVBUWldiSQDcHL?=
 =?us-ascii?Q?td1Ut/hJRYbYysyqwHUagz/GlYDOaf0o1QNYcim29tDOsZFGwvfEG/mQQ1Jp?=
 =?us-ascii?Q?f+a3/QYXR1A5/r62IoXdGwltlnXImYFkJ4CE3BQj4kyRaEPy5hWKTXgf0JCy?=
 =?us-ascii?Q?Yetc9c4ceuXh3KyBiPeqHnw8JiwrSLpGpro/oPbF2thpRF+MX9c6uEwe7sD/?=
 =?us-ascii?Q?qRx/HyE1fyfoB0aXU36OYLL4ZoupK8C3wzprkABb6V8UszkohsBRj1s0q+JH?=
 =?us-ascii?Q?vtcam21aGM6xYjTV8QhUvvIJy3Q1TmfhoDN/q1S+1xNzUlJfa+nuz602X0rB?=
 =?us-ascii?Q?V8YO7iff5XUiLZum39UUZPaacuRXyGHOUfyoCHI0pyzvEZ1PS1goOhpaWw4t?=
 =?us-ascii?Q?nHo27yR1nDdNP6DpgPP8BSWUC64A/pDeE58vsEiy2yK5A91SXqADtyzUGKbU?=
 =?us-ascii?Q?wzFDAmI84NcqbXOWw+IbWDOOK47U21UQWtSUTg6Um7e16yhAAKMbZxIJrl4d?=
 =?us-ascii?Q?b8Z7lGnrNXf2Ox02kFwU6TCZnxHbx7AHADtq1JAqIRO4atYe/4kT/DD7FHOR?=
 =?us-ascii?Q?o0bxAu0n9eSu0znookd3gfFV8wV30bhAtd8L438bfWhcIYhIAoHUieJOEyWJ?=
 =?us-ascii?Q?QY7MYxefS77gP7AgM83UX0sGWEBk76o3DAeTas0iTMyK8BL8CuSmN5GN/oTL?=
 =?us-ascii?Q?Fw4OPNXDTBy/OXIxTs6F1yPmGt+2tb+Cf1k/2iQwp7VF2A1YFRUNqSnTJAl6?=
 =?us-ascii?Q?iwtwXqq5kZxbVLqjL33hhAORKPe48F7ZG34ArbyjwflNabAjWsgZnOnc1DJd?=
 =?us-ascii?Q?RUnElrekHDo8OZyKCzY67bsyIIxGtZ5WuVztF1ZYyJRqQ4M+HIe0E+oO2qA2?=
 =?us-ascii?Q?td/pya6KhOEBd8NaliytuAL2VULMBoIVY+e2Qr7eSByrM5JW1X9in7mug2YL?=
 =?us-ascii?Q?VsSJ/Gn/pQcp3fRxGKyy7mSJYkZ7h5FhZxF9t66zS7NH9UvieelfKt32evQW?=
 =?us-ascii?Q?ATsvohWWl5cMHLzOf1Lz4JuuHP9aK3vGfoBIHIeFyBIvuRBtPNfxUwP/4Bwg?=
 =?us-ascii?Q?V02jwunHvw9hEDV71h5rLo63mh55Gscho9NdpmGl9i27ygUuK5LnPq6tbMKJ?=
 =?us-ascii?Q?1J8x2GayKMf+s9TG8cEHI5BhTTnpwRGIZseK47TT222U+9Lj7TQx2aGm2mP8?=
 =?us-ascii?Q?6xTfBVj7XIjsMfGngK2MSXFhQmkNJ9xJ1LGkWfeEtexIDQ51YtXefsuLGUZS?=
 =?us-ascii?Q?9sSLxXXutnlQx+FVrc7jLwSLjOShO5DjcmvTBQ8yr4U6kxHDvvYK4P94V432?=
 =?us-ascii?Q?Okw4AHROwSp3WPdwv1zfif3OgOlupu9xioERrZJes+c3YUe2XEAE74Ok3qqD?=
 =?us-ascii?Q?nFXHFp5riPmEu5M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ww+y7QgonlsQhdLI3YBSxEweEUK5mrGaY0pxrM5WgvEKyTKG0T6g3kjBpc6J?=
 =?us-ascii?Q?WOMhisH042arl8hJ/MrGI79WxMjclGPTeMkLFrYzRAVflX6ftj4qT6BCC2Kj?=
 =?us-ascii?Q?mCQENavP2yRCZIFKGxuu7adpMkCjxc17M5sllM2CtZ6fe1ku30e3PnJfIASE?=
 =?us-ascii?Q?5gEZyg4VjCngRMgadWwFYWweff2DroYO5se+YWqjcUpdds7iZm5MQixb+5/t?=
 =?us-ascii?Q?uEoHrzTOK8OraDSVWT+M10JwIR0JXA3pC10AAY6ZRxYgxLiyxzqAYTxzjn5r?=
 =?us-ascii?Q?GKeUVr419DHF0ANF/3BfE2j4KKPlRBcV48f+xsleL/5MOru/qDUxerb+9zTt?=
 =?us-ascii?Q?7r6YaeCBeagebzv9VfWkMLmeElW9qyztamcvSF8Hd9mYeodODeRb9NUB53hK?=
 =?us-ascii?Q?WHDDI9PrtSX5CcqOymHQfvR6X9UZZYxldm3n2F+ApQBCDIKBEx+cupvnUFwA?=
 =?us-ascii?Q?oV6bC4ZqDhjlUWPgWFpY+wi9duZyuJ/HnVU93W7yuYBM6i4LGjxiqXCUdHgS?=
 =?us-ascii?Q?qpCVeyV/TVeJ00e8sZuRthNh4idirOwybS0tQQWVIfSzNZQavRhtsM6VfHvE?=
 =?us-ascii?Q?8V+rahywGZ0Qz5Z0D5+jxM0ySqDXZMTxSfJ4cHIt0QzVY7F4GUxvTrAffr+y?=
 =?us-ascii?Q?CY9MEEyKqWW5F+0m8opC+nkWFVq6j9oCF5fwxXOW6jNDG34ZJFI3c4PTcvWG?=
 =?us-ascii?Q?qXbGzGly7rgp1lbA1EqPLCMBpd8FjBHB8Ff4nzv0uhU75mTOxsxnkst23OMr?=
 =?us-ascii?Q?MGc0/RL5KR/ZhwiH5hsmYqLXin5UBoYaEgnodF0nOA0JcDqshIaJXCeg17bn?=
 =?us-ascii?Q?8PKTFVmxrtMa+iQUo1whBzuromm5kQc8HZUXIboaCqY++IE9ebGXio4ah792?=
 =?us-ascii?Q?6NoA5+sQPzN6wm3fxc6MIe0+1FnB/+nmeebEitxTN4/I7M1Jze2Y/PhyQ+qz?=
 =?us-ascii?Q?xitm0xJLp2E7YGa668+1bRHyWM/DPlH6b9QZl9MMjeGIF80LNUH/C4k3F+98?=
 =?us-ascii?Q?w5twXpcOu1ZrDePHwW2JmREdwEg1KFaw0KRzYZnfVCyMABUlqsDHiis30sy3?=
 =?us-ascii?Q?bRvDnKJ/5sloSYv0A/cQ27GnMlnqWsb5h2E0QPQpUJW9y+V7CypZGQ0RR6Vo?=
 =?us-ascii?Q?Ym2JMSydfjHa5RD9v/8FLre8Y2Ct63yHRBZGR86IQjSIIFPrPJgwVP3ZEB5B?=
 =?us-ascii?Q?F6EEoHGueCIOe4e8Qm0AMn42nMVK/sfslObifcBW6HzAHzf49sQ8S4zNHgu5?=
 =?us-ascii?Q?0Igi8+dxrPrciHmXuHmczqn6ciCYuaCqJakNnQRjg7ul0UkEBm7RHMyvD0cK?=
 =?us-ascii?Q?WNqqOVEmafiVt96QBv060BWCwv3unn8N+aeF1yAgQMudiSnWPBnQK71ydvsJ?=
 =?us-ascii?Q?sxjR8B4mDcxbOld5uK867joZhhJ3PO4lBCZtUuRwPsqgJDXoUQz4bPh+dkUf?=
 =?us-ascii?Q?SCsq0nL3hj2d2ZG83hqCG8busn0pCLdBg6nx/Wj8b3CAsR0j06Drx/mbpgLu?=
 =?us-ascii?Q?bjP4EcjQBCYmAtE50b0C3x31X5fTyFpZnN06517hn4326YgDVzEm8aUiZCVj?=
 =?us-ascii?Q?EdtEstxKO0nae2lsObKPmPr4ZjE5k/z3K+ZeovV8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2f1e27-7a1c-4daa-cc2d-08dd9df2e875
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 14:21:16.3824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+gMrj4/frXBpgr5AGvJg8zjHg/yJ6P/NzTECrugkGiENnx/X/mqnurXQ71MoA1iQZmjYA3EdDy3d3meeaUwftJuQNGiLonPjDPKPpxSsrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8860
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Zhanjun =
Dong
Sent: Wednesday, May 28, 2025 7:15 AM
To: igt-dev@lists.freedesktop.org
Cc: Dong, Zhanjun <zhanjun.dong@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Fix typo error tab
>=20
> Fix typo error <Tab> to <Space>.
>=20
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Good catch!
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_fault_injection.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index f9bd5c761..9fe6bfe35 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -83,8 +83,8 @@ static void ignore_faults_in_dmesg(const char function_=
name[])
>  	if (function_is_part_of_guc(function_name)) {
>  		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
>  		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOME=
M");
> +		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT .-ENOMEM");
> +		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed: -ENOME=
M");
>  	}
> =20
>  	igt_emit_ignore_dmesg_regex(regex);
> --=20
> 2.34.1
>=20
>=20
