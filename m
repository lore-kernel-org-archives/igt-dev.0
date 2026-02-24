Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9300E9B24E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 11:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E4210E564;
	Tue, 24 Feb 2026 11:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WP9+lrvD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D3D10E564
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 11:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771932011; x=1803468011;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mAwi95zX1xBVa71edsYzjrL7uzyHIx0ttSs0Hv+St2I=;
 b=WP9+lrvDTigIepmlWHibvQC+8UQEEH66CkkJICG7mZPO1ooypCutG4Fs
 RH/CEg2hg5ylF2jfSXJHQC+xpVo7qcqUOGHVBsGB4qF1noneEyvUOZ4/q
 aFiasU8BmF2jcv7YrRFriFGWvxDxqqTx7MNokl9AURQJmSa8Edyvg94B2
 tFDKlbdEYz69PqNrOkfZMXFYJk7kHb4Hyr1hfUX+v2UvBPwTermBoSq06
 Rt/fvXcgb+qRAfdaha2HrimtFuP1dzJO+i47WxXxAP3jDyZHFnaCe5RG1
 SWVnGl2l+ox+YIjdscIdahAqOHHGHyrVkgB+W6Je87oAiiwNcJNBkUvk4 A==;
X-CSE-ConnectionGUID: WnFEkO6/SvOQkPCCd7+esQ==
X-CSE-MsgGUID: qZiJMfbWSoi6RpFFqdTfqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75551207"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="75551207"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 03:20:10 -0800
X-CSE-ConnectionGUID: Z3CIuBkDQSKAZMOlSbKb2w==
X-CSE-MsgGUID: J45TXJyeThiqx8BIZH6i/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213697432"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 03:20:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 03:20:09 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 03:20:09 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 03:20:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6B5TJZk5z6qFkUwP3LTN++Q+tEp0SeTiFX0bLm802AKmw5BDulmBfy2TFJRrWPddP242/bgbuahVfsEnl9fQV+LdRN/NfeG6diHeowWqHvn+WV1rdaDHab9EgFG9sOI5jtJMColt7LN7qZ1IxTJxwud0IuvqO/C63nXa7Sh+UmDWyhX/O3kDXoCxymKnt6uq/scAV3qXrzOPPxxnKTXy7V3uuLGW7+9Eesl612hb+T6aGbLyGojU58sxC9qpK3J2yowaB59VxaYzLKSgblWP4t2p0UEw9oo79cEuK1JBlQJQsNghmHaGU33F3HhUV0oR3oHTmQ/XE9r/MLFPe5a2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqJJsSJk9C8ILuYLl5UaqZrKUvqlsoyN2nfvL3OeRRU=;
 b=gsWE3Hkp5EtPrcIf/68hDPsndHu5OUZ2+Al5sSXCupkprY+v7WNxmKlq0nCiF/FO470JttmvCBBkySPSP42dMksy6YbYWpUEps+wN9EN2FB24cgcfzMPybFICa4fUXuR6PPtEZpng46yp05UN9D4oVDI6nbZPqYeRroGcBCIRIiRX9iI55/ClGcqFx0+LQGH8YDf2VFfYL2gcY9Qar33VOXlse+I6fFRLcQ4Z8CpLRsRdn+1sobYgqNkfS27PAX+uZHcMWlEdkEaQ2e0RgtJwAn4UQArhYaocIWk09KaZMaZnA/sHa3lg2getlrqZd8KL3vGl4JgV5aece/w00tO1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Tue, 24 Feb
 2026 11:20:07 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::84fe:e701:add1:4de5]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::84fe:e701:add1:4de5%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 11:20:07 +0000
Date: Tue, 24 Feb 2026 11:19:58 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 i-g-t 1/4] tools/meson: make per-tool dependencies
 instead of using global deps
Message-ID: <4wuaet6pvriuayet7d65zkaybdbljtlcu63rtpj2zxrhfyetea@mwn2mezdjkad>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1771510028.git.sebastian.brzezinka@intel.com>
 <014b324e5cb2e5fe00aca8bdb4ee2b03da75668d.1771510028.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <014b324e5cb2e5fe00aca8bdb4ee2b03da75668d.1771510028.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA0P291CA0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::7)
 To PH0PR11MB5064.namprd11.prod.outlook.com
 (2603:10b6:510:3b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|MW3PR11MB4555:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5ec9ff-75ad-48e7-9d85-08de7396aa80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkxuVDJsNE5lVk9sUHNqVGh6TzBGSDhRakVmZ3lkRkZleTg1ZHJqcFBTLzdU?=
 =?utf-8?B?ZGo2dzVRQ1E3NVFFdENoY0cwR2hsa3Z3anJzWE5WWEF6WUtqc0VyU3hPV0s5?=
 =?utf-8?B?Y0VYbnFvMlFpOXJ2NXJRb2R1OFAvdXhvRFVKNXQ5d29wMUNlZW1WdW8yZ2NK?=
 =?utf-8?B?UVpUdi96d3o0eGNOOXhMekRwVC9rSUNQTENKUStWSnozZmVyVUliY0liK1l0?=
 =?utf-8?B?TDZuaEl5U1Nwa3RveWxubTZpcEE3eFQvdTVBcXo3YzJCL0ZsVzlud0JFSHQz?=
 =?utf-8?B?K2hpaU4zengzZUpWVEg0V1kvdFlJVWFrRk5JZHJIcmI2elZoSTlZM25OSmxq?=
 =?utf-8?B?eHhUVGY4V1BvWE5DelBoUW9xRENzMWovNEhya3BMRlNSTGZPeHVjOXpIWHhW?=
 =?utf-8?B?a0Uyei9abno0bXdlYlNRMTB1RmtqdFBHSTFSNmMrY1Z0UnYvd1o2L2IwazU5?=
 =?utf-8?B?a3pkcEJWT0ZmMWVkZlV1UFhIMVZQZFhZWStyd3FZcXJrMDJNYXF4a2FpblVP?=
 =?utf-8?B?MHZ4bEM1Si84bkZHQzFjMktLZ1MwYXhJRnpWdE9ldVMvMHJZSWRlNGIrWWZ0?=
 =?utf-8?B?VGozSzloQUw3bmNscU5uTmFDWHJSckM2RmZRTG9WS3dLTXd0dTlzbG9Nc29G?=
 =?utf-8?B?VDVnaERBKzU0MXE5RnFNRXFKVlFkUExUckpCRkNHYnVZcWtqbmJ2NGZqTk1C?=
 =?utf-8?B?bnRoclRUa2NtV3pWdG9SN082eGpWVldvMHp3Z0Y0bEhRa2NqS0hlMENUY2NI?=
 =?utf-8?B?NzJMdlJiakUweTYwTTcvcWx0TzN3ZzZrU3ZIUGhwTnhXWi9RTDhINDF0RGlT?=
 =?utf-8?B?R2x5M2tzbnhNaEUzNSs3dTM4cWRSLzhGTHQwZ0FhTmlKRit5cmhPS2x6S3Zp?=
 =?utf-8?B?L1dTZ0hENUdCVVUrTjc0RThVN2NtdkoxUGlxcElMU01qbVczazl1S21DTThl?=
 =?utf-8?B?cmdSVTdUay9zRndtL1FIbVhtZy9sdVl6YmFybkIrRm1UaGlBd3c5STJEd0dr?=
 =?utf-8?B?M1ZOOTYrZ1RRRTlLdHNSL09Yb3hKQ205eFF5d21CNjNVWjlFY3psVkc0aXFm?=
 =?utf-8?B?MjRaMUo2aHd4cURsam56ZzdWUG0ra0JHbElCdlo1KzA5UVhVSTJuSHBwTzYz?=
 =?utf-8?B?cHF0c3ljRHNoM0JJQ0IrWXRGa0Qrbk5qWC90aTJZR0tUdEhFTjluUE96UW4r?=
 =?utf-8?B?Y09jb3hGU1VUdzZNbnhmaUYyMXZjYnd0MTF1d0tYVWwxN1RoU3d1RmNZUGRj?=
 =?utf-8?B?TDIzV2FydEZmQVdSaDJoc1VvSG5kckRPUWRHdFRnMVhGNmZYdmF3bnBqeTFl?=
 =?utf-8?B?MTJGMG5kQ3JDUWtPVW44eVNuN0NsQmpPK040RkFaTEJidlFndWVNL052Rm9r?=
 =?utf-8?B?eTAyNDYyR0Z2Ymk4RWVYd2FQRm5kUm0zem05R1I0UkNLS2YzRlBlVzJMbEI3?=
 =?utf-8?B?STRIcVBMS2h2Mm1xWHV6cnUyd2pSdVVmOFJsUmljMThhZFBzS2FXb2Q1Unow?=
 =?utf-8?B?TXJCd3F3YU1tcTVLNDNxcHpFczZob2lFRm5EeXFka2VJU05wRHVDa3JwNms3?=
 =?utf-8?B?Wk9pTlE4VFUvaCtPb2FCSEpaYjJiQTNNTnN3SHU4dGcrSGo3a3kwcVpPTmJQ?=
 =?utf-8?B?RSsrS3dLazh2Y0QzcHhlMzNzN3ZLVkMrODVSVEFkd3JPVEVtVVhBU3dITmRS?=
 =?utf-8?B?ZklzUDlNeWdtQ3dnUUxOTTJUMzBKR2V1TnlNekZTWEpSSWx1UHFYekZpNTJi?=
 =?utf-8?B?SnlJVmhWSmdTc0d5bFJwOGRIdnlydVlLR1BuUXJMdmZ5bHJmRUFhVGdjR0Rm?=
 =?utf-8?B?bVpSZ2Frc2NjRjZRN2JjVmtZdzIvSkFTc3JUMmRjYWNnd01uNE9WbE5xSFZU?=
 =?utf-8?B?b2xWMHI5b3h2MUdpWEFMUFQ2T1M1WDJ1U29wLzNTd2h3WkJBdlNKNnlLSG5i?=
 =?utf-8?B?WkkwSW1WbVg4ZkNWcmpuK3g2RjdDVG1UNHFucThHaStrYUJtV3NJdG5yMjhX?=
 =?utf-8?B?eWprdTNCWUx1ZXpFQU51b3NsVE4xVXRjVnJNZ1pnb2VBS21lNGhJeTVxZkd0?=
 =?utf-8?B?bHE3K3pxL3NsUndNTkRkbG1Ldkh1VTBaZEdVWDFYT2tGdjhEVWZYT2J2WklG?=
 =?utf-8?Q?e7OY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3lEU0FJUHBjRFNCMnNlMFN6SVd2QVdKemw4Q0RiWVVEcDhrdFRYSmllY0dy?=
 =?utf-8?B?RUdZVWNZc1FteXhpRWNWZ1pVMnQ3ckhKSk9tTzhaZlRvek0yTFd2blNTQjVI?=
 =?utf-8?B?Sy9rUFZENjZIRmc4RFpVMkNLaWVGL1h4dW94WHBhMDlEZDNLU3YzUy9hQjJm?=
 =?utf-8?B?dXgwK20xd3NieHFvSVRJbUtDeGNTVmJkR3ZZYUw4STZVTEpXZ0owN1NOMnRH?=
 =?utf-8?B?QWxibWRDaXRtU2p1YnRFem1ZUDFEVFBrRHZSWnkvTWs2MXVFVkNMeDNxNjNq?=
 =?utf-8?B?STlDQmZaZm1KQTlSVGtHZktjVW9DaFU4c3BWQU41WkZiR2paOFZWaG4yT1pZ?=
 =?utf-8?B?UUwzanYzWDVxOUE2UmsvWGlPZkJKaFRJVkhNeno0bnNsbGlTQkhkTTdUN0hi?=
 =?utf-8?B?WUhib240Rlg1ZlBxaTUvOFRpblpGUnlKY2xUVkxxeDR2T2xaays1MUNIWTFa?=
 =?utf-8?B?ZzEzNWJlL3VzUWdnWmJyczZqS3ozZFE1NUQ3ZWlzWFNSU0FhNWRDQ1JnWWQz?=
 =?utf-8?B?NkxJcGw1d0pnSjU0aFF4MHhNd3llODQxUmVQM3hDWksreEFJUHFPNlFNWnht?=
 =?utf-8?B?aDlPd2JtTFdRWWRlUG95L0FGKzI4VVhCRHp0UEJjTmtNTkNBdWh6dmFrc0dU?=
 =?utf-8?B?Rm9PazQyOTR2WWljeVVCTkU3b25FYzJRaXd4bWRRYXdIelRKaXl3QzNSc3F1?=
 =?utf-8?B?Y01oaE5IdmVjL05jZy9WZjNHZU5kN3BlYTJldFdpL2JkSGh6UjhvaFBQc2U5?=
 =?utf-8?B?Qm4rWlkzdS9hWXFaMEpqQnJYUWdYR2NqcGZhbW1aZ2RQcFFZY0t0aS9PQUVo?=
 =?utf-8?B?TTZydWVlblQ1Wld4RGhxL2VkaCttZGNVelR2UGMxeVZBc2QvMzQyNGVkRzhi?=
 =?utf-8?B?TVFUNHhmN1VCK2xtc2FyTUJkcjdFcmx0aFJjMFFPTjRyelF1WUIzYjlCL094?=
 =?utf-8?B?MDgwbHVSL000RjVVcHR1WURHSExvNmlMV1V2K3ppWUhhN0RXaDhvei9mbm1H?=
 =?utf-8?B?QzhubnlRWEZiNFFjTFhhM1Y1WDJVMmhOdDRHVnNaTkZUZmZMOUJZRXUrSGR4?=
 =?utf-8?B?M0ZCbmdxVVM3ZEoydm5QU2FUeUhMdWhKSTVtV3J4Tm1CeHk0UjJPS0lOODdZ?=
 =?utf-8?B?R2o0L1RQaXZRVy83L25vcS94UGVEdkE4cW1KS0M4cEs1bndFSkV3TmtlM0Rm?=
 =?utf-8?B?REFLb0Z3emt6UjlEMloxUDg5WG1pOHBLQm9Xc0lYTVpjYk9vVnRFaTRRQTBw?=
 =?utf-8?B?ekJnczdDaUJWOW5qSGxKZFlWblc3UTlvSUx6N3Y2ZTAwZ2szTEdrUTFZT2tE?=
 =?utf-8?B?SXZKSThZVGZSSDRVaEVHcG5mT0lWSTZETGhubDlqSzEvRm0wN1JUL1ZSczBW?=
 =?utf-8?B?MWpuTDN0MVRiWUNCbXVDMGVjUEVzays4VTAzZE9RMTBKNy9mMk1zZ3BDYVNx?=
 =?utf-8?B?UE5QV1NnUWhDZ1dwekw4Q09TTGZkMk54cjMydk9MQmsrUEh4blZDRmwzUC9C?=
 =?utf-8?B?MWZRVWdYM3BodUFuZUk3bjJTSDlnbzE5VmJUcWwvMWRmMXdGekZGZmFsOXps?=
 =?utf-8?B?TlliR01RZlJZaWxLTk9DSnZRTmtFa3BvSFpxN0FJTGttQmsveUJXOVEraTJR?=
 =?utf-8?B?WEJNL29KRW43M0ZHYWNwd0VXQnFhZHFGS1puSmFhblp0dUV5MGhOOXpKdTla?=
 =?utf-8?B?bUFMUFR5V1JCK1RHRU9KSm9sV2V1Q3JwNEhmbENuRU5USXFJbG1RbFhBTk4r?=
 =?utf-8?B?VlAyeEJLWUZqcHEwQUZseXdyOC8wakR3MEJsK2JmK2pvNVJ3ZlZwSFl4dkts?=
 =?utf-8?B?Qjd0ZS85RUdSTTVTS2x1cndiZ250TDhQNWVpdVNURVRpT255bkVSM2R4bHpl?=
 =?utf-8?B?VWxLeW9haHh4bUxvSXRPbXZUTXM3aG05SVpkdG9mNlEvK0hpWjd2eXhhL0Jp?=
 =?utf-8?B?Vlp1bTBWZGFjdkJXc1QzbzY1VVZnZldYRExsdUtVeUx3WW1FLzdEbG1QeEZ4?=
 =?utf-8?B?UE9jWE9mQjYwSjBjV3dqUTVtM2Nkc1dJMCtXS2xwbXhmRXcvcTVxV0ZZRTdO?=
 =?utf-8?B?RnZmcVNCS0xUZUhHbFdMNWFQaUVrR21qYUcxa2NQd1VCT2hwNk1NY0t4MzZx?=
 =?utf-8?B?a3Z5M0tqK3k2T2hVQWMyM2szb3U4Nm50MXprS1o1WjBtM0x5dzFPYlNEUG5v?=
 =?utf-8?B?ankrbDRqS2hNVXl4dlNaTldPajV3MjJrUGJZZUl2ZVRHbm0xbG1vWk9jT3BM?=
 =?utf-8?B?RmFMZWJTT2lqdExBM0ZRcXdqbjJHcTIxazRZMTFGVnl4SXoyZ1ZmY1hBSUVH?=
 =?utf-8?B?RUdhUFJUaE5ZYXFlZ0pLOHprMElGdGdhTWVrWi9FSnB6clZ0RlRrd0RHa3VI?=
 =?utf-8?Q?dXl1HcFCZuDt7i6s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5ec9ff-75ad-48e7-9d85-08de7396aa80
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 11:20:07.7073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woJvsENAFYVbhafRiKtmD+MNuUgrIjHDMqBtNhu1TkTlQ/spyHIrFok6iupTOaHdfYwjjepzq4RrHf68NGviMcRneQyVg4k4EDlMsT+s8Lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4555
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

Hi Sebastian,

The changes look OK, I also did not experience any problems
during build process.

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

On 2026-02-19 at 15:14:50 +0100, Sebastian Brzezinka wrote:
> Rework tools/meson.build to stop linking every tool against the full
> global igt_deps set. Most tools do not require cairo, glib, udev,
> pciaccess, or zlib, and the previous all‑tools‑get‑everything approach
> pulled in unnecessary libraries.
> 
> Introduce a small shared base dependency set (lib_igt, libdrm) and
> switch to a per‑tool dependency dictionary. Tools now declare their
> actual extra requirements explicitly, reducing over‑linking and making
> dependency intent clearer.
> 
> Fold previously standalone tool definitions into the unified tools_progs
> structure and use consistent executable() creation. The tools list is
> also reordered to keep it clean and logically grouped.
> 
> This is a build‑system cleanup only; no functional behavior changes.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---

-- 
Best Regards,
Krzysztof
