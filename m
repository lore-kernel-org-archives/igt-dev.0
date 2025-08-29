Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD52CA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 01:56:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714B810E090;
	Fri, 29 Aug 2025 01:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nARWKxqW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E0C10E090
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 01:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756432567; x=1787968567;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NdWT4ryNbOhC6zHrlUN8EB4zsFjXRSRVoI5HgAVjQa8=;
 b=nARWKxqW+NJJ08NWmC1+NOtCBfr1ZOzQaTP3t9TVEsavYT70A6XANK5S
 4HE7NpT+8kvJ/5yQPTikOXfR/vSuFG0TL7ypS2a29jLvhaQcyA2KoEw7X
 OJ0zpePf+ozfhbpBAzrZfDh1J+Jnd9ii+3wxmrXCAKksOD0pIAIgiulmg
 x2SIrkVizwijTyLgAr8R0tBCOxCJg7BQdpToNGCquWdLr6XKNZY2FxuXR
 gBPfvIEozQ5Xg2sFG0uxFBQ0XgJYIBUmtNM5j54vS90fg4Xqymb0c2c0L
 Hby2GYvSKhZZFAkgRDWVfHUya1fmQf4VoosTCWESyJmZlsTcEFQEuMJ+N w==;
X-CSE-ConnectionGUID: hlXQbLdnTOmBDWMa7jQhow==
X-CSE-MsgGUID: GwO5OOP9SSuXz8wK3ng2DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58863392"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58863392"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 18:56:07 -0700
X-CSE-ConnectionGUID: nIkG0RcxQPS590vpHm3LsQ==
X-CSE-MsgGUID: l3Baz3bTQcWkd8G1krTLIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170650585"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 18:56:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 18:56:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 18:56:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 18:56:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohvXxiXxj/SeH3aDaTaQrskGKFxWkJKwlvBUKVYyuYJ3Gqk0KiCD5L6M22EWjAfqVIvDNMPiVsaMe0D5NXSMq1Fi9czdtLUCRWrKhr9WHepRskpHVVYAEZETAfNBYteZiyrgAiSHVP+oCBXcLmmjXqUy7zvvppKoxQ3rIcO1swyQKUlRKvzESxRXkkBA1tNyDCfm78oSKqeS7zgborpA1MJDUjO2LFDNLrftKllvMuwJM1JMmnK1Z0jEZ1HyA/7Jvr5VDfdylm6+eEsktaXCQFmt/CZARjPokT1g9VliR53dzKQzIPmQMG6CM5Wyi3X5Bo2hQ5LpNp7qaaWiXORhbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzc7oDe98D8cptXHF4OOCokH9LXXW+/0LAlfsliGEpg=;
 b=ehQxWzWz8Jf8ibDpPw2EJzUXkQrWiC4bzyBeswkU8UYDc973nDq1/zs+X+5H3f/+PVVBEuIlTPLQhnV04WEPWQ7tSj2W+urJVbYGnod/F//lfMycxLdLbkUY6f8ItEbNtvv8BGblD0KnMgHxViqZvfosF2TmWjDDPwYV0lkhssuebV4AO7KLdN3dbkDV6bq8zWkJrdLGtLj/u/LD/09kd/mDEmROD7Ny9Kyn4roIWpQqB+Xd8P5aFhB1ULL0YA8WtS/sj8CvyY+ex1QnNDXsrRUJ5Rh1kE4H9OSTSL9Zv1r/QqCK3pjWQ+/B+CxfKBIjjvlF08J+gvp8NSzRgpzNXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.19; Fri, 29 Aug
 2025 01:55:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 01:55:57 +0000
Date: Thu, 28 Aug 2025 18:55:56 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 1/2] tests/intel/xe_oa: Clean up buffer-fill test
Message-ID: <aLEIrP7G1uQDHNFy@unerlige-desk.amr.corp.intel.com>
References: <20250828214907.94311-1-umesh.nerlige.ramappa@intel.com>
 <20250828214907.94311-2-umesh.nerlige.ramappa@intel.com>
 <87bjnzm4wz.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87bjnzm4wz.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0181.namprd04.prod.outlook.com
 (2603:10b6:303:86::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 6918c610-e890-4cb4-aca1-08dde69f3268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0hLSXBhOUNxR1N6NmZlQVc3bE96a2l1bHdHY2F3U1RQd3hNNDE5dWVzOWUw?=
 =?utf-8?B?eFk4Q2tDNVgxemlzc2Z5UXM0NXl6R1ZacGhoMFMwYVY5eVNJVDVlM04zalYv?=
 =?utf-8?B?azJMMnNISVlFRXdHWlRNVmJTM2QyQWtnMFNNWVFpUHhmWm5DWlM1UHhQeUpO?=
 =?utf-8?B?eW9YUWFYbzhYRTJPMlZwUHI4cnhaSTh4V1lzb2ZNMlloUzllaGYwRHRuVHow?=
 =?utf-8?B?bXN5T1JIejg3Zndaa2JWZ3R1TDZqTU5JOHBXYk90K2tLalZKT1FwbUxrUlVW?=
 =?utf-8?B?M1ZOTVoyQkNpMnBKaHAvdnlKWEVWYkdnSXhpMjdMYUxtZ2tDOW9kbEVBMFV2?=
 =?utf-8?B?ZUZTMUo0cnhxUlFVa3FrM285YVBXdXdjN3ZGY1R3aUNGTi83R292dXRsZ0F1?=
 =?utf-8?B?U3RwUk9sdURHckRNS0RiNGhLMW4xaUd1cGhVbmFVLzN6cW5Ubkx2L3lBeWJn?=
 =?utf-8?B?RlJQOG1WMFhoUytzUUdwMjk3VktIS2VIdkNXWnpMMUxNcnV1V2V2L2VsM3hW?=
 =?utf-8?B?Wmo2d1d3RStIWmpuR1liVncvQ0FGSlVNNGlTc0ZvL2oyWTIrcHFEemorYmlz?=
 =?utf-8?B?bjc1Q0c3YXROYTR6RStLSFYyMHFIU3JJak11WUpQUU9DM2xRS2F6cFFZaXhB?=
 =?utf-8?B?aWV0aWVEcTRTU1E0YTY0RzhkTGZqb0dlbGgrRUM3VEhkMXpxVThJbVVzcE1F?=
 =?utf-8?B?WHF6ZzFiYUc0d2ZDQmVESGRoUCt3THNQcWxLMUlWY0FFU1pVS0RIbmxaS2g5?=
 =?utf-8?B?bDZyajdkcTRxWDhTcmNjOWh6Q25sUVNRdlhSQlRwcDJFTzNZbng3bFk3T0tR?=
 =?utf-8?B?dDU0QXcwNmV0L1JMTm53SEhDeEdmbnNmQ3BPTUtwcVhTWEp2UTdDOE5XR1Zx?=
 =?utf-8?B?MjRFWWlBN2crU1NZaUZOQ2paR1JLa04zK0ZjSW5jelJnaENzZS9yV0xoeTZk?=
 =?utf-8?B?QWNuTEI2Q2RoVlQzdjlpTFMxeFlHaklFS01iS09SNmQrMVdJeWd5VTVEb3pF?=
 =?utf-8?B?ZEsySWtQOVJtMzAvVkk1WVZIc1NGY3lDOXhiNUZjZTFFVDYxUmc5Q3ZUZjJM?=
 =?utf-8?B?WlpwUmNDYkVobndJRFI4UGdZTVV3Qkd5YU5zRDRZRlU2RVRIVlNrSUNIT25s?=
 =?utf-8?B?NTQ4RVlNRkxUOTliSmptWWJxT3I4MVBKenJHNmxaR2x5K25sbG1KeDRxZVhm?=
 =?utf-8?B?YVBjMWJZa3FLWEY3TVVxSnpCSHVnMWRET043bWxLNXpvbHFYRFRpOGYyYks1?=
 =?utf-8?B?MkNRR1Q1OHNKSlI1YW40YlRja0l4Q0xTKy91dy9xZGd0dGh2b3oycS9RS05H?=
 =?utf-8?B?VmkzY1JxSHhGZ3N3eUdOYnpnVjA2NkJlMlVCSGZnQWJIcjJ1NTd0cnFyZER6?=
 =?utf-8?B?K2pOeGZYczZFc1VDWFltaW5aVDBFTUtBemRqN25YQm1lMFpnTzlJYlpkSUdz?=
 =?utf-8?B?Ry9zVk9xMTNicG9kZk1aMnFjYTBsV25QQTRJSDdMbDFkdXBLV0o1b2JFMkVm?=
 =?utf-8?B?aXhPR3FOdVgzNlZyaGp3WHZ0dU9hRWZKVWhkTm5FZEJNdFRiZDJqeG41aTFF?=
 =?utf-8?B?UHB0dW1ScEhDL1hiVUhzT1c0bjNjMU5qa0g2clpZNWRhUUNubVVRdG5iT0sr?=
 =?utf-8?B?MDZxa0J3TXZUQTR0cDZpQzFCdmRJNHl3Y0NBUEwwODczblBTY1F0M25BcXEz?=
 =?utf-8?B?QU1FNmpBMXY1cC83c3c2S25YSzg5NFlxd1Rzd3JwYTFxU05KbDN2eXFIOFpR?=
 =?utf-8?B?b3hOSE16WVhuUmhXcVFHdkZVYU5LdkJuOXkzalVMSzNuekZEakRpT2FjNktx?=
 =?utf-8?B?MXdNeld5MFRTb0tWQVAxS1hqSXRuc0tTUmZWdnVuOHcxcVJxVFdMcXBkTkE1?=
 =?utf-8?B?OUtmR2tBZDJLdWtnWERKV2U0dVUyamdkTytpSEVzVkpSN2huTlJacHYxa3pv?=
 =?utf-8?Q?tKcG5HHPzbw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEJYUE5XOGxXS1VUWERDb20ycXpoU0gxakZQbTg5MHFjc2RpZmtTbkRpc0h6?=
 =?utf-8?B?QUdNQ1VNUHAwL0E5MWRmblJWVlBsSmY0a1BOQXYwY1I5amtheG1xL21CeXdn?=
 =?utf-8?B?MGRkZHh4SmgxcWhBQnZ4cEYvK01CM0RRZUVLMHNYcFFBR3MyZCtSdmRDY1cx?=
 =?utf-8?B?ZjNwTkx2TmJjUFEzUTFTK3FZUFpGS2xJSTRqWStpK3ptUm5pSTQ2Q1FwK0t1?=
 =?utf-8?B?NHZtRXM4TEswQXVTblJYVGw3UUlUVnNPc3dUK0htcU5jbExsemZyc2s0RzBn?=
 =?utf-8?B?aEdKeXVuRUZ4VGp2TVh0RGs3MVhCZFZEUTZ6WEQ4ZXZDcDhHOTB5TkZySXpo?=
 =?utf-8?B?U1hHY0xOT003V0V1cjVxc3dyZnJ2ajAxLytvUWdhT2dDeGRBSW1GdnV3b2o0?=
 =?utf-8?B?N1JPaldYeHpPblhTVmtvbDR5RGdTQjc1S1ZnY0Y0MTBHbER5Z091SjZSNWU4?=
 =?utf-8?B?Zm1pb3h5WlZaK1RqREt5NmZGV3htc3A1SHU0cmRXYVcvS1ZZaVhlWUNZRHlY?=
 =?utf-8?B?ejkvNERYS3lLMTlpbXUrdHJnL2JtSWkweVFPMFczRGpMQWlCN29MaFNDejl2?=
 =?utf-8?B?TGplR04yM1J0NHRFTWY4SmJ6VTVET0NJYlNpMWxjbjBhOXJQQ0RPMU5BM242?=
 =?utf-8?B?Q2R2ZzlJeE9vdFRLZnJ1dHRyV21scE1yR3JWMjJZWk5YbDlydVh6QklaN1R6?=
 =?utf-8?B?UDNlQW9YakVqdlRkK2FieGhmZmhjeHpoMi8rUEZOOGdTeTRkVElzZFVDSmxr?=
 =?utf-8?B?L3dOdGtSNktWd1RDNTZnNmNmSmJvZllIMUd6b0hyZWhEUndZYVFzcThTNThu?=
 =?utf-8?B?K3kzYU9SM1k4anIvTVpIRzM0WmMzSlowVGg1UEZHMmZsK1IxNU14UHR1Ymcv?=
 =?utf-8?B?TS8rdWdMOWk1V2FyMW9rTk9KeGhYcE03M1VVVjRzSUhjZEl4eXBVd2xTUFdS?=
 =?utf-8?B?ZFp2dUZqVHc1WjFhbHN2WFk3dXN0U1RvT0VhOUtYdUVSTnZ0RkRtR3JJMW1J?=
 =?utf-8?B?U2lKZXBOV2ErMlpldklSSjJyMlU2WGpNT3FXanpDUjgrdEtPUW1oSTFTR1N5?=
 =?utf-8?B?L05xd1RSN2g3enBUQXdIREhhTTNRdnJMdXVza0dRSHMrVkd1QjFFWGVFM0Fy?=
 =?utf-8?B?Q01VcmFuVUJrbE1wN21mbnNVOWhYMCtnOHl4N1JOY2ZwdWZlMTY5ZDFkWThR?=
 =?utf-8?B?UWJxaFNiYnpNd1VJWjFNd3JCNFI1Y0xzd1E0Q2pOOTRxR3AzcnkyL2x3aEwv?=
 =?utf-8?B?UnhVWWM3UnB5ZEhPNWtaMm52QzhmYVNhVVFkQ3FZbkRNWVBqUWdQNjdsMTAw?=
 =?utf-8?B?VkhtbnVZR29teGtuTGpDaENiODRQZ015Tzc4WmtGanNxMDlscXdCcWNFaFlR?=
 =?utf-8?B?aFRpUkt2aU1hcW9tU1lHdStIR3FpSzJNQ1E1YWJvMm1IODNnRTVROWtwa2xt?=
 =?utf-8?B?SDNzcFJma0NQRFo0WFNuUTdPQXA3MHBRY2VFeVdjWlc2UDYwZ21XR2U0UGx2?=
 =?utf-8?B?eHY1b2o0Z3p3VjZBUm85WVVzdm8wSU16SGhWQVIwNWsyaGdWcEFOZnQvOVZz?=
 =?utf-8?B?S0pwUnZ4dEdxTDV3RjV4TWhBQmtoNTNUUEsxbGxWakpGTW42VmdIeGoyM1Bp?=
 =?utf-8?B?OVN2VWNaMjVpcnUzdjBTN3hwc0xyQktsazEvSnl5bHpDWjBEa29PZWRHTFc4?=
 =?utf-8?B?NWVYcFhGOWsybS94QzdVQ1BEVS9YUGt5ai9wTkVXcTZab3FyNDYxVStXVDRD?=
 =?utf-8?B?TGFNbTd4WE83K1J3ci9pWHRmMU0rN0ZpZ1o0bjBhR2ZBbktnZDlGZHMyY1l6?=
 =?utf-8?B?OUliNjQzd3FtRUZyOGtvVE5EclNQTk9Ba3pCaGVJUmlCakZENUpsUFNTNmdD?=
 =?utf-8?B?dklWRU1ienRjY1JDTzYzdTdlVytUcWRtNFZrOHRoa1Q5d0JFYWVTVHJhdjhZ?=
 =?utf-8?B?MGF1dUJPaktMVjhSKzBJVjFYMVpMMmQ4aEVEdWJJSHIrTHhPeFF6Q3FSV25F?=
 =?utf-8?B?Y0h0RGNXNnkzbk1BWjFkTm5SOVNQaHEreWZTdU0raTBSSmtLaS92bFo3WEFj?=
 =?utf-8?B?dXNIbDROZ1VlVTJLK1lPdjRKZEtLREt6Sm9aKyt0dXlaRUtpWkR5YTI5YkZh?=
 =?utf-8?B?YkRDZmgyNW9NQ1JCWGRZUlJVTWttRktnZm90OGlRVGUrVHIxUU04RmI0MzRM?=
 =?utf-8?Q?aaZPdGCUcIPrCu0WJWCh6jM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6918c610-e890-4cb4-aca1-08dde69f3268
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 01:55:57.7802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSoh11Wn8a972VqQXgu/r7RLjT+j/REFXR0UlclgYdThnALT1BkyJPZUEhgO7NXTnvsunwyCtsPbpWhrJ7C/ZKF3tPaiARRgMTUq8mnbhEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8739
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

On Thu, Aug 28, 2025 at 03:56:28PM -0700, Dixit, Ashutosh wrote:
>On Thu, 28 Aug 2025 14:49:06 -0700, Umesh Nerlige Ramappa wrote:
>>
>> Checking for overflow status before enabling the OA buffer is always
>> going to return false. Drop the logic.
>>
>> Move out core buffer overflow check to a helper for reuse by other tests
>> when needed.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 36 ++++++++++++++++++++----------------
>>  1 file changed, 20 insertions(+), 16 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 1826623ab864..3b3cdf9314c2 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -2488,6 +2488,25 @@ test_oa_tlb_invalidate(const struct drm_xe_engine_class_instance *hwe)
>>	igt_assert(num_reports2 > 0.95 * num_expected_reports);
>>  }
>>
>> +/*
>> + * This is a blocking read trying to read 0 bytes, so it will return ENOSPC
>> + * until there is data available. Once the OA buffer overflows, we should see an
>
>What does it mean "until there is data available"?

I mean - if there is no data available, the blocking read will not 
return. We get ENOSPC only when data is available and the buffer 
provided is not enough. Probably will drop the comment.

>Won't reading 0 bytes
>always return ENOSPC? Or you mean until it returns EIO instead of ENOSPC?
>
>> + * EIO with the oevrflow status set.
>
>s/oevrflow/overflow/
>
>> + */
>> +static void
>> +wait_for_oa_buffer_overflow(int fd, int poll_period_us)
>> +{
>> +	char buf;
>> +
>> +	while (-1 == read(fd, &buf, 0)) {
>> +		if (errno == EIO &&
>> +		    get_stream_status(fd) & DRM_XE_OASTATUS_BUFFER_OVERFLOW)
>> +			return;
>> +
>> +		usleep(poll_period_us);
>> +	}
>> +}
>> +
>>  /**
>>   * SUBTEST: buffer-fill
>>   * Description: Test filling and overflow of OA buffer
>> @@ -2526,24 +2545,9 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
>>	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>>          set_fd_flags(stream_fd, O_CLOEXEC);
>>
>> -	/* OA buffer is disabled, we do not expect any error status */
>> -	oa_status = get_stream_status(stream_fd);
>> -	overflow_seen = oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW;
>> -	igt_assert_eq(overflow_seen, 0);
>> -
>>	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>>
>> -	/* Read 0 bytes repeatedly until you see an EIO */
>> -	while (-1 == read(stream_fd, buf, 0)) {
>> -		if (errno == EIO) {
>> -			oa_status = get_stream_status(stream_fd);
>> -			overflow_seen = oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW;
>> -			if (overflow_seen)
>> -				break;
>> -		}
>> -		usleep(100);
>> -	}
>> -	igt_assert(overflow_seen);
>> +	wait_for_oa_buffer_overflow(stream_fd, 100);
>>
>>	/* Make sure the buffer overflow is cleared */
>>	read(stream_fd, buf, 0);
>> --
>> 2.43.0
>>
>
>Also the ftrace patch is not merged so maybe add that to the series too.

I thought I will merge it already since it has your R-b.

These are the only 2 patches remaining.

>
>Otherwise this is:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks,
Umesh
