Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA19BEF48D8
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 07:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A9410E79B;
	Fri, 13 Feb 2026 07:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3fcxl++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA2D10E79B
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 07:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770966187; x=1802502187;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wG232jMeIlpQvZdQYdrsNb1dwpdLtpQwkKrs3xS9J6Y=;
 b=G3fcxl++rozB+N3RquZwhqUbjlyedoG6QsT02KRJVF9V3nP29zmEsRD6
 6vk83YyO7WJBzLiSWO0J76bcfHxajIVCMVXvA71S/TaPeLGPGuOU+GHqt
 2EVYY1KA0kUYFRV/xTPqRcsqoxpQS4/Cx0B3Ozhd2R+eHtffqJwHW1eGs
 nEejoTWhAg6sYoOXPP0TOnDrHyp1idr3YM3AM7wwTT1g6KXqiKTVs8od7
 v/JNlgp1txL3TquWXskV5RLAjbiTBdLA6uw7I4tZjyWZCQrRthESyiv2G
 hXCjbggghhkGSYPJBmGoH0MuriKnG1FIpqDiU1Rd0fBqKGTvF9Voqri2r g==;
X-CSE-ConnectionGUID: gOJismlaQrmR3ANFUeUTTw==
X-CSE-MsgGUID: 9v3ljRSlQFaKDrlTLNBksg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="97606461"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="97606461"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 23:03:07 -0800
X-CSE-ConnectionGUID: VSEt/6z6R2ioJ9yYaEG2wg==
X-CSE-MsgGUID: uofFRGdgRc6kiArkmsW4Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="217010246"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 23:03:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 23:03:06 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 23:03:06 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 23:03:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OR3RbZbwUo3mPWD8RsSN/hxXaU3kHIlQbZfdXVOcBsyX7BCaV8l8/PiQZno8G6uFj43J24LvY1L4cxsnRb4kmESZkj21pFe4maL8iLhYB2oV5RHnrMOD2hoGw2HJNpRaFAIapfisnWYzcaNpgO/at1jpYMY/NEWS2cHN2g0pv0cX0pHcs+GkDO0/z+c/WMCMCLzN6ztTGJbYG7dc32Qj2vS2hg2LUoB1scuc6UT2PmBu7JKAfFcxQF85j7ipvSfT3fPCD7/7XX4UstbKnY4ZeS/qYMGZLNTV1eIB7EoTI80xSs7bGwHuV1oFzJAaPd0umdSPXn8iftrJ8ai4c1/xow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wG232jMeIlpQvZdQYdrsNb1dwpdLtpQwkKrs3xS9J6Y=;
 b=teMQ50C6MoIKU/FAi9IsWeuE6tRX87X1wlcS7GGJaYUuUJPDCxPeZJFSrqvx6hM+mU0bx8J+cnvO2KAC2w3w6QiGC49XEXRoxEf06MCfkX+bS2ADL6qoVbftm2z2sv4DK/uxGIK84J4KToKwvCmMp01yvIbN1RtFcxeTppTd3ZYUhuicd6nxNbPugGIeDoMPhH/Az8PtC019WXIMZfoqfm5iFiQs/alLbAwe+n48RDLSIijJV4t9zJFu7tftG7g2YoP9qs86s/iLLyAD5jHuBJyD0kCkH8xYwqoikjVzLwgVMxN5XjFGNCjhfqvmjmF5LISJU5nO7e6jXFz/4lxM8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV8PR11MB8582.namprd11.prod.outlook.com (2603:10b6:408:1f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 07:03:03 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 07:03:03 +0000
Message-ID: <3ce30394-5108-448d-a0c1-a50ce74d780d@intel.com>
Date: Fri, 13 Feb 2026 12:32:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/kms_content_protection: Re-create
 framebuffer before each modeset
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "fshao@chromium.org" <fshao@chromium.org>
CC: "gildekel@google.com" <gildekel@google.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "markyacoub@chromium.org" <markyacoub@chromium.org>, 
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>
References: <20260106102207.2530864-1-jason-jh.lin@mediatek.com>
 <30bf18ef-c09a-4719-a0ed-0c20d49ce7e4@intel.com>
 <e0e342ca008117af5f88ea8b022cbc07ce11c6e0.camel@mediatek.com>
 <c34b7f2d-7d3d-4cab-8557-0a874e00678d@intel.com>
 <656da96203574bdb080f44bed4d9f296544e5e5e.camel@mediatek.com>
 <0ba9313c98e38ff6c0cc1a5dbb998e468c48a05c.camel@mediatek.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <0ba9313c98e38ff6c0cc1a5dbb998e468c48a05c.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0197.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV8PR11MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e843686-7a5f-4bcb-9435-08de6acdede4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckdtV2d6cUt0VFFUWXFRSTNFZVZrck8xWXlJblR6MHRKTzBsbmtLOEN4ZFZj?=
 =?utf-8?B?TTJ6SnlJMVMrOSt4dTdVY0ZPVlpCNy8vZUZHc3liamxBc3ZENGszalZ5SDNq?=
 =?utf-8?B?anQ5MHhXUzlpa1A4YlZYZ3Npcm5najNqNkt2NmE3WlF6SkZ5QTlCUWg3V0xM?=
 =?utf-8?B?akhlZFBEZ1ZzRERmUFhlVkxjU2JodnUreFM0SDlBU0RIdzUxKzdkdUNyeHg2?=
 =?utf-8?B?eklGY0ZmZThqU3pnZ0ppcWdpTmpQVmMyZ1VUM0ZMaS9RQXdCa2NUQUhmVWQr?=
 =?utf-8?B?TzNkUWlqUE9sSE9QQ09vOVhJcEJtV0hpS1dQNUhqcU5UOVVXdisxQTlyRUkr?=
 =?utf-8?B?ZnYyd2JWQ0x3VEtRWnpFSUl2M1p3d2kvU0svRmRTRkdkblZNL0c1K24zK2NE?=
 =?utf-8?B?djJtWGdLT3N4SndySEVsUWZIamNpT1EzQUVwczF5MEFLcXAzdDJYZlJFZTRm?=
 =?utf-8?B?d1RPSmlLaUxuUnZweVlUb3E5TkJGbjhKZm9FeXdOdTY4SHA4YmJsSm1abllU?=
 =?utf-8?B?R3dwb1pMYlg0VkVMWXhPSHFNOHlWeU95OTVEckRBRkdnbzFHV1AvdDZ3QkY0?=
 =?utf-8?B?QWJObmVLZFNERFFRWWVOYWFtdnJEVXUrZURoam1XekJmTnczclRtZ3lZakJq?=
 =?utf-8?B?K1FtQlZmeDMyVGI1UzdnU0ducHVhcjBDdDd0aEhSd0tyL0trN29sakxYUUoz?=
 =?utf-8?B?R05QcmN4VVFlZjZjR3hJVytRL3NDVm1YOHk0aTBiUXJmWkQzcWE4RTkxVTRY?=
 =?utf-8?B?bU9IT28ybndlNkIvWUxsTXhyTFArQ0lMY2h6TTlHamlvdlpWYllMT1FtWXNx?=
 =?utf-8?B?aDBMTUl5S3BCRElIeThRai9Ra0E1dmsvdEdISzZNZExxREtDR2JkeFpiK0E3?=
 =?utf-8?B?aXltbUc1b0d5TVRWUEtiTWliTnhkajhMQmNpckgzYnV1My9UWUF3S0MrZ1E0?=
 =?utf-8?B?bUVXK1hidklaWG4vQVVLYUM2Y29ldGhnd3lqSHgxcllhUVZxWmxKa21GeGpP?=
 =?utf-8?B?Q0tDejJMVThmV2tnbjRNUUZFTlFqbDdNVE1JUEdYMkNhLzVyRW9qejR6bTh2?=
 =?utf-8?B?MEtqQnczQTZWbEFkRFgxUy9BN1BiR1ZwS3hyWWxTVW9NS2wrS3NWSWIweDQw?=
 =?utf-8?B?dGdGNnVxTlFhS3VEeE5zYjJjK3lrM0RBcmppblBpZkVVclNvQTEvdXpmSzNa?=
 =?utf-8?B?TDVuWVpoWDhLZ2RGdnRrOUx1clM0MEVweWgyOTV4K2Q2dmhpNTVSMnVEdkwy?=
 =?utf-8?B?QWFwUzV3WnRmbXd2VlhabFhCeDhnbStaWUoyaWF5NkxEd0c0SjNnNVNjZ1pv?=
 =?utf-8?B?Q0ZNRjk0TUxtYWQ3TzNTV3ZENFB4NFFVdUQ4d2Q1QXZ6alhpN1BUMkJrSjk3?=
 =?utf-8?B?aU5ickhsK1F3Z0pTZ3NaeUNsd0NRcStIRUFBZXhqYTdFemgzODNRVEY2UW1Y?=
 =?utf-8?B?YzJQbXBaT3R0NnNZaWdyN2E1empLalpMOU9RNTQ4L2NtRy8vWHJBUlJ3dGk2?=
 =?utf-8?B?K2JtWkFKUllWbjU0ZVdlV21aT0VIWWJXSWlJV0RQNHpJeU12bEx3UDh3ci94?=
 =?utf-8?B?dUU2RVRxdFlkc3pON09SaFpTYWNzN2dVd0VqeDlwc2dTMlg4RkIzR3dMS1hW?=
 =?utf-8?B?ZU1RMWV6dEJYUThqbWVnNjJxOXVtdzhVVEsxcmtwcWZ3eXkxSm00ajgwbTZW?=
 =?utf-8?B?VjRVaDg5Wk5pSzFkV0sxTkR3Q0xZOWpqeUpRWGc5eGljallmSmp2ckQvWTNi?=
 =?utf-8?B?eDVmTTVKRUpnY3NOSGI2c1pFdmJibWRURmJQZVVKNUtSTDhMMm9Nanh6Y2Rs?=
 =?utf-8?B?QlRXZURKa3lqNkVFSWlRQURjbExiTjBvTVhmVjQ3N0Y1YUorS0lXZ250WkJx?=
 =?utf-8?B?ai9qTGtyWW5WaUsyZjB0Z1NpOXpWY1l4Q1gwc01QV0NNT3VxV1ZyWGE3aUFH?=
 =?utf-8?B?N3VqaDRUWW9MVVBuQWxKNW9taU85MVA0dXY2Z2ZncHZpK3N1NzUweGFoRERx?=
 =?utf-8?B?VVR2SEkzeVVwdmFsZTNVcXhDNVZOZ3JoVWhyUTVtQzgrTis1UU5kTnh3S2pv?=
 =?utf-8?Q?VOUjkf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0lJOVBCR05wS1pKVm9VMHljS2d4bVY4QUtUeFN2MTdJZ2VETnVzT0lxOVZ4?=
 =?utf-8?B?T2ltVmRwbFVndllRbHBqbDJERzk2OSsrWlllTEtRTFNrNFJ5UlE2aE84UStl?=
 =?utf-8?B?VnMxT0YwVTBFR0VNdC9XZnorNDE3cHlSclB6ekpaL01aZjFva0JTQ0FGUE05?=
 =?utf-8?B?b0l5Mk9sOVpFaSt0QmxaalZsNEJGT0xOT2lsamg4cmhVQlJrNEx3V2pVTTRz?=
 =?utf-8?B?cTlNWE43aFEvTm1yeHJLL3hnU0xVMWdIeVRUdWhURk5sUHlxc1I2eTlxMm5F?=
 =?utf-8?B?K2tHR3krOE9WNGc0cG81RnJMUlNPQW1leDJBMWNQaU4veThoQVIvUk44ajNT?=
 =?utf-8?B?VUJZL3U2RGpvZHU5QU4zSVpGenJ5VEhENWg3c2srRFlwNkY5bkJKSHdYNFoz?=
 =?utf-8?B?cjdoc2ZPTnNZMjNCZDNGNjhTVXRaSTVzbWUycmpHQkQ3OXdvcFNFVmR2U2Jr?=
 =?utf-8?B?encweElHLzlPY20yN2ZvSGdlRFR3Z2k0QTRNU2FqMEcwTDNJdTBCdG5qMTZp?=
 =?utf-8?B?SU1FcGtEVjBISHZqeU83MXN5SDVZT0xocERISmhWWU83dytZYVRKZjdzK2Yz?=
 =?utf-8?B?VzJQUWRMeldGbTJnKzZLYmxFLzRLanVhSENQZkVQbVlvbENBcTAzUzNNb0Ra?=
 =?utf-8?B?L0p5NTduU1p0SGtLYVJ6VzJKWmRWMUNGSllXN3J2WGphekdBOC9BcUlJY01T?=
 =?utf-8?B?aHdLU3Vkd2N6d1JjVzA5VnNvRDVLdVZ5N2hocTVHSFZLajd5OEQ3SWRMWkVo?=
 =?utf-8?B?bjIycGwxZTZPakZWbVJhT0dHUkxaVThuZmdGclU1WE13c1JYOGlvQzBxUGdZ?=
 =?utf-8?B?ak40OXZTMXdaY2xxVzBXa05ncWRscVgrUlJ2a1FnQUJtNWdPSkFZcTExODdT?=
 =?utf-8?B?MkFsbTBkYmxrTTl0WmxQSWRTNTVjOFdmdmpSQ2hNTE90UHhtaEtQOHVCVm1B?=
 =?utf-8?B?dUpLM3FmdWw2cExhaTFiNGk1OTlaWDZ2Zkh2ajZOSUhkWHVoZlhhaTR0WFFR?=
 =?utf-8?B?bTNHaUpSMDFSdUI3OHB2b2tKNnpkZEwxWmZIbzcxaURXSXJFSUVsTDdDaCt3?=
 =?utf-8?B?SklCM0N2eXpBOElKUUlqZG1neVhxUlcxczBUUEpNdnpRMlh4aGs1eTVQRnQw?=
 =?utf-8?B?c29GNWxGditoYW9JV1JnN3hXRkYxL0hKSmllOGw4eVo1bmtjOHBjY1pudC9v?=
 =?utf-8?B?eWV5RENWN2t2SlZGSmR4dUJSemlPQkZaZUhjS2xwMHFXL09mTXRjQUtjVjF6?=
 =?utf-8?B?eXg4d0NiYWIxbURkT3lNRVpBcmRxQ3pYK2JsNzFFN0d0TGE2aURaZXR2ckFm?=
 =?utf-8?B?NUk2YisrbzdRcWs1QmNoKzVGTnlhVzJLY1pocEl2eW5JNjJROWplblBPTkRU?=
 =?utf-8?B?NVpKM2dwWGg1clBDWXFSWm81anNZY0pqMjM2UHI0eTFEdDgxVkZzRTFKSXdT?=
 =?utf-8?B?UjBDeW9DNmRqSXZBR3JqSGdzWTZZb0tubFhiQ1NwSEZyY21NSXQvakhRV3Jh?=
 =?utf-8?B?eVRwa2oyMTgzSEp3cFpvbzYxWmhoSXlNY0wrODhIVDRUS3R5S0QrVXNiQm9D?=
 =?utf-8?B?cHNiV1hJM3VkSHFZTnBPT0dxVVZERkhOYytoR2ZvbkZZMGY0RWF4bVJxdlZp?=
 =?utf-8?B?Q1cwT2xYd0FKUjVVSk1WREgwcVVoOFhVeElISUJ1ZThZVnRVcHFYa1dTbTZa?=
 =?utf-8?B?R2hxVjNzZ0pKeXhudTk3TXduK1owTVRMSkZrU0tqWWJmbEtjeUdNZktXYmJp?=
 =?utf-8?B?dk1BNEVKQ0ZFM0NXUEY1dkpmaG9JUWxZMlBxMzF4c0w3Y2R6Zm1YanM3SjJ1?=
 =?utf-8?B?U1lCR3V4ckZqS3FqYk9ZT3QxbThyV2pHSHpsMHdXLzM1d1NXS0UxTUJhM0Vm?=
 =?utf-8?B?L3BFSmNyeE1vNlhsOXpOS0I5ZjZYTm13aGcwNS9mcUlUMGVEQm9IZEY4cWFC?=
 =?utf-8?B?Q0xBa3lDK2hPR1JQZ1JicFF0d25MWGtBbDNScG5zMS9CY2ljVUJmMys3b3hl?=
 =?utf-8?B?V0ErMnhtMmhqQTdtMFdYUUNQUW5hVkt6ejBTek1jYkNFMVJhOUJJd2xZNGx4?=
 =?utf-8?B?dC90b2NtYmJ3dTJlczh4U0Iyb255RjkyQXdVSUtWcmNCdm1FcEw1YWVia1RT?=
 =?utf-8?B?WWRCRGJTN1BSVExERWl6b1RBS3FuWGdtd2NaZnh0Q0NnS3prdFR0clM5Vnlk?=
 =?utf-8?B?eXQ2dGVOL3NXRjI4VjFud1J6bDMzcmUyT0l2ODluVXArenIvVHdFalozdjFo?=
 =?utf-8?B?aGFYdjUrM1lGeUNDKzdlY3VjblEvL3g0T2VzOUFBRHArdDBSRXFnZU00UE1Z?=
 =?utf-8?B?OHpaWGNkd3E1bHdkZzRpTWtNY3BmVi95OEI3VDhvQUhtUUg0VGQrQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e843686-7a5f-4bcb-9435-08de6acdede4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 07:03:02.9233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJi8oBzAQBPLjqhzLItDpziPx0PVMnLkpzfY/iRaykJbTd5mlktEX711Xp0VBf6dEyUCCbi3XIZuKsP8W67yJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8582
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

Hi Jason-JH,

On 2/10/2026 4:04 PM, Jason-JH Lin (林睿祥) wrote:
> On Thu, 2026-01-08 at 22:17 +0800, Jason-JH.Lin wrote:
>> Hi,
>>
>> On Thu, 2026-01-08 at 11:13 +0530, Karthik B S wrote:
>>> Hi Jason-JH,
>>>
>>> On 1/7/2026 11:59 AM, Jason-JH Lin (林睿祥) wrote:
>>>> Hi Karthik,
>>>>
>>>> On Wed, 2026-01-07 at 10:34 +0530, Karthik B S wrote:
>>>>> Hi,
>>>>>
>>>>> On 1/6/2026 3:51 PM, Jason-JH Lin wrote:
>>>>>> The red and green framebuffers were previously created only
>>>>>> once at
>>>>>> the beginning of the test. If the test runs on multiple
>>>>>> outputs
>>>>>> with
>>>>>> different resolutions, the pre-created framebuffer's size
>>>>>> might
>>>>>> not
>>>>>> match the mode of a subsequent output, causing the modeset to
>>>>>> fail.
>>>>> I see that the test is already creating fb's considering the
>>>>> max
>>>>> width/height among of all the available outputs, so ideally
>>>>> this
>>>>> issue
>>>>> should not be hit. Are we seeing any actual failures which this
>>>>> patch
>>>>> fixes or just doing this as a fail safe?
>>>> Yes, I did hit the issue.
>>>> Our first output has a resolution 3504x2190, while the second
>>>> output,
>>>> which supports HDCP, is 3840x2160, so the framebuffer is set to
>>>> 3840x2190.
>>>>
>>>> Since out platform doesn't support scaling, atomic_check()
>>>> returns
>>>> (-
>>>> ERANGE) when the framebuffer height needs to be scaled from 2190
>>>> to
>>>> 2160, and the test fails.
>>> Ideally it should be cropping and not invoke scaling, but yea as
>>> this
>>> test is not about cropping/scaling its better to simplify this test
>>> to
>>> avoid the failure.
>>>>>> This patch moves the framebuffer creation logic inside the
>>>>>> modeset_with_fb() function. This ensures that for every
>>>>>> modeset
>>>>>> operation, a new framebuffer is created with dimensions that
>>>>>> perfectly match the current output's mode, preventing
>>>>>> potential
>>>>>> modeset failures on systems with multiple displays of varying
>>>>>> resolutions.
>>>>> If we indeed see the issue and go ahead with this patch, fb
>>>>> cleanups
>>>>> need to be handled for the additional fb's created. Currently
>>>>> we
>>>>> are
>>>>> doing fb cleanup only once at the end of the test.
>>>>>
>>>>> Also we need to remove the existing fb creation as it becomes
>>>>> redundant
>>>>> with this change?
>>>> Yes, I definitely agree with this.
>>>> However, I was worried that it would break other tests in
>>>> kms_content_protection, so I didn't remove the existing fb
>>>> creation.
>>>>
>>>> Since data.red and data.green are static global variables,
>>>> Isimply
>>>> called igt_create_color_fb() again to overwrite the original fb,
>>>> but
>>>> this could indeed cause the potential problem of gem_handle not
>>>> being
>>>> properly released.
>>> Yea this is not recommended to overwrite the fb pointer as it will
>>> cause
>>> leaks.
>>>> Do you know if I replaced the original create_fbs() to here,
>>>> where
>>>> should the original igt_remove_fb() be moved to?
>>> I think test_fini() should be the right place to handle this.
>>>
>> OK, thanks for your advice.
>> I'll verify it and resend the next version.
>>
> Hi Karthik,
>
> I've sent a path to refine framebuffer management for this issue.
> Could you take a look on it:
> https://patchwork.freedesktop.org/patch/701191/?series=160737&rev=1

Sure, thank you for the patch. Will take a look.

Regards,
Karthik.B.S
>
> Thank you very much!
>
> Regards,
> Jason
>
>
>> Regard,
>> Jason-JH Lin
>>
>>> Regards,
>>> Karthik.B.S
>>>
