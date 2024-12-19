Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A87CE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 14:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4B110E00D;
	Thu, 19 Dec 2024 14:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USz/bDTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E070C10E00D
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734619170; x=1766155170;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=nopsG4JO4HBv1zVhrTlvuAa+JVQ2uY4c42oi+3nBbhA=;
 b=USz/bDTWbAyyMFFaABz7Bl6oavr3DIn1PTzt6uF3STtgEnjQQW/u43mY
 +j2AqFqDgU0j1rxdmh7Mb+1BfzV64OfP2ODxJHukNcaaSZJ6JP+WxldLO
 hUwN63i15pHxzEis3eMdY6P4V3MtVaS3PzSojVTb6mcInJcDKzso0qgJ5
 xQRJO3Innz+wFl7mGGGi5eASrolyQWL3fNAZcjNZfVhOUbMJH/4tBJbFc
 IMRerHCDXB/Yxxmit/Twc53+0FGVVH/pu1uUYkX6a+BkNgf49u6ZHJtYn
 HNI3uFLvSmPY8c1vUohaHq/eLc49LFd7JOvkrlgkB8+o6x2FFlDl/RX7r g==;
X-CSE-ConnectionGUID: 2/7PnmfFRoecwcx/b9ijlA==
X-CSE-MsgGUID: GDDfdj2KQCG+nSl4uowyzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="60510691"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208,217";a="60510691"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 06:39:29 -0800
X-CSE-ConnectionGUID: Gbp83l1YQsyPM87HqBqy8A==
X-CSE-MsgGUID: MKQrwvH+RR6a9jj4bJc/Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208,217";a="99034519"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 06:39:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 06:39:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 06:39:28 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 06:39:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rfvzmc34bnxazKnvXvuLejlePyNtlpTrCgtKHaJwy+g3xQi5GUw6JSJSVv3Jg2z33pXFmgBC0pyPZVaFVcLlKuGuumI/fFH9O0IskSyCKcAMpqciqCr9hWoGZVMuV81HGySg31HW2urqpauqnxhssBfb+mh2A2A+8RWumoQQWHDxYc9IdYIqimzAwfX3wM57OIjW9pA+DSqmm6JfsfrRBWMovYJY+BvOF/Ch7jQnzR21RkN0hSR3oAZPXndsJc27JFEDlNX0c9XF2SgL+PeYlz06zmFgRVB4mOnGcyvARq6n8RpmgyOksMGWhWV/xC3FbcD8bueH9G4p/IOYBnHSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEgDFp8HAmMmCr/H5Rx19EPYYH9GJIEuycme4vPdTCw=;
 b=JhrCC3VrMUylzU+AEmjOHfjsgzi5iQS/J6aFuKLnSzLO+Wgg/zp37FZrfmikdOhamMcrhtV0+fLn82MN1Hr+vWp3AxN23glj99gZYuizw7AWvjfgmoMgyXad58Ckti4tb0JuwTM+ILG8Ton5viEenYh8J/wwWxQzlvj2gKF1pvR0IkdlGBLPXXfqPipQEKhAMZy/LyuCyJ/KWNipWPu/wTRX9lY6magLKzwJ3hOHRcSL08riMH5B01+UBwz7HKsDxsz/WA8lAwXyg/wj78idiHxeTOquT7VdfExUlZnm0J5SBXwTkckhx4Kdz+tjOMyrMGLEhOKkggGpnPpVEq6mxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 14:39:13 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 14:39:13 +0000
Content-Type: multipart/alternative;
 boundary="------------6eJXJZnOsveCMFnSOAcdvSHL"
Message-ID: <08f8f82c-05bd-4ead-acac-e5c18f462ab7@intel.com>
Date: Thu, 19 Dec 2024 15:39:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/5] lib/igt_sriov_device: Add helper functions for
 VF range validation
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Marcin Bernatowicz <marcin.bernatowicz@intel.com>, Adam Miszczak
 <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
 <20241218120056.779962-5-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241218120056.779962-5-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: MI1P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::15) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb0aa0d-f5ce-40ae-bc8f-08dd203ae813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mjc0MzdBSVVpSFhnUnJuMzIvdkZNYkQvWWsxOWF6UmptUVJHWDZKOEF3Wk1X?=
 =?utf-8?B?ejZGTXQ0ZUY1ZGwzS2V4ejgzcm92cE9YdlBoSEtEcSt3UjF0S2x1c0U4Y2dV?=
 =?utf-8?B?N0FRbHhoWEhSeFFxeUtPMjdvNE1DNXNXbTMwOTE5MWtGUkZxMWlvYllGeCtv?=
 =?utf-8?B?Zk01MkxVZ2kybisyRHhzcXRGZWpvSVd6bmRJTlJMelF4RWlCanRraDZmTnNP?=
 =?utf-8?B?T3ZqdzRSR2xBUFFYNjVqQW1HRlk3bEhpR2pmZ2h6dndva1lpOHQwenJzeUdn?=
 =?utf-8?B?d0ZpV0JYdThCbEloc0lIOVUwK0hqZklCYUYvaTVBV05mQmxYZWIrRHJaUzBx?=
 =?utf-8?B?UXlaOWZPcmdlTnJRQWxUdU1HV29BbEoxeHJuUnFmaDZvdFRURElyTldlbXNR?=
 =?utf-8?B?RkJIdEZDTzdpMzE3NkYrb3J4S0phVkZwNWhzR2hCd0liTVN6R1JCZENZcWMr?=
 =?utf-8?B?Y1lLc1dabXJuNzA1QU5HWkJWWTBnZXM1R2U2Y1VYaFBaVnBuVWFMUWhIS1Jm?=
 =?utf-8?B?QzJpcDdUUlZkdmFmRldNUjJLZktvelRaeHpnRDYxY002eVcyRTZkaERkV2U3?=
 =?utf-8?B?SUo5NGdqMjQzZlFYNXJiV0VqdUdPVTh5ZEJaYTVjREx6SVdUcEUyZDdQdkVG?=
 =?utf-8?B?d0JuQjVKeDZ3a1dzS0s4dlk1ZzMxWHlDMXlscmV4enBubGc0UEh6L09iM05h?=
 =?utf-8?B?YklBQjFwUlZVTE9yRlNjQUxFOS84UTExK29PSmo5ZUpJZGh3aE04OXVkUnEr?=
 =?utf-8?B?OFVPUk91ZEcrWlJaODgyeGJMQWpSYzR0c2tRVHlvQ2xFQ1RSZXRhWFR5SVdF?=
 =?utf-8?B?aUZOY2JPRVJZMFpiY3hia2o5dmJyVVdVbkZoVHZkNjRJeTlaSW5rSWdFVXVR?=
 =?utf-8?B?MTVjVnI2ejRodUtSbVBZQTRRYktVV0NicU1HUkVWM2xVc01SS3l6VjREbDhC?=
 =?utf-8?B?MHZuUG5UaHh2NWZmUEsyQmRxcXoxWHNmQ3JOQm41MFRJTHhWR1FBZmQ2S3Z2?=
 =?utf-8?B?OTBFTFlCcTVqeUh6cTNNekZHNS9DckhKRUtDUklIREZMTnVpcDM1WThMdFRq?=
 =?utf-8?B?cmFyREpFZGhTUEUvR20veTRCLzBPazFXeG5NOGQveTBRdk9PT0tETVlQWmww?=
 =?utf-8?B?bGJlZzN3YUZBYXlZTFFtTFBHWkYvRXpuaHloWWwxN1RLT0psT3UxVUZtTFFL?=
 =?utf-8?B?NTNsSTJ5TWxHMkY4dDh2NlpxeXdiL1JNanVxVUFRZUtNbzhUUDUyMXJIektO?=
 =?utf-8?B?V3RkN2NBZ1p4cmg2N3lqbXRhc0FIVGhESFFld1l5YjlUQzJnalJHWU5kdTFo?=
 =?utf-8?B?V0xjaE5ScDhvcUc2RGt0d1FwdWJqQnQvRE5DcWFwRWtCL0M0NUh5enpHVnkw?=
 =?utf-8?B?dC9wSUdtQnkyQ0ZPcDJzWVo4aUtCTm95UHZQa1ZLQlQxTU9mQ0NTN3hrdFhU?=
 =?utf-8?B?ZHFYYWhhSEpyRWZhdFRhZ2NzcE51TUlaWFN5UmhQTUVqeDVKU255RmZWSDZI?=
 =?utf-8?B?NTFyUEZ1RFlPZjFQUU1YbW10b2pmbFFxOS9KTDRsaHpycFo5djJCWkEzMjcy?=
 =?utf-8?B?QWJCc2JmblRhck5sOFYyd0x6RmlsNnBBTWJMbmhHWHpwVnk2cERJVzlWbUEw?=
 =?utf-8?B?bUJNTE45SDZvd2hQdGZwbm9jSkZtOUI4bGVxTWdtdkFrU3l2MS9kU3hjbXFo?=
 =?utf-8?B?aDFGWkhlUmVINUw2MEtmK0JFWDY5MjdyNzZqdW0waDc2NUpGVjgyU29OVVpE?=
 =?utf-8?B?d3grZkNmNzk1VTNiNEdjTU1xWndUU3h2TWtva0VtRm9yS0IyWFZqYlNqaDBv?=
 =?utf-8?B?VWdFWi9pay9HRFFQdzhIaUZkTjR4ZXB2Z3ppYzM3eThuNFEvTEpzTXVBclNP?=
 =?utf-8?Q?O/TXPoV4DzN/Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzVDSE5DV2NjQ2FqQ1lOT2VMR0thU1RhM1MxYmtXVTRUdFkzZXphUU9hRUdV?=
 =?utf-8?B?NnJ6ZnA3NnBLY25BK2V2R2lPTFg3ejRLTWxMN1ZBVUxkM05CR1hzbjhIbHR6?=
 =?utf-8?B?Q2ZnbzJKSGNQeXh0REl2SlVYQXJsa2RXaEhPYStOZUJkZ2gvNE1BY2Q4NFRQ?=
 =?utf-8?B?cDU1K21qT3NBWTU0TmxvWDlOZFVyaUhnckg0VmpQVzNIVDRTbFZZSlhDUGNY?=
 =?utf-8?B?OVowRGQ5TGpZUUp6Qnh3T1hrVVdUREtDWU9zSjNXMWc5NXV5Nkg5RUZqSjIv?=
 =?utf-8?B?UkRLUFhrTWpBcVlQc0hSWm00N0tHSlNBeGdXMWhWWkg5Nis2a20vT1BjbG9T?=
 =?utf-8?B?Tkxubk1YWS9Ka1JRV0tuZ3AxbjRSRVJMVnF1NmdQYVNXN3Q4bmVrNk9YTU5W?=
 =?utf-8?B?ZnhhSE5KOGczbVRTTGs5dFpTWW9NR3A5K3RXdVFjdUp5Q0FJZnl3dWQyVVFl?=
 =?utf-8?B?eE5YaTMwZTZKY1JuTDRlRHYyS2VpK1JwUW5OTDgxTnVON0IwV2hrVk4yTnc0?=
 =?utf-8?B?SDdUaEVxMGRSQnZqcHhrenF0K2dubTNWM0JodnFKdDVnbzZsbUhSdzhUVFFR?=
 =?utf-8?B?RTIwR1VOMDVSR0tYMWlmK3Q1ajJGV3YvZU9LV1JpeFRDRDJiam8yMjd3ZXh4?=
 =?utf-8?B?NTViYWlCUmxmREVuTGxuZVNWUU9NOVFLVUZYbzRHK29VZm5vYUFaTjZ4NE1v?=
 =?utf-8?B?TzVqblAxUDdVekJLelZPRW1LQW1jZGdjQ2d3bHc4UjRYWFFKZnlvZ2M5RGpz?=
 =?utf-8?B?MWdiVk50NFl1M1BQU3EzeXNzOWF0UkRKcXhGeEZYNnkySWpvMFlvd0wwVE5u?=
 =?utf-8?B?NlptSURCS01uaUk4eWZ0SnlFU1RzOThuRDFZczNBOFFQbXBTbkFUM0c4cE9o?=
 =?utf-8?B?SWZieW1Yc0xOMlBsczVyaDZ3QXZvV1pObVhyaTg4MGNXeDNWU2ZqN2VkZ3gw?=
 =?utf-8?B?VXRib2s5U1ZGVGVaZzRvTjhYcENkZy85d3NmQ01FMU55cThoVUNnelRlR0lv?=
 =?utf-8?B?dDhtd3ZFTWlxQ3g0WktyMFVLZzFzL2U4YlZNNGRaLzVpd1ptL3pPbE1EL2Jx?=
 =?utf-8?B?MGU4aHBVTksydDAzelBKc09GZDJJTE5oSkNaejFkalppYW1GdmpIYkJZUjhy?=
 =?utf-8?B?bVVRekN5YzVxYW9qMktHL1huSU93b3RoNnZxRWo3TjJBRTFaRFNhL1QrWVBP?=
 =?utf-8?B?NXVyeUkvTjZRMTVnVThiT1FVMEEza1p3b3lWNkVaT1I4Z0ZXdUk0ZGlKRmRI?=
 =?utf-8?B?aGQ3dy9iUXBLOW9IcnZoVHAvSFN3WW9jQjMyM0ZURy9BNUlSYzlGc3MvdGRI?=
 =?utf-8?B?TURuTkViTktheFR1dG5Cbk1SZ2ZmKzVHQWNiNHBsbWZnQTFyZFROcjBCT2Ni?=
 =?utf-8?B?c3QzemtzU0FKVFJxSXYxUXVOZDg1ZGhlOElWcWRFbHFKRGlnUHZVQmFhUmdG?=
 =?utf-8?B?c2R5SURacFNlWE5seU9XYWI4UTdvV3NFQmUxTWRKUDgzSkxtWHdGaTBabDUr?=
 =?utf-8?B?VlQxRWl4Z3N0Qjl2bTJ4aDdCVEpYYUJlMllRS2F3U1ZsSWFkdFhUbllaRDR6?=
 =?utf-8?B?QlQwU1pGNXQxeklzY21CcTVYSlJWUjVQQWhxN0xHeEZlazg5UFBvVGVYM1Ro?=
 =?utf-8?B?WlZyUGk4eWN3dENDVTZGbEFMbGJkdlBLM0x0VnpWa1ppYVdzNklGMnJGTGtV?=
 =?utf-8?B?aWJBOGQxdmdiMGVveTEzN08zYzJ5dHpRblVUUjdnSTB3SDJrb2Q0OUpCTmN4?=
 =?utf-8?B?UXRCSmxRS3kwUGl2L2MzNHVsVkFOWlJPZTE4cTEwL1dmRW1QQ2lDMHRLU2sw?=
 =?utf-8?B?dEdpWno2ZGluUUVyYzg5bVgyekVsOUx0cUtBYkZHZWZ4NTUzaHp0S01hbVlj?=
 =?utf-8?B?cC93enZVSnRFazF5d1dnNmRNbithcmgzRUNkYmN1Sytya04rRmFtTXFFZEIr?=
 =?utf-8?B?NFlBVzFMbVEzUVBObiswRWEvWjE1ZjhnZFFWN0ZraTE0a0Rtb25qdTdPbFhU?=
 =?utf-8?B?VkROVUNCVThjTnloN2dsUlU0cTdKWmYzNnhmL2hBRXBXNjlEOTRTY2NIKzZ2?=
 =?utf-8?B?VmZmOUFuK3h2OUJiejVwZW5TUzhtZXVzVlhWSmlFdDRPeWZHNE1zeFBqSlI1?=
 =?utf-8?B?bWZOK3ZjdGpZbWRZZ3RQNG5qNkNyeW5QMU42NzA5Sk5yeFRlM2pTUzBJS3lv?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb0aa0d-f5ce-40ae-bc8f-08dd203ae813
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 14:39:13.2618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34SFH5XiRFlqaZhf7SnizK8aBon78PCoVukAMVxDoRqOa9a7Ja8LKDlub0TXrXEuK6bXdYP0F4YOB+wVgoYMew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688
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

--------------6eJXJZnOsveCMFnSOAcdvSHL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 12/18/2024 13:00, Marcin Bernatowicz wrote:
> Add __is_valid_range() to check if a VF range is valid. Introduce
> igt_sriov_random_vf_in_range() to get a random VF number within a
> specified range. Update for_random_sriov_vf to use the new helper
> functions for better range handling.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Narasimha C V<narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> ---
>   lib/igt_sriov_device.h | 82 ++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 75 insertions(+), 7 deletions(-)
>
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index 4b63ceb22..de25a7d98 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -34,6 +34,45 @@ int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
>   bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
>   bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>   
> +/**
> + * __is_valid_range - Helper to check VF range is valid
> + * @start_vf: Starting VF number
> + * @end_vf: Ending VF number
> + * @total_vfs: Total number of VFs
> + *
> + * Return: true if the range is valid, false otherwise.
> + */
> +static inline bool __is_valid_range(unsigned int start_vf, unsigned int end_vf,
> +				    unsigned int total_vfs)
> +{
> +	return !igt_warn_on_f(start_vf > end_vf || end_vf > total_vfs || start_vf == 0,
> +			      "start_vf=%u, end_vf=%u, total_vfs=%u\n",
> +			      start_vf, end_vf, total_vfs);
> +}
> +
> +/**
> + * igt_sriov_random_vf_in_range - Get a random VF number within a specified range
> + * @pf_fd: PF device file descriptor
> + * @start: Starting VF number in the range
> + * @end: Ending VF number in the range
> + *
> + * Returns a random VF number within the specified range [start, end].
> + * If the range is invalid (start > end, end > total VFs,
> + * or start == 0), the function returns 0.
> + *
> + * Return: A random VF number within the range, or 0 if the range is invalid.
> + */
> +static inline unsigned int
> +igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
> +{
> +	unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +
> +	if (!__is_valid_range(start, end, total_vfs))
> +		return 0;
> +
> +	return start + random() % (end - start + 1);
> +}
> +
>   /**
>    * for_each_sriov_vf - Helper for running code on each VF
>    * @__pf_fd: PF device file descriptor
> @@ -48,17 +87,46 @@ bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>   #define for_each_sriov_num_vfs for_each_sriov_vf
>   
>   /**
> - * for_random_sriov_vf - Helper for running code on random VF
> + * for_random_sriov_vf_in_range - Iterate over a random VF in a specified range
> + * @__pf_fd: PF device file descriptor
> + * @__start: Starting VF number in the range
> + * @__end: Ending VF number in the range
> + * @__vf_num: Variable to store the random VF number
> + *
> + * Iterates over a random VF number within the specified range [__start, __end].
> + * The loop runs only if the range is valid and a random
> + * VF number is successfully selected.
> + */
> +#define for_random_sriov_vf_in_range(__pf_fd, __start, __end, __vf_num) \
> +	for (unsigned int __vf_num = igt_sriov_random_vf_in_range(__pf_fd, __start, __end); \
> +	     __vf_num != 0; __vf_num = 0)
> +
> +/**
> + * for_random_sriov_vf_starting_from - Iterate over a random VF starting from a specified VF
> + * @__pf_fd: PF device file descriptor
> + * @__start: Starting VF number
> + * @__vf_num: Variable to store the random VF number
> + *
> + * This macro iterates over a random VF number starting from the specified
> + * VF number @__start to the total number of VFs associated with the given
> + * PF @__pf_fd.
> + */
> +#define for_random_sriov_vf_starting_from(__pf_fd, __start, __vf_num) \
> +	for_random_sriov_vf_in_range(__pf_fd, __start, igt_sriov_get_total_vfs(__pf_fd), __vf_num)
> +
> +/**
> + * for_random_sriov_vf - Iterate over a random VF for a given PF
>    * @__pf_fd: PF device file descriptor
> - * @__vf_num: stores random VF
> + * @__vf_num: Variable to store the random VF number
>    *
> - * Helper allows to run code using random VF number (stored in @__vf_num)
> - * picked from the range of all VFs associated with given PF @__pf_fd.
> + * Iterates over a random VF number selected from the range
> + * of all VFs associated with the given PF @__pf_fd. The loop runs only
> + * if a random VF number is successfully selected.
>    */
>   #define for_random_sriov_vf(__pf_fd, __vf_num) \
> -	for (unsigned int __vf_num = 1 + random() % igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
> -	     __tmp < 1; \
> -	     ++__tmp)
> +	for_random_sriov_vf_in_range(__pf_fd, 1, igt_sriov_get_total_vfs(__pf_fd), __vf_num)
> +
> +/* for_random_sriov_num_vfs - Alias for for_random_sriov_vf */
>   #define for_random_sriov_num_vfs for_random_sriov_vf
>   
>   /**

You've added your signed-off twice.
Apart from that all looks good:
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>


--------------6eJXJZnOsveCMFnSOAcdvSHL
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/18/2024 13:00, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241218120056.779962-5-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Add __is_valid_range() to check if a VF range is valid. Introduce
igt_sriov_random_vf_in_range() to get a random VF number within a
specified range. Update for_random_sriov_vf to use the new helper
functions for better range handling.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@intel.com">&lt;marcin.bernatowicz@intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Narasimha C V <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
---
 lib/igt_sriov_device.h | 82 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 75 insertions(+), 7 deletions(-)

diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 4b63ceb22..de25a7d98 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -34,6 +34,45 @@ int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 
+/**
+ * __is_valid_range - Helper to check VF range is valid
+ * @start_vf: Starting VF number
+ * @end_vf: Ending VF number
+ * @total_vfs: Total number of VFs
+ *
+ * Return: true if the range is valid, false otherwise.
+ */
+static inline bool __is_valid_range(unsigned int start_vf, unsigned int end_vf,
+				    unsigned int total_vfs)
+{
+	return !igt_warn_on_f(start_vf &gt; end_vf || end_vf &gt; total_vfs || start_vf == 0,
+			      &quot;start_vf=%u, end_vf=%u, total_vfs=%u\n&quot;,
+			      start_vf, end_vf, total_vfs);
+}
+
+/**
+ * igt_sriov_random_vf_in_range - Get a random VF number within a specified range
+ * @pf_fd: PF device file descriptor
+ * @start: Starting VF number in the range
+ * @end: Ending VF number in the range
+ *
+ * Returns a random VF number within the specified range [start, end].
+ * If the range is invalid (start &gt; end, end &gt; total VFs,
+ * or start == 0), the function returns 0.
+ *
+ * Return: A random VF number within the range, or 0 if the range is invalid.
+ */
+static inline unsigned int
+igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
+{
+	unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
+
+	if (!__is_valid_range(start, end, total_vfs))
+		return 0;
+
+	return start + random() % (end - start + 1);
+}
+
 /**
  * for_each_sriov_vf - Helper for running code on each VF
  * @__pf_fd: PF device file descriptor
@@ -48,17 +87,46 @@ bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 #define for_each_sriov_num_vfs for_each_sriov_vf
 
 /**
- * for_random_sriov_vf - Helper for running code on random VF
+ * for_random_sriov_vf_in_range - Iterate over a random VF in a specified range
+ * @__pf_fd: PF device file descriptor
+ * @__start: Starting VF number in the range
+ * @__end: Ending VF number in the range
+ * @__vf_num: Variable to store the random VF number
+ *
+ * Iterates over a random VF number within the specified range [__start, __end].
+ * The loop runs only if the range is valid and a random
+ * VF number is successfully selected.
+ */
+#define for_random_sriov_vf_in_range(__pf_fd, __start, __end, __vf_num) \
+	for (unsigned int __vf_num = igt_sriov_random_vf_in_range(__pf_fd, __start, __end); \
+	     __vf_num != 0; __vf_num = 0)
+
+/**
+ * for_random_sriov_vf_starting_from - Iterate over a random VF starting from a specified VF
+ * @__pf_fd: PF device file descriptor
+ * @__start: Starting VF number
+ * @__vf_num: Variable to store the random VF number
+ *
+ * This macro iterates over a random VF number starting from the specified
+ * VF number @__start to the total number of VFs associated with the given
+ * PF @__pf_fd.
+ */
+#define for_random_sriov_vf_starting_from(__pf_fd, __start, __vf_num) \
+	for_random_sriov_vf_in_range(__pf_fd, __start, igt_sriov_get_total_vfs(__pf_fd), __vf_num)
+
+/**
+ * for_random_sriov_vf - Iterate over a random VF for a given PF
  * @__pf_fd: PF device file descriptor
- * @__vf_num: stores random VF
+ * @__vf_num: Variable to store the random VF number
  *
- * Helper allows to run code using random VF number (stored in @__vf_num)
- * picked from the range of all VFs associated with given PF @__pf_fd.
+ * Iterates over a random VF number selected from the range
+ * of all VFs associated with the given PF @__pf_fd. The loop runs only
+ * if a random VF number is successfully selected.
  */
 #define for_random_sriov_vf(__pf_fd, __vf_num) \
-	for (unsigned int __vf_num = 1 + random() % igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
-	     __tmp &lt; 1; \
-	     ++__tmp)
+	for_random_sriov_vf_in_range(__pf_fd, 1, igt_sriov_get_total_vfs(__pf_fd), __vf_num)
+
+/* for_random_sriov_num_vfs - Alias for for_random_sriov_vf */
 #define for_random_sriov_num_vfs for_random_sriov_vf
 
 /**</pre>
    </blockquote>
    <br>
    You've added your signed-off twice.<br>
    Apart from that all looks good:<br>
    <span lang="en-US">Reviewed-by: </span><span lang="pl">L</span><span lang="en-US">ukasz </span><span lang="pl">L</span><span lang="en-US">aguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
      <br>
      <br>
    </span><span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------6eJXJZnOsveCMFnSOAcdvSHL--
