Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CBEE9A03B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 12:19:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E309C10E127;
	Wed, 18 Feb 2026 12:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hwz4Ncik";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B8510E127
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771417173; x=1802953173;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=43f/zxnM9YO7i2tR59+LKAZ3El3fipOjKkB1JR2RWAI=;
 b=Hwz4NcikWin1HAITNqM4cgPUfeYUuQZTEEA/QYXs7n3ZER9PKgHa9Fh3
 pCV9B+wQJaU96S/MXorsBTuMEOWf1AZOdBK43naBn68M5PHMaXh6CxIA7
 AonlCSdmvs7kQ72p99PKc+iCtqORR6u0lA/BO/vGloXOxVltWTvC6yvte
 E+jDMhpMJEuJY8S3uVGz+Cxz4+y1nINGais9qCeoUFnCVRhPdIe1gQ6AK
 5jl0Vh7k2C5AjzNbRBoPOfabj1i7OnAiIlXqqkQ6HjpiGJVyHo98D0bDY
 fOSM9Tx80WcRsVHJnwMwHOYeMnOBZDdlrkzE243MqVcQeKjVdiOmr2ICQ Q==;
X-CSE-ConnectionGUID: xIqNmsTVSGS4EyJWl5Ix9w==
X-CSE-MsgGUID: tmU2ZMltQdOl/fl4xi+f8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="97952020"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="97952020"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 04:19:32 -0800
X-CSE-ConnectionGUID: zSpIv2nGTqqxvXpyGujFlA==
X-CSE-MsgGUID: Qy4QTApnR0WV4HykkG3S7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="214289123"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 04:19:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 04:19:32 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 04:19:32 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 04:19:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWmlQpeHeBZn7v+zt6aR4fgxkVD2KokFz5K17hVCt8GmS61Tvnx6oCZXvebBtr3qlJXMlDv5v0CF6UKd9///0UfVsDrHEvETFBuoA6AQIdP2tR4S8ruAyxkhn0TnNoJ+oXNLVJyHa+okfXdT0cHGJPVnQCmwOO5VnWPvoevTbVmFr5toOQwArQO/+QotvVF7o2XC2RZPl1uaDNCTYXLhwJYG3WydY8MzgrKO6lBQoAmIICUaBHuBZP5A+0lraOFbGmmafqDSipfoAAVzssv63it0AQTKL7yYB+E2znqm+sjVYH29DIobFUdv4ISJrb/DTV1jFUgX5xWKZSVQkd7eKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLezJhYvQnzPMsNAYOfrdGpRF0nyJkBqhXoSlKAfkK0=;
 b=B4Vr9dj1eRDqrxvqfaeLy0IrLsBt2FrH6wuycYUCapvftN4vmCzKJixt+iVlwBqv2eb9ZRoGlC2BLZfvtWuJD7tFWch1S6EQwyEUGmbL9DdHinqUb3tQw/RYbSQUuXPUR1TiKqGJR9lDVtuDcKquAoQS3/r50j9pve/TXVIbYZWQg6OJEscXt0Lo206oMZrM4Q2/MWQ9LCoufNHVzYJlJYpipw3hp7xCh8H8H3YKcBB6yXezGNNjzXb8QhPOfVjctB+uR2P71MO+hd7K67Omz6lywt8XsSfLKz02lNWHlsWKDZsYGWMbw45WHn0xAKMJ/ng6QN2MPJgfLtwTVX5cAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 12:19:24 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 12:19:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Feb 2026 13:19:41 +0100
Message-ID: <DGI2ZEN5NAG5.NII6VODS4L51@intel.com>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>, <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v1 1/2] tests/kms_vrr: Skip LOBF test when aux-less ALPM
 is not enabled
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260218080511.2534901-1-mohammed.bilal@intel.com>
 <20260218080511.2534901-2-mohammed.bilal@intel.com>
In-Reply-To: <20260218080511.2534901-2-mohammed.bilal@intel.com>
X-ClientProxiedBy: WA1P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::29) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH7PR11MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: f22e27fa-4a7f-4a5f-9070-08de6ee7f3ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUgyUWt3ejJrYVl4TkxrclBMaklqNitBNVZUU1ZMOFJ1amVkbTFvY3lUZjd2?=
 =?utf-8?B?OERpMUlBUE5QZnpNbDN6Q0VDQU9NUkJvdlZjeVJUaFdmUk82WXBKc2VJUnJV?=
 =?utf-8?B?R2VuSENYSDM1YVhtYWtSSWFsSUN5RE1XbHljQ09YYVNGSVpnSHBhdjNSL3Fj?=
 =?utf-8?B?VkZRY0pNQ0N4Z2tIOCtiSUFaNDIraDM0QTR0YWQ0NTVJUEpXNFVqWGt6cjBk?=
 =?utf-8?B?WkVNczdSSERlWkJ4c3YxYWhkNE5pM1VhWjNsb1RvZUFIRkV2d1pHMDVJZXor?=
 =?utf-8?B?YWkrRkJybmMvNDdNZ0ZVZTJjYmUyYjJuZFpBeG1nK1pCS3dObnNodnNRUnRv?=
 =?utf-8?B?YytGNlgrUHAyVVg3NGdTQnZtM2xnaFVrU2x6NlYwVTFvYlJGZlVzVWpiUTNC?=
 =?utf-8?B?WmptNUI3b0JnSFNJL2JoNDJvWjlXcHk4cVYyZTEyeExqRXBEb2ZENnQ4THkz?=
 =?utf-8?B?Z0R5Vk04ekxpSFMwY3JWRk1HVGVRYTVSWE5jYUN5RU82d2RTYUJobGtNMlov?=
 =?utf-8?B?bzB4UGVMamJteEphcWdUUUZqRFRSeHpIeHluMm5RdWZvK2ZZbzBNSHE4NjZv?=
 =?utf-8?B?ZGFyTS9nMFNISVA0YlVnTWoya0NBZjRuUkhKVlNBRUYrajliSXA0cm1ndVpI?=
 =?utf-8?B?ckgvWGFzY3VtaTlBRXFyeVdBcmhXSTZRT2g5WCtUcGE5U1NwaXgycUc3bXQ4?=
 =?utf-8?B?ejczSy9GRVF3Si82WGFkdGhqL0t5L3doalZQWURhR0UydGU5d2lZcU1XMHNa?=
 =?utf-8?B?QlBsUmhFbnc1c2l3YmJVS0Z0cTZTQk1Ob2dHZ2JPUjlXaXNJa0xPRktNUzRD?=
 =?utf-8?B?SHVHVjVCZDVSaitNSjNKNzhYak4wY2hjVHRVR01PUmhudEU2YURJdmdYbmJy?=
 =?utf-8?B?Y3ZWbDZ4aTdsWHJiTDdBZGVrQXFLNXhaV2pFaHBFdWtaODVISkRkd3ZCNE5w?=
 =?utf-8?B?dXRMbkF4QzdMMVNUSkMyWFhxbnRpdlFSNHQxcVJzcE1jRTcxS21LT2VQallK?=
 =?utf-8?B?ajJTUCtTQTRwcmlKWFpqUGdtWGdJUVBBN05jOFdIRlNZT04rbVN6ajE2K1Jo?=
 =?utf-8?B?OVg2YmxRa1BZZVZLNWIvZmZtamxZSCtKMlhGRjFOWkVoK0xuNDJDZjEvblBH?=
 =?utf-8?B?dmpoV05SZFFWWkVhSmxYaDRqZ0VDVVVzVng0OGRwbFo1TmN1M0NwNDdEc3Jj?=
 =?utf-8?B?aGZteGkzdGRqZ3h1dlBnK1l4L3c4V3Z4ZjRGSkw1WkErMWlabWVvRnBUSWFW?=
 =?utf-8?B?KzdEenN1a0RDd0MwaS9RWUpsSkhiYlJUN3VUMFpiQ25UdFE1bVFuS2NBVTZk?=
 =?utf-8?B?UlF2U1BpQjNrZCtKQnZNVnBiUXJQWnZiOCtXM0RJeUFTV21GOGd5Tjdic3pD?=
 =?utf-8?B?QUkycjFGM1NtRk4rREpWT2tVejRzT0ZSaXJVMGRtUVdlMER1T3JJbEl4bUpr?=
 =?utf-8?B?b3doQU02R1hqaGV3OVE1NGwrQ0JNQlJHZ0hRN3VhVnV2ZUlyckJUMTBmQzVl?=
 =?utf-8?B?a3VScWRQN3Ewc2c1K2Y5Qkl6RUdBRjBMZFFieFZ1ZFhkVWgrSzZnM0hIL1lP?=
 =?utf-8?B?MDRDalU4MjNjdVhZTEcrdk44ZnlETUZOeHhDdkJuWS9maFcxWHdyUnduR1FZ?=
 =?utf-8?B?aVB1ZktxVGxUT1Q4NTNqSkk3UnYyOHdZejE1akU0RUN2Z2x3TUtDd2tYNGlM?=
 =?utf-8?B?NXkwcHZVek85SmlyTWN4Wkd2cEdBTU1haG54b3FBTlU3REcwdFkvSlplbTVD?=
 =?utf-8?B?OW11RUdxYXNPTTFRaTQyMXl0SlRaZG9BMnlkNmxKL0dqOHRTZmlKWnRSRlFk?=
 =?utf-8?B?dmd6QjMwUW5zZFhvOTVReHg3bmpadXR1aEMvRHNSZnorRlZPQTlEakxUTVZY?=
 =?utf-8?B?YzVFaUYyY21CSXNucytBS21HYzVpYWdkL3FEY3RYdEtMNXlsUlhJRFJKU3RD?=
 =?utf-8?B?QnNCS3ZNSEwxNHJ3Mm9IQjlyaGRBc202eUVwVzFDd2d1Q2tTYTlKRkR6Mjls?=
 =?utf-8?B?RjFLQ2RMd05jS3hZamlWQWZuVG9xdDBRb0ZJMUkwN1ZHUjFOQVVQQ1dzVlhN?=
 =?utf-8?B?d1lRR3ROR3lNbkVmcXFQWmpNL29PSjV1TXFNOFgxdDJYYWNyOTFXT2tJelpl?=
 =?utf-8?Q?4XF0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGdPbkJITXYzVTBmcENrRmlXUjNXam5HaDRWdXd0Q2tEZjRScVRydmp0d05q?=
 =?utf-8?B?RUhabEdKNm9zcGFVTmllTVRKUzFjVzlUbGtPYzJXRjhoNk11MHVrZ1NrWm90?=
 =?utf-8?B?OWhwUlpNa2xSN2swRitRMy9veTlNcWVEWkRtemJ6emZqeTBGUjRQK3BaeDAv?=
 =?utf-8?B?T0Qwck9mdDZJOUZMUWR2YU1wK1BBdTB2cDg5Nm5SZkZqTDZvWEIwZ05yUSsy?=
 =?utf-8?B?eHdLSUdBUktuL0JNQWlGK0xwdTlCVFRyb1E4N05hT1VyWmRMOTZzcDI3aU94?=
 =?utf-8?B?ajQ0M1phMnJmNXJoVmR2S2UwTVQ5bDNlQ0x6VDQrQU9ZVVJqVEJQTUQ0NkEz?=
 =?utf-8?B?UTR6emdNZjZkbGQ1UVNYdUxnUSs1OTZMZ2VqdUFEVldUT1RabmR0UnVMSTJT?=
 =?utf-8?B?cXZ1MDdpZE5yQUZrTGxId2dRcGN0eWljMFRSdERYYW5wTGhVT3l0M3JrbC93?=
 =?utf-8?B?SHBlR0g0QVhUSGQ4Q01OcHlZbHQ4VEx0dEN1OUhpdlRRdTJjTFZ6UjMrZXZC?=
 =?utf-8?B?RWtvMms2TWo1NFhrOWhSYkVIUzBFQkVoaEJNckZzcDNMNytlNHdKMjdubTFp?=
 =?utf-8?B?Mm5zN0tTTThoSWNLc0VGdzJSSkRkQlBSRFBwMUh4bHk2aTNKM3l5aW1EU0pw?=
 =?utf-8?B?S1BNS0tMYTBIZnVtMWZKNlVqMDZ3VEdwWXFKMUQ0SGhqRy9tZTRQWER2VTZa?=
 =?utf-8?B?N0hqSGFXa1hRN2MrWlhoWVRmanZJU1BGbys5WXpQblNHeEtrU1VuNzJneFE4?=
 =?utf-8?B?ODM4RklDVFRLSVRWdTA4Wk9vSjkwaG9zZUEza1dlQ3R3czZEclh3V3RSRzFS?=
 =?utf-8?B?SS9CMEV4enkrdUN0emluck94UStDT0NOSTFpRVdjNFJGaUNLbEREOVpxRzlG?=
 =?utf-8?B?Y1JWMWdkSnNtMlRDcS94K2pTUHlUcWVHMWVtcXhrVGlIZjAzWno4NXp6Sy83?=
 =?utf-8?B?czBIUVZndFdGL0o5NnlKV2J3VzBxZ3J1SnV3aTVnenpNWGlCd0lUUzNJZU1l?=
 =?utf-8?B?TWFTOVNWUDMxeHBVQkpKSktqbjlTcUpUMEtPRkZHaVg0N0p0UDhKUFh0Um9u?=
 =?utf-8?B?K0RTeEJ1L1o4VkNlMTNxOHVFNElvVVRtRFNUbklDWnQxWERMcGF1YUVyOXR6?=
 =?utf-8?B?RzBudkdZNkQ3Sm5XOVFJV1J2SFpuOEhPdnFzWkY3VWROMVNuSWR0amV5M0Z0?=
 =?utf-8?B?OHhweTEyeGc3Q25WcU82Rk16SVQ3b2pNMGVXamFJendRRFV2R3FZd3JxUC91?=
 =?utf-8?B?Z0lpeU1JQlRvQXdmSmpBOEFyU0NlOTIyM2JBdVhUV01NMy9DSEFTYklDSWsr?=
 =?utf-8?B?eDhkaVhyODBtYU9rRWJxLzYvUmdRMUFxNStWSXZ3cTRwTS85VTJuV2hJdWQw?=
 =?utf-8?B?SW1zbi9wTUNDamdKbC9ZckJ6eGpUVkdBU3ZCSUJIVXluYjU2YUdZOXN3YlFM?=
 =?utf-8?B?UDFGQU5yOVdWbXBpWXNIVmNCOUJpenNPUWJSdHkrZ1owZ2Fyd3h0VFdpSUV1?=
 =?utf-8?B?MnlVMmJqcElqZHE4UEZqOWk0OVI0WE1LM3ZWL1M1ODhJajdXck5vck9EdW12?=
 =?utf-8?B?VmJobUFpY1BOWldNNHNwczM5ZGNNY1NwY0p1Znk5RTRGU0Z0a2dSK25RSGZY?=
 =?utf-8?B?MWhOcmRSV0xKMll6ell1ZXFFVG4yZUMvNTd3VHJKS1ZHSldnWnhKQUVla2RP?=
 =?utf-8?B?RTBxNktMaktGdGVsMlNpblR0VlpqTEgzN01xY21oc21FR3EwRmZCYUpBTXdo?=
 =?utf-8?B?QWZpdlV1VlFPWFRuZGFjQllNM3ZhZGpSR0ZnUDZSaDV0SUU3YTZCZG9GNHlH?=
 =?utf-8?B?aUZ0dHhnbWhzaEZhRkxBdWpYcUxXSnZ3ZUEzaThoUE5NbDNTZ2FUSmU5MDlK?=
 =?utf-8?B?K3RzZHk3UGxEL3VyK2l2enVXSVltb2MzNDFjZFlvekFtVEt0L3BnYmZhOUpM?=
 =?utf-8?B?bFN3MDhyT2pTNk9CSyt5ckhqK054WnZjOXZDaVpWUzRWZ2pjRTZaU0ZoWXJV?=
 =?utf-8?B?SGhZWlBESkxVVzBydkpQYjQzbCtsRXpQRVVaZ09RSk45NDhGSFdnK0pkVnlS?=
 =?utf-8?B?RWFwZ05rLzhDUjVlTm5aQTltM0hlNTV0ZGE2NFZvYm8xQnRla2hlQkl5eXhD?=
 =?utf-8?B?bkg1NEIxOTFEM0JsTDNnNmRpNjVueGdudDRQQlphM3duK0M4R3d0V0llcFla?=
 =?utf-8?B?Z3hxUFJtZmIwdUVjTDY4SnVpR01LNkZsTTI2Z1ZMMGpseW52ZDJYTXVaaVR1?=
 =?utf-8?B?VUY1MDNBeVd3c3lJOCtwQUFxRTl5S3NwWTlSQ1JaY1VBeS9tNjQ1MytibVM1?=
 =?utf-8?B?Vms2cWU0OEQ3ZUZOYm52cmZpUGZ6UUIraStvWVdmalNJb080bGhycTNUSHdT?=
 =?utf-8?Q?VG5DohnZbtjCIVzo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f22e27fa-4a7f-4a5f-9070-08de6ee7f3ce
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 12:19:24.2861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmX8k1h4SelJ2Fl2Gw/OxSWe2TsgtB3rQ9AyWRJ4YB+7pX8HWclJ3xO9vMLXD21Dn2k7PvmcSDhAsFEi0qzbLhBkjOVjndf45HtdZQm2Ayk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7717
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

Hi Mohammed,

On Wed Feb 18, 2026 at 9:04 AM CET, Mohammed Bilal wrote:
> LOBF can operate in either Aux-less or Aux-wake ALPM modes. However,
> due to uncertainty around eDP version dependency and its impact
> on LOBF execution, we currently restrict the test to run only when
> Aux-less ALPM is enabled to avoid unexpected failures.
>
> Add a helper to read the Aux-less ALPM status from debugfs and
> skip the LOBF subtest when Aux-less ALPM is not enabled
> on the panel, ensuring proper skip behavior and preventing
> false negatives on unsupported configurations.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  lib/igt_kms.c   | 28 ++++++++++++++++++++++++++++
>  lib/igt_kms.h   |  1 +
>  tests/kms_vrr.c |  6 ++++++
>  3 files changed, 35 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5c4879604..48684b4b3 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6578,6 +6578,34 @@ bool igt_get_i915_edp_lobf_status(int drmfd, char =
*connector_name)
>  	return strstr(buf, "LOBF status: enabled");
>  }
> =20
> +/**
> + * igt_get_aux_less_alpm_status
Nit: Personally, I find igt_is_aux_less_alpm_enabled a bit more descriptive=
 for a boolean check.

> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Check if Aux-less ALPM mode is enabled by reading
> + * the i915_edp_lobf_info debugfs.
> + *
> + * Return: True if aux-less ALPM is enabled.
> + */
> +bool igt_get_aux_less_alpm_status(int drmfd, char *connector_name)
> +{
> +	char buf[256];
> +	int fd, res;
> +
> +	fd =3D igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);

> +	if (fd < 0)
> +		return false;
> +
> +	res =3D igt_debugfs_simple_read(fd, "i915_edp_lobf_info", buf, sizeof(b=
uf));
I'm not entirely sure if igt_debugfs_simple_read guarantees a null-terminat=
or.
To be safe, we should probably explicitly null-terminate buf before process=
ing it.

> +	close(fd);
> +
> +	if (res <=3D 0)
> +		return false;
> +
> +	return strstr(buf, "Aux-less alpm status: enabled") !=3D NULL;
Especially since it's being passed to strstr, which requires a null-termina=
ted
string to avoid reading out of bounds.

> +}
> +
>  /**
>   * igt_get_output_max_bpc:
>   * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index dedc3f880..a1f52f452 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1257,6 +1257,7 @@ bool igt_override_all_active_output_modes_to_fit_bw=
(igt_display_t *display);
>  bool igt_fit_modes_in_bw(igt_display_t *display);
>  bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
>  bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
> +bool igt_get_aux_less_alpm_status(int drmfd, char *connector_name);
>  unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
>  unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
>  void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 811596ec2..e46e98727 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -1013,6 +1013,12 @@ static bool output_constraint(data_t *data, igt_ou=
tput_t *output, uint32_t flags
>  			return false;
>  		}
> =20
> +		if (!igt_get_aux_less_alpm_status(data->drm_fd, output->name)) {
> +			igt_info("%s: Aux-less ALPM not enabled, LOBF not supported.\n",
> +				 igt_output_name(output));
> +			return false;
> +		}
> +
>  		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL)=
 ||
>  		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
>  			psr_disable(data->drm_fd, data->debugfs_fd, NULL);




--=20
Best regards,
Sebastian

