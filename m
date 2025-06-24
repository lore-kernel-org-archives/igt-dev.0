Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D72BC7EE2A
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 05:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C144E10E4CD;
	Tue, 24 Jun 2025 05:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZhn3Hhk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441FF10E4CD
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 05:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750742511; x=1782278511;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5V4pg1BbIFUJpB5dcIlL2zNMwtyCv4112nWb58a/9Vw=;
 b=lZhn3HhkJIqCUhYII2hCvNPH06JK3v8z1+mB/OABdy5PS/8lTYxu3+Ba
 wTn5SuP19n310SvkTauu4x3uO0aXQwq5E8KAJo+wjsCAHaw06IHLlFD5+
 ObnM0cViNGrRkhf/VZCUzQhmi5+LInlFbPSivVbe3MaHm5xHhQEd0Rjp2
 Q20fwpSPLhYIPRq9UxwR2+TdjrHr9nh7twfiwQJA8cgxCuSTjxVcR8fkO
 wYnkqOEwLtgr6yFHTvUf0NqVdfE1biiKQF67uA+raSImiN0T+/kyI1TTD
 3HMKVIi11oORe/0842BcTp4YoKAX40/TQ3hcfLnt4x1TFhxM3rUkta/DF g==;
X-CSE-ConnectionGUID: BMut9KJIRtOIKlhr/3NESg==
X-CSE-MsgGUID: jgK9eTpwTDWxj9Gez1OGEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52191971"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="52191971"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:21:51 -0700
X-CSE-ConnectionGUID: 7iqnDHk3SKCkA3JOLw2CRA==
X-CSE-MsgGUID: 8roqIz3pQlmJ3pL/7Iskqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="156379493"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:21:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:21:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 22:21:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:21:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jP4y1Sp7uRIjeCQxK1cW/dlK1AyCZ+UsT3zPuJCVuIR986bxijnn8Brg/cUPQTnP4VZ4twENuG2U4MUfpaW9MnEMr8xDxa4TPVocQS8nT296tMGBp+GcYXDyQNuhqSHrTzkIkgswC5QMn4ifj725JzDyYYKnXav+3guvlA89/a/0yl2AiS1PPaFVHDlMgAvCvE0yISJFOOQb2RiaqIHqbC7nN407UHybZ/Q0fNkAUWbUuELuONs3PCTEKHIpClJLTLCkTVZAR3VV5lnLp8zXFzAEeIDJnYr/KV+Qw8b5IeZjyvPaRVqyxuSi1978jODz7dDNBRcXK+tsWfhhT37LaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNIWCoGcfLd9s0H5cGfHFqXbPoJSZj5l0+dYrqLY508=;
 b=XsPoJpjTtcE9M9ZIRzVUlE7nCznY6zoQHHQEzKihNSfrwhnZz0zfvSokrJ3iG6t4M6klvkG1e5kmmn+JgGdbl2nOL2N+h+J7tV6ueQbGIg96Bu+kHIwsJNxe6sF98iSKtZz2tYgI/BPIE47s3g/rvqvUbeiWf+bD5/dfKuxZIb/nJ1nnldiX5JyUgrZMWiHk0ukgEPsbYyymkt2DSVNus4QoI167ZUTqF8pcls6RGJFB3Bkw2RvW/oH2cRUa2MNoCb7cvJQ35Opk61zUDAc9qlf8qlIJlC6h2pdFkjZjjFu1gO7gN0XNtp801Ld9XNTkh5z6UdnBrAh/BCuWGAyJXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5685.namprd11.prod.outlook.com (2603:10b6:8:20::21) by
 DS0PR11MB7262.namprd11.prod.outlook.com (2603:10b6:8:13c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.18; Tue, 24 Jun 2025 05:21:32 +0000
Received: from DM8PR11MB5685.namprd11.prod.outlook.com
 ([fe80::d2ec:6ee7:4fc2:ea3b]) by DM8PR11MB5685.namprd11.prod.outlook.com
 ([fe80::d2ec:6ee7:4fc2:ea3b%7]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 05:21:32 +0000
Message-ID: <8452392d-875a-412c-ad4f-e54554c8e838@intel.com>
Date: Tue, 24 Jun 2025 10:51:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 3/6] tests: Add core_debugfs_display_on_off
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <marcin.bernatowicz@intel.com>, <katarzyna.piecielska@intel.com>,
 <zbigniew.kempczynski@intel.com>, <ewelina.musial@intel.com>, "Juha-Pekka
 Heikkila" <juhapekka.heikkila@gmail.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>, Swati Sharma <swati2.sharma@intel.com>
References: <20250613105146.106581-1-peter.senna@linux.intel.com>
 <20250613105146.106581-4-peter.senna@linux.intel.com>
 <20250613175442.druvatjw3a7kcudw@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250613175442.druvatjw3a7kcudw@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::7) To DM8PR11MB5685.namprd11.prod.outlook.com
 (2603:10b6:8:20::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5685:EE_|DS0PR11MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: d34add03-deec-48d9-3492-08ddb2defaed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzRlbXNMM2ZRajFaREd2eExLUTQvSVlrM1RKUkJhU2EvNnp0OFpON0JFdVI5?=
 =?utf-8?B?NlArU3NOQ0x0d3czQlJLQ0lsTGxYc0ZPV3FNOTgybEl4bXNYLzFvdS9JcGM0?=
 =?utf-8?B?b3MzdktsZEszQ2RKaWF1STBGUkVaaE9Oa1h6K1g4K2RDb2ZkVmZhbWU1VkNH?=
 =?utf-8?B?c3k3bksvdEVzRUxvVUsvMjJiT1c4QUVCOFNiUFRuaWhuMmJCTFJLRG55dUpR?=
 =?utf-8?B?Yi9TYkhyQ2lUSG1WM25oYzBWdUxzYVplTGRkSVBUcHd3N1V4ZU90QzhsSEVy?=
 =?utf-8?B?MUJmREM0OFlEUDVaUGp3VnBDSzF5QXhhY0hnZm5wYXVKZXdRTXZmK0ZyRU1r?=
 =?utf-8?B?QU1RT1l0alY0aWJzWkRlSndiYTM0VVFrMHlWaHFyZjAranUweWV1b0FDN1o1?=
 =?utf-8?B?YXNxTDhGOGtSdW8zTVl0dEtIaFhYbmFlK3BlbFNQTUtIQktHYUx1Tk11VkJk?=
 =?utf-8?B?YUlVRFBOY1BqeFh3NnBYSWxYSjdjYVFQMER1OXNhYnY1ekVRSTgxeDlKUnMz?=
 =?utf-8?B?N20rcDdaQnVCanFWVzVTNVdQSHBkNkltWHNHYnZRNDlidTQ0ZDB0WVNiZDlN?=
 =?utf-8?B?Y2Zmd1lHaUd0M2FiMVRiZkVhOTlJV1hNQmhwZ2ZMWWJLR0N5eFJjWUgrdlkz?=
 =?utf-8?B?cWI1Q2ZwbjhHTEd5alhpWlEwR0VubHd1UmtMQkxlQUdINUd1MDNlbTFBdjFY?=
 =?utf-8?B?RENQOWg2RFRMd1diMHdvdjE5VlR2eVhKTzE0c2N6NTdsTUsrRjVqM05NQUkz?=
 =?utf-8?B?UVB6b25RVXJ5dXd0QXVsUUsvM2R0WDBrYkVKTFo5elB0Y1BnMWlmYmt4c1BT?=
 =?utf-8?B?VnVVWCsvM0JqOE1mMXRZc3EyMm5OaXFOWkxPS3ZlVnpPYlR3dlkzQjlKd1Vi?=
 =?utf-8?B?cUllS1lnSndQTlA4MXRCY0t2aSsvKzdna3VlbXlsRi9NQnk3ejQ1YkdzaHZ4?=
 =?utf-8?B?MWVvWll1S0tzV2hEclFtNWR0eTEyVmJ6WVdrdmxNR3laamk1c1JjQUU1dTE1?=
 =?utf-8?B?RmFMdWUzQXFIQWdaL1NYUVUvWVFOMGUxNnBSMGl5NTdXRHAzQitnSFFaRnJk?=
 =?utf-8?B?S0tUSUZQc2RZZ1JLQldmU0hidnlwTTdSclVUR2xUQXdyZDkyVjVMVXdGeVNN?=
 =?utf-8?B?ejFkS0xwTVI1Z0FNTktvRElSKzJWVmZ1Ujc0WHd2TFdoS1huc3BDRTdwdjJw?=
 =?utf-8?B?MithbXVVbnZmZkdZK3J5OVFNREp1RHdXb0JzcytjVnpnL1NNWmNidktZdlVP?=
 =?utf-8?B?OWZZQ2xYVHoxRFpuM3hxaG84YklaMUdhTVdRWE5HRzJQU2poZ0dJZEpnTno0?=
 =?utf-8?B?RndHaFpJY0JMZnVFOGdRT0pXcGZGY1UxWGV5UnJlY1BvaFFiTkE3N3I0RTJW?=
 =?utf-8?B?bzFYRjNydG1SY3c4cWp6MER5RXM4RWxuTVgybmNyU0EwTjFvZTVUaUtWWDE1?=
 =?utf-8?B?cDFaT2dyeUNQOHZzWjZoWlVUbUZ0Ukx0dVdRUTFVdloyYnl3L0locXMyOC9Q?=
 =?utf-8?B?Q3dGOS9Fdk9mTkRGMTFYbThNdlU2VVRHQTBkMXJXU0tRU1FMTGJ4ZE1TaEhm?=
 =?utf-8?B?d3YraEJVellncndrNDRkZUhWVWhuREw4VHY0TXk3NFNpcEg0MUFVbGlabTE0?=
 =?utf-8?B?dWo1SWN1SWljekxNeWRlcXhTaE0rQnlVdHJZQm93RHNsMVNvcERXKzJ1NmxM?=
 =?utf-8?B?WnMxWjFLUTc1OHNoY2RMWms3ckdsdTEvTDI4RTFvQzBIS0x4azFSd25mZTZY?=
 =?utf-8?B?MEtNdjFGVjZKbGFEK2NCQVVXRlBMQ21UeEdtVC9oSHR4aGwwSXV0VjIxWmV4?=
 =?utf-8?B?UHp3WUhVZmVPN0dhSjdXNkc1aTNPeFI1c2lDOHl2MkNKR284NHc0ZjhySVll?=
 =?utf-8?B?ZjlzRVdFckVOMXgvVVpwQ281NSs1eG1hYnRYWjJMTFg4b2ErZDkvblRrTENZ?=
 =?utf-8?B?SDR3M24wN1dmaGNDVHhlUWdXQjlPbzFUSjIxZHBsK1Zad0xNWm4yRmc5Z1da?=
 =?utf-8?B?MkpSYmI4UTdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5685.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3VuZit4ZHZjQmFzYVNvaCtsTGdkVEF4ZlpTNEdnSXplbGJ5Ty9kWVhwaEpX?=
 =?utf-8?B?dmt1ZW91SVhERFoyb1VuSkVkQVpOWDFmaVBVL2prRjdQSk1pYlgzM0pHR0h3?=
 =?utf-8?B?V0JEZmVDS0Y4TEpreFExRzVYdVpkbXZyakQ1c213VWlHazdJTE1mRjgwU05F?=
 =?utf-8?B?WHhXakhscUk4UEpMeE5BeThPRWhKU2ZYVHpOQy9SZXRLUUUxZDBWY25iM2pQ?=
 =?utf-8?B?NGRtSUU3Q29ZYkN6U2ZuYWdlcUNDWHBkWldLQXJ6L3UrcFBHYWxBaUZuekN3?=
 =?utf-8?B?RzVPYmdQYlY5WEVZZG13b3RNbWF4ZDJuNmtKY0hjUllnUU9XU1NqdGs4K2ll?=
 =?utf-8?B?UFRLRmlGK0Yrc3VUMDlZeW0rMFlheTVUUE5idUZ5eFNqMjh6WHJUZ0NYdUhh?=
 =?utf-8?B?OGtONnM1ZHFQVytjQzcxSGp4cDM5QlB6Y0taUjlubzFHQ01EdW9YNUhjZXFZ?=
 =?utf-8?B?SXF5eTNUYUpxbFJFUk1EZ0E5dk1hNnBsL09FZUxLSHF0eXFaODkyczJVNTN1?=
 =?utf-8?B?V2VqcHQxMzRnMnFBR1RmekpUMXdLNjFXWHdjOVgxVlVTT1hwSzlpOGF6Y0FI?=
 =?utf-8?B?VjZJenRHZGRUcmlUNWgwTWZBQVBsODZGc1hSOEpHdk91UGtBU3d4eFhSR3B4?=
 =?utf-8?B?YU5QQnp1UktXa29odXViSkpjdk9Dd0tIcFZxdHVvcGZCSXNXWlVNT1R4aDdj?=
 =?utf-8?B?YTZnMk9PL2JYaUFjWHZNWkpzZ1ZNRUlHcWNFa3U0Q2d1SjFHakpxcVRYNXIw?=
 =?utf-8?B?YXdrWEc2b2NwdU5mQm1hS2xvK3R2WlVaQ3VWM2lxTWNTTkJrUFpucEp0Zm1G?=
 =?utf-8?B?Mm84MHB6cDhNTDFZVzFId1VYTzZzS0xJdzh3ZzlXRlhjcGV3OWQycGk5TmJ6?=
 =?utf-8?B?cExka3kvcFl0U1ZuZi9Cb1Vva3RlVzdFeTM1TnRFdDFjRHhNb25NcHpsK29U?=
 =?utf-8?B?c2txcWNOdzBXemxQQ0tTMVdEMjFEdlJtazhVY0dJR0w3eUdweGp1QXk3dmdt?=
 =?utf-8?B?Vlc5NnVQai9jS0RaNTc5YlpDaDFSUWJCaTFaR3dXTW1mZURITC92RzZHQkx5?=
 =?utf-8?B?dGdjc1RZK2oyMHlsbWdIa3F6TU9EUWlETTZsTTBuR2pWaTdMY2lxZnZndC9x?=
 =?utf-8?B?U2hhMDY3QnRsMld0OHprc3R1VmE1WTNQeHVxUWhGbGE5ck5ZTGhJcnBIVHRv?=
 =?utf-8?B?ZFJIN3JCWGVCRHZGSmdCQ2Ruc3BsZXRuczVyci9LZ212eXdmcnB2OGN5Nnhv?=
 =?utf-8?B?Wm5WQ1cvV1FPamRxYmc5WmpzV3JSMUlNSU82cGZVZ0FVaUhiVk1HOE5wVWl1?=
 =?utf-8?B?MU9Eb3NqQkF4bEQ1KytjcDJMTnRXbkhRdjUrOTE2Rm9kV2xEcGR4TitiRkZL?=
 =?utf-8?B?RjhkbHhqOUg4YjgzNjJYYzZUVUowVXlBejNncHdUTGRFN2lpQjRRcHN6MTF2?=
 =?utf-8?B?QVNnendvYnZHWlp4c2lUSndqeWp2ZDJZT1FPeXRmMzlaWU9ldGJDb2MyMHQy?=
 =?utf-8?B?NHlQamlySVM1a0FzblUvRlQyYmVvSXoyZ1RCT1lOYU4zUkNIcFRmMTFGdkZI?=
 =?utf-8?B?R3l3anVzQkIzUDBwRCswKzg2YlFVUlgwbCttdHN0Uys3SVNPcnNRVFEyR2wr?=
 =?utf-8?B?UXQvR0EwZ1FUcitMSTN1TnpnZElVYmRpNHkxamhuN0hablJOU3dXTVFJdHBB?=
 =?utf-8?B?ei9LNGpSVm55SzBWTE9saEdRSUtCTFZBQ1VxWVEzcHdFRWkwdnNqSHpYcmdz?=
 =?utf-8?B?Tkw5NWsxcjJ5NnpiNGRVOWNMMDhFQlFLK0FQcWVjcStrK0I0VENlKzl4dVBy?=
 =?utf-8?B?KzRnQUdkdHZvR1R6ZTcxY0I3Mm14OWxYaklyclVGMDFZTjVrcVhBTGFURFUr?=
 =?utf-8?B?b2c4NHVSVWkvVjhHUkdxNUhVMER4bEFKVWIxdmNwV0tjNHZsYmtVWW9Yb0FS?=
 =?utf-8?B?L2dVVWluM1VGQ1p2a3ZuOW5lYlNsRUREZEF5QmNDeTA0MUZwa3l3SFpqTHJh?=
 =?utf-8?B?NVROQnV1T01WY0pETHBIZmpYRlBmQncwcDM4VEVDaWQzbkI1K0g3ai8rc1Bk?=
 =?utf-8?B?ck5URExmZDFuSlBSOUdUUjN5Zmprc2dLV0JWSGVEQkI0L1hBdk1zK2NONEMz?=
 =?utf-8?Q?bCv8Wr+lfu9JqizPY2kd4T5CR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d34add03-deec-48d9-3492-08ddb2defaed
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5685.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:21:32.2887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMCbT9AAFgINUpK/5lf7qDy4D4rSA9paUF8im4GYB2gOi+OIwJh3DA5eOeOzZXfn5c3ajrMU/mgVOlvH5MypIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7262
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


On 6/13/2025 11:24 PM, Kamil Konieczny wrote:
> Hi Peter,
> On 2025-06-13 at 12:51:42 +0200, Peter Senna Tschudin wrote:
>
> this is not full review, I only have few nits, see below.
>
>> Introduce core_debugfs_display_on_off that is expected to work with any
>> GPU, not limited to i915 and Xe. The test powers on all available
>> displays before reading debugfs files, and then powers off all displays
>> before reading the files again.
>>
>> Cc: marcin.bernatowicz@intel.com
>> Cc: kamil.konieczny@linux.intel.com
>> Cc: katarzyna.piecielska@intel.com
>> Cc: zbigniew.kempczynski@intel.com
>> Cc: ewelina.musial@intel.com
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>> v2:
>>   - changed style of comparison to NULL
>>   - moved to a separate patch
>>
>>   tests/core_debugfs_display_on_off.c | 171 ++++++++++++++++++++++++++++
>>   tests/meson.build                   |   1 +
>>   2 files changed, 172 insertions(+)
>>   create mode 100644 tests/core_debugfs_display_on_off.c
> imho test name should be shorter, like core_debugfs_display.c
>
>> diff --git a/tests/core_debugfs_display_on_off.c b/tests/core_debugfs_display_on_off.c
>> new file mode 100644
>> index 000000000..b7dd96208
>> --- /dev/null
>> +++ b/tests/core_debugfs_display_on_off.c
>> @@ -0,0 +1,171 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "igt.h"
>> +#include "igt_debugfs.h"
>> +#include "igt_dir.h"
>> +
>> +/**
>> + * TEST: debugfs display on/off test
>> + * Description: Read entries from debugfs, and sysfs paths.
> Please also write about display in description.
> Is this for both debugfs and sysfs? Test name has only 'debugfs'
> so imho you should remove 'sysfs'
>
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: uapi
>> + * Functionality: debugfs
>> + * Feature: core
>> + * Test category: uapi
>> + *
>> + * SUBTEST: debugfs-read-all-entries-display-off
> imho subtest name should be shorter, like: off-read-all
>
>> + * Description: Read all debugfs entries with display off.
>> + *
>> + * SUBTEST: debugfs-read-all-entries-display-on
> Same here, imho better: on-read-all
>
> Or it could go with 'display-' prefix:
>
> display-off-read-all
>
> display-on-read-all
>
> +cc Karthik, Juha-Pekka and Swati
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
>
>> + * Description: Read all debugfs entries with display on.
>> + */
>> +
>> +/** bool igt_kms_all_displays_on: Try to turn on all displays
> imho:
>
> /**
>   * bool igt_kms_all_displays_on: Try to turn on all displays
>
>> + * @fd: file descriptor for the drm device
>> + *
>> + * Returns: void
>> + */
>> +static void igt_display_all_on(igt_display_t *display)
>> +{
>> +	struct igt_fb fb[IGT_MAX_PIPES];
>> +	enum pipe pipe;
>> +	int ret;
>> +
>> +	/* try to light all pipes */
>> +retry:
>> +	for_each_pipe(display, pipe) {
>> +		igt_output_t *output;
>> +
>> +		for_each_valid_output_on_pipe(display, pipe, output) {
>> +			igt_plane_t *primary;
>> +			drmModeModeInfo *mode;
>> +
>> +			if (output->pending_pipe != PIPE_NONE)
>> +				continue;
>> +
>> +			igt_output_set_pipe(output, pipe);
>> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +			mode = igt_output_get_mode(output);
>> +			igt_create_pattern_fb(display->drm_fd,
>> +						mode->hdisplay, mode->vdisplay,
>> +						DRM_FORMAT_XRGB8888,
>> +						DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
>> +
>> +			/* Set a valid fb as some debugfs like to
>> +			 * inspect it on a active pipe
>> +			 */
>> +			igt_plane_set_fb(primary, &fb[pipe]);
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (display->is_atomic)
>> +		ret = igt_display_try_commit_atomic(display,
>> +				DRM_MODE_ATOMIC_TEST_ONLY |
>> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +				NULL);
>> +	else
>> +		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>> +
>> +	if (ret) {
>> +		igt_output_t *output;
>> +		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
>> +
>> +		igt_require_f(found, "No valid mode combo found.\n");
> Why require here? We want just displays on, why break when
> not hi-res here? Karthik or Swati, please help with this.

Hi Kamil,

Sorry for getting back late on this one.

This break happens only if no valid combination of modes is found across 
all connected displays. So this require check is valid.

Regards,
Karthik.B.S
>
>> +
>> +		for_each_connected_output(display, output)
>> +			igt_output_set_pipe(output, PIPE_NONE);
>> +
>> +		goto retry;
>> +	}
>> +
>> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>> +}
>> +
>> +/** bool igt_kms_all_displays_off: Try to turn off all displays
>> + * @fd: file descriptor for the drm device
>> + *
>> + * Returns: void
>> + */
>> +static void igt_display_all_off(igt_display_t *display)
>> +{
>> +	enum pipe pipe;
>> +	igt_output_t *output;
>> +	igt_plane_t *plane;
>> +
>> +	for_each_connected_output(display, output)
>> +		igt_output_set_pipe(output, PIPE_NONE);
>> +
>> +	for_each_pipe(display, pipe)
>> +		for_each_plane_on_pipe(display, pipe, plane)
>> +			igt_plane_set_fb(plane, NULL);
>> +
>> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>> +}
>> +
>> +static void kms_tests(int fd, igt_dir_t *igt_dir)
>> +{
> Please move this code to igt_main below.
>
>> +	igt_display_t *display;
>> +	char test_name[64];
>> +
>> +	display = calloc(1, sizeof(*display));
>> +
>> +	igt_fixture
>> +		igt_display_require(display, fd);
>> +
>> +	snprintf(test_name, sizeof(test_name),
>> +		 "debugfs-read-all-entries-display-on");
>> +
>> +	igt_subtest(test_name) {
> Use directly name, why snprintf to test_name?
>
> 	igt_subtest("on-read-all") {
>
>> +		/* try to light all pipes */
>> +		igt_display_all_on(display);
>> +
>> +		igt_dir_scan_dirfd(igt_dir, -1);
>> +		igt_dir_process_files(igt_dir, NULL, NULL);
>> +	}
>> +
>> +	snprintf(test_name, sizeof(test_name),
>> +		 "debugfs-read-all-entries-display-off");
>> +
>> +	igt_subtest(test_name) {
> Same here:
> 	igt_subtest("off-read-all") {
>
>> +		igt_display_all_off(display);
>> +
>> +		igt_dir_scan_dirfd(igt_dir, -1);
>> +		igt_dir_process_files(igt_dir, NULL, NULL);
>> +	}
>> +
>> +	igt_fixture
>> +		igt_display_fini(display);
>> +}
>> +
>> +IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
>> +
>> +igt_main
>> +{
>> +	int debugfs = -1;
>> +	int fd = -1;
>> +	igt_dir_t *igt_dir = NULL;
>> +
>> +	igt_fixture {
>> +		fd = drm_open_driver_master(DRIVER_ANY);
>> +		debugfs = igt_debugfs_dir(fd);
>> +		igt_require(debugfs >= 0);
>> +
>> +		igt_dir = igt_dir_create(debugfs);
>> +		igt_require(igt_dir);
>> +
>> +		kmstest_set_vt_graphics_mode();
>> +	}
>> +
>> +	igt_subtest_group
>> +		kms_tests(fd, igt_dir);
> No need for subtest group when only display is here.
>
>> +
>> +	igt_fixture {
> Should we turn on all displays here?
>
> Regards,
> Kamil
>
>> +		close(debugfs);
>> +		drm_close_driver(fd);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index fa62cbeb9..c05c023ef 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -1,6 +1,7 @@
>>   test_progs = [
>>   	'core_auth',
>>   	'core_debugfs',
>> +	'core_debugfs_display_on_off',
>>   	'core_getclient',
>>   	'core_getstats',
>>   	'core_getversion',
>> -- 
>> 2.43.0
>>
