Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA8E606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 10:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=clIYMzD/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010C710E7A0;
	Wed,  4 Nov 2026 10:55:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD94310E89C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 10:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793789687; x=1825325687;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p97wYaVanz4xlyKIHRiu4yfyAJYiRRoDc0mWTsdNEew=;
 b=clIYMzD/gwPbhMFVWQDfgVrg+VBwUQSblXZzxyMGXjCjmCErm/8Gma7c
 O5JV3cIX5PYA+ulSpi+XcMceXmAASBZZQQkdp8ZzLLP3yPz6infRj7FXR
 42Da69BtnKOifA5bjIMGAMtG40cgpCE91NRtK0J6lUX40o7sJK65OtB0Q
 rNbdWfZfyuXgSgvM4Tqdey6Ut5PZZV4vNX69RioWE/RwvUcbUVMucFZ8W
 RS14G8puNnjyelf1+irzTfVastxTwgptFDNLVlCEG8a/8dWwPzz6NLBAf
 qftV6Lz+GbC3TYm4sZdkuk8qnozzTUCcaXrCLKjQu8SssCXie9BS8QSLk g==;
X-CSE-ConnectionGUID: EKPPj6BmTpCkGVgkwJjwtA==
X-CSE-MsgGUID: MY1CJvFvTDiSj5gqsXTKIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2439658"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2439658"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 02:54:44 -0800
X-CSE-ConnectionGUID: 4B5ik8LvSbuSndXKIr23hg==
X-CSE-MsgGUID: f9fdffgiQ/WBl3Qm4IJT9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7080795"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 02:54:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 02:54:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 02:54:43 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 02:54:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdDCB16TzQoinxQdutfckRLtwsJU+oojsA6bZtFZ8BJnzRJxpbaLV/TIVVs0ELnqPlWhf7TCyYjX8y48ey7vIzOnJ++XyH1/3Q1/gXl9ArIHGKBD5uK8nfPgNLuRsGaTJLTfFu4nkXmqguvbhXyTPllhojlHJSHPTCQ9CQgj/YHU+XsEL/RTXkQkMWIzIrlPxnpnz5zjzAgwiza3jX3g96FuqeqX+2EFGuqrKNmw4jkQC/u5YmgN4zi4mtOWQprPdZC3yk7QcM1+cNLUV/jM99arFQ9d77Mw2ob1mtqt5HlHgM+Psrb5/Xwu5syOJSEHH0PdDo49CfCiTaP8CZj3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dy0QW74WKAGwOiLwlucid8Wc1o9ApgqC/sEJa9Zu4Gc=;
 b=dG8yda25ve9J0Zvyh2CRY4ZUXr6/Fl1FFzVVBar2EerTvxws4Y+rZn3Suxa58MtHcDMlm4/mJkMZ/SXFEBpauYRKO43WpJdSmj3p6lTEm58tM/JlkDVlGiNqqthdcyT944Z77wrLy344DlKpf1ly6zD/x3Bk74EDTMNprYKF0DCqd5z9KfwK+9Kwvt4Gzx4BEM9v2o7rMJfPRfyevvSVeQYg4y2T14V/0DY4oPPKA7MedZ1DFSzuNYmFv8JlDeWPFgzLMHAKIWXINRIq341Wb/xrsbrBYHjGuleXRH/4FtX5rkNUQDPC7OesLj45/StH8MPunhqjrTInhgk71Qo0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ1PR11MB6273.namprd11.prod.outlook.com (2603:10b6:a03:458::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.8; Wed, 4 Nov 2026 10:54:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 10:54:35 +0000
Message-ID: <6fb24423-81b1-4d56-8477-443e7713d6b0@intel.com>
Date: Wed, 4 Nov 2026 16:24:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] tests/intel/xe_wedged: ignore expected wedged dmesg
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20261028133045.1966466-4-sk.anirban@intel.com>
 <20261028133045.1966466-5-sk.anirban@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261028133045.1966466-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ1PR11MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: d713f67b-2127-4e8a-604c-08df3a6203b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|261021121427099003|261022105027099003|11063799006|56012099006|4143699003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: aNWqcbfj21D2oIjyEwD5sXi8GH8CPmFQfizfgAtX1qeAFzrLB0vmsItYuzPa/18lYdiIBEsXSAlim/6wEOrVdLte7zVdgBRmiCkCllhaGkkifLi+jIbgyrPY8jDGkzunq+pFaPMAj60IQiEfbqPuGP63IhT/Gs/UBn1bNkM9EK5mnL6/0i6im/oIi4v0GP5InLt5asoXVFNjfygJPfJCL401teYLFsGNeo9tYOeMgVkMhlk4iAx5cXkVVQ9ppTyzZWm4ROOCMgtyS0Lc4A0N/+exaoN1Ha2+gPbS9LNlbzNBPeHY8y+eHBqdcMrfeBeteImX/HFuBiVEwHjB/VYBYJJJjwEksf7eatZU7cKVPTmpo8lsCUpXDQrrPbgTQgDjs/UV38RKhSGiUnGDXpCtrInWokARE8wONMj345qLTkmhsmV9tfpv/PV0ls+pv2RpmQFYalt5odhYFAABMeyeh0CUsk8IArdRMXeYk67mSAWFh0WceeMppjXeyPw7CBfb4WAK9oJNZdZNff7r8pa088ZbTpwqK4qr6GHiUS8Ksl9mEbc41RZWTc2eOyaJpPDgy2LqSmxLShDw6dfM1PpE8WXRk31R9Ceh0/VvVFgIZJ8xE4NypTS+hU+hvPokCuPj/DCKUhKwmstBxHhLD6ReEkFslnIClyRpLPnBezIz9tU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261021121427099003)(261022105027099003)(11063799006)(56012099006)(4143699003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUMxWlJWbUlJaDZaUENuMVNURWw0aEFUYVNmQTQ2SzlVWUNZK1FmZjlOeWlx?=
 =?utf-8?B?M2hwazg1RFFGWGw1MlRvVm44Nkl1N3FJQ2loU1NMWjlJQk5BNk1PWlFlSzZG?=
 =?utf-8?B?M1dpV01URVppZDhYU2hqREJOMCtaUnEzZW1pR2xldGJBb21MQUlWKzZnWHpN?=
 =?utf-8?B?UWluampZU1JyOUdLM3MxajVKNzZiZktTQzY2bDFVQzkrU0xZTVpPS0xKNWdX?=
 =?utf-8?B?YTNadUUrWEtEWTd0ckZZRDlJOVRNSmRWd28vc2JURW1TM3FNeVFIbDU4eWZP?=
 =?utf-8?B?NDNUY0pYeWFWSzlNUDFsMjhTZ05QbHBmNWQzQ0ZibVc5dDBSYlFrY2NPSGtl?=
 =?utf-8?B?VjZuVUV2VFVVb3h1eHlLblJIaWhoTENRQmxHbnI5TmNrWE5JK0FtTHY4TXcv?=
 =?utf-8?B?akF5VnkxWXByT05uenpFSWtqWmRCWUlyZWVxZUJYZzBPU25KNDY1K25mNjRG?=
 =?utf-8?B?L3ZZVEdkV3hTdVJrUS94QWhXRzhHRHN0K29NM3JzOGZNM2dFQlphVXhFWVRi?=
 =?utf-8?B?UW9SVUJ6bFF2cDhaYTZXMGFZeUJidGtOakE2Mmw0NGV0bDdkM3RFei9ucjZY?=
 =?utf-8?B?L3V1aWg2WE82WFFxQ2w3YWp2TzNyL3ptV0NOaXdmQjk5bDg5T002M0NyVDd5?=
 =?utf-8?B?V00zQWU1d2FYdlhQV1A0WU14aVVxR3I4d2l2REZWbWZnY09ocGwzdldqbkc2?=
 =?utf-8?B?Z3VnSldmWWQ1cGV3Q1VGeHpPWDc3c2VtS0Q4ZU55VCtYc3UzdUcrNUNSeGxy?=
 =?utf-8?B?elZjOWg2MG4vVDdsM2RNcUtCU3p0SUZoR0RiOGhnU0k3dnlFZVVFd1RBZVFD?=
 =?utf-8?B?MnkybnB6dUQyUTJyUXg5UUE0TUFrYWd0dDgxWGdQdjJLenQ0eEdGcDJrK2Iy?=
 =?utf-8?B?RFozc0NhSFcwREduQm9LOVoyWHZqQ2xrdnQwSTZON01mL3FZWVhWQnEyR1o0?=
 =?utf-8?B?RmhRRGlSaFBiQ2RGTnBScnFTTnRrYWMydDBTUjlCZS9zQ2loRjZQQ3o0bXY3?=
 =?utf-8?B?Z0pDZmQyeFRzcGdBN1JBcytQemZabElVajBUOTFaSm9oOXVxY2J4ZFpRcEti?=
 =?utf-8?B?bEJ6NE9SYVd1RWpLYlVLUzhoSDBBSGwzWkNvMWN4dWlPR3R0M3FFaTVIdm5q?=
 =?utf-8?B?bkI0aUhqYmNtSFhqZXNKRXg2cEl2SHpwUHJkaUxYWFFFc3JHbGZGQ2RYNUVI?=
 =?utf-8?B?MklVWEtvUjlyK21WaVdBMVNjSXRPbkxqTWFEV3poY21VODNycHFyMzBwVm0z?=
 =?utf-8?B?TDMvcUlSNzBkNW56NVROR3VLcXAwM0VKUVZDZU1Xb2JMaU9oS2EyQTVjSEox?=
 =?utf-8?B?SWsrTkROeXoxVDB6SXNDYkE3NUUvb1pjVmxCTFhnVTYyY2F1amR2YWdlWXB4?=
 =?utf-8?B?djlJZHF4eEhzTTdmYzFZNy9YZ2Vwc0I5N01TcXpWWTY5S1VoTHRXZ2lJUE9w?=
 =?utf-8?B?RE9YNUkxT0RqUm9jZ0wwZTcrbnROWkoxamFaMXdQUm4xWjl5alpvMk85Ylhj?=
 =?utf-8?B?MkMwTlQreitNS001RjRKWXoyMmVHcW1ZeVlpdUs0NXV3RWgrN0xSWU5aandF?=
 =?utf-8?B?RE1BblozbVpXbUtLbzZ2MmU4d2E2Q1V4QWR2aU11ME9VWjJyeW95dnV5REN0?=
 =?utf-8?B?dXhvMHd6Vnd4UWh5cFJWSnE1Tk55ZFM5c1grRDlBbUg0VEdwZE1hY0g2YnEw?=
 =?utf-8?B?YVZ6WkZaMGkyTmZBNU9UZ2hjSmRFaUdLQy83cFhLeXFGeUkwMUxvbEFtREtZ?=
 =?utf-8?B?KzJFbXE1cXlRbXFuSk40aE5QRXdCYklGVUF0WjE1MzhQYmo2Q2gxMS92eFdr?=
 =?utf-8?B?cGI0NWlCOVFQQTJxTSs1cW1lWWh2WlpTcFZNVGpwWFQrSzVDSEp4RGNJSzFU?=
 =?utf-8?B?Ym5KYXhPZE9FYWpya1htVlpOdHBvNXN3aUNWUG8yZ09SVkY1dHJna1JjeG54?=
 =?utf-8?B?b2VqRk40aEw3N2dmdW5seXYzUXRzeml0V0g3dlR2WVNFQU9KckRUa1VVRERa?=
 =?utf-8?B?QU5GZkM1ZTJNL2ZIRDBMWkZhemtsWUYyL0pKWVY5aHVrWmw2ZTlaeTRKcUZ4?=
 =?utf-8?B?UGE4bmtaVEVDeTFpRURHazRkRC9xcUw1MkMyOHJndklMdUpZcFkraERyU0V2?=
 =?utf-8?B?eEpYR0pmbWEvUXAvSEZrSzZHUDU5YkhNZGpaNVJhVHczeDcwVGtUcjk5Q1M1?=
 =?utf-8?B?U1lNNU9ZdnpNamhqNS80U0dSUGFicFVtNTRGZ2xDTW1jdE54eTJQeUgzSmVs?=
 =?utf-8?B?RE1NS3c2Tnk5V3VSOXRRQmt1UmFlaWJYQVFQS0poSkdrSVArYXpIVzRvNkFa?=
 =?utf-8?B?MFZpRCtyV240VitQT2VNNGlrU0JSbjROQVpiUzBmYVoyeGhRWUh4UT09?=
X-Exchange-RoutingPolicyChecked: uMgTe9s1GamvL3ijHVYij/gjfbAKwCL2m3w1HoGspgn/rN+LqiXhivUYlnNrjusYQVBwaKvrUqfPODInP3+s7ch9FltAh9nhmmW4n6+ckN4FI7ZktzikgRp47288NR3AmNFtwWWcodDHNnL261XF2tq3sjOsd6a0+AEj5DXMCwkS0cNhcfoaLuK2vc21TvG2pK3STepREPzCU7OmOIW8Sss3Vu3Uw6/rXZJoQWRhVrja2o4eUwYA/+Q5Vmqrs5onaasC5ml1YOrK24JBNSC72CwQOaCfDpcAhEHiSu/jN1i8BlNi2ngMaOp6XfY7X2f4fXFrzAYjeX/xfDKHvhmH1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: d713f67b-2127-4e8a-604c-08df3a6203b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 10:54:35.8061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06z1mOhk1flrmVng4hUrA/8FWNV2/d3ndIHJqaC8vethBvDhqWwTjCj5RGIAsup9pk26Xvov9I575aaf8DLzDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6273
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 28-10-2026 19:00, Sk Anirban wrote:
> Add GSC proxy, wedged recovery and SIGID based failure
> messages to the expected wedged dmesg filter.
>
> Suggested-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_wedged.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index ba7efbe1d..062e395d1 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -56,6 +56,10 @@ static void ignore_wedged_in_dmesg(void)
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable"
> +				    "|GT[0-9A-Fa-f]*: Invalid gsc header in proxy reply"
> +				    "|device wedged, needs recovery"
This is drm info log. Why do we need this?
> +				    "|SIGID=[0-9]+ .*GT: reset failed"

Add the closes tag if this issue is seen

Thanks
Riana

> +				    "|SIGID=102"
>   				    "|SIGID=203");
>   }
>   
