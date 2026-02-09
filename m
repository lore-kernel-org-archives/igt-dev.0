Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33042E7E0AF
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 09:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D739410E3A2;
	Mon,  9 Feb 2026 09:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oq94QLZx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7359910E3B8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770629768; x=1802165768;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hXoRa1HC431LDvYo8EF+mb7Xlz9+5xRWXb/k+oYGOUI=;
 b=Oq94QLZxZG8pWrNXLcBWaA6sfl6SZozfb6wjrlxzwmIlmsaJ7YdZCVp6
 wI38TkbE5Cy6QkQpJtt1RX7+D9rMLBWn7/n2fPvsDBKaDBGZHJ1mzlnEs
 5I9pct8iRMWpU8IjVqZFNlNIxH02YM2qztdS7/ccAIVyjbf594bkeYVgw
 SjsGvfBfqKWRk+pDJCRwyFUtxiQ73vlGlPahwVWACAS0yV4i63IF1povm
 LALqbcFv4yi3xwrVuVoZ9RxsfNxFSzZzlhTjlLHLyrhYDLgiSND2Auv/6
 yBccrqwaSirDw4N4VaTaFmBQ+mQfWU7P9CkTrMMldOZwmRel6toV94lxx g==;
X-CSE-ConnectionGUID: KDlTgzvIRuW4fcZee8cEWQ==
X-CSE-MsgGUID: NE9mdZqfTxmQHERMlnqgqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="75586491"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="75586491"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 01:36:07 -0800
X-CSE-ConnectionGUID: c/oKlOnyRSOTssqgusbn6Q==
X-CSE-MsgGUID: 724oRtuORw6a5KIBogJGtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="211543389"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 01:36:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 01:36:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 01:36:06 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 01:36:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGsYVCAar/81gUDB30AXBEh2s3/QaA3WjzlVwLg4AXWtqmN7bvTmjdUAke6WqpnWsiNaSdARL9T7irx6Rlev2N+70O9iMhNqBrhB4jz3T5hErbDMByqa7w7Z54s4JEyRE5wOjhq0RzmMMvNOwt/a7ht/uTXIN9X8X1Sp/yJQGPmy0zZSZrv+1PhMVoo2BZbdTpySFX1Le2z9glMjHZOOqGCaxj+yQLH6Da3R6jLKkkhI8VKJPBxWvyIv8Yw2Kn7y4YdZxLlPMVH0w6+MGocbsMccraJLqCPQc4DCtYhD4YXO6mW3k28BHVral157ZKepiUWMg9NQZcBUJR4t+BmIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNEwN2aR7oSpr+K/mZfep+qDn7FIg84WPaYtNpOpjhQ=;
 b=KumkealwdQlZNHlWljdZyxIEuoBM4CXxqhs2/BT7QJQ7o5vrAaSyMhqoPSiHNd2qNHMSxFGOvPRrHwH3w5NJMScUYCDkxCVrDeoVlVWJxmFUHgsYthY9LWAALAVXxG/9AQz94iaa9ZhrUbYxtUCoUFoeMPYheB4163cx51Af8eIo6C1yHws2ggHM6ry+GuzA9SPPQW0THkxdNOBrEB3cdTbeRriYDWFt7WpdPiU7/mw6GimP0ueAdK6gQ6ti5KgL8/l4AqZsFyenb8ESi9pP48pXJ9LhlHv9RC7RRZEt17DKo9iyVOKi9AmSZAPNiKEr12x1oj4EWrJHkv1XcqKWwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SJ5PPF035FE4CB7.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::805) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 9 Feb
 2026 09:36:04 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 09:36:04 +0000
Message-ID: <6fdbc5c8-5c46-4327-95f9-85d635d32192@intel.com>
Date: Mon, 9 Feb 2026 15:05:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_exec_system_allocator: Add
 purgeable memory madvise tests
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
References: <20260120061141.3139060-1-arvind.yadav@intel.com>
 <20260120061141.3139060-4-arvind.yadav@intel.com>
 <BL1PR11MB5525B4C487829F262BD6CC8B8494A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <BL1PR11MB5525B4C487829F262BD6CC8B8494A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SJ5PPF035FE4CB7:EE_
X-MS-Office365-Filtering-Correlation-Id: bff9eef1-4478-4c64-0074-08de67bea4cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nlk3Q2FVWitTcytQUGVrWEpMUDM0aEJIamxFZHRrRWpNQ2YrN1VmVmJGWmQv?=
 =?utf-8?B?NW8vQmlYMkI0TlFSbnBxOEIvdk1WaGtEbG9sb1Y0NEpTanJWV1o5VmpIUGRK?=
 =?utf-8?B?aDIrYlJoNGJSVlovVTFSYmFoUDhCaFJSdEtlUUFyWHhpWXVUYTlrMGxvakF3?=
 =?utf-8?B?Y3ZTSDB6MTJuSDltQUdQRmZ0Lys4c3VPYU40aWhKMmI0aUlLMy9LZVNYNkdH?=
 =?utf-8?B?R3oxQzdhbW95VjBOTHBpZlpnTGxUbW01ZWVzWC9wbVkzM1lveDZOMXU0QmFT?=
 =?utf-8?B?QVdCYzV1SkdFRUlxcUJadXI2M21aeHp5cEJZc01GY0VtNmk0K3gyVkNOMjll?=
 =?utf-8?B?SG1ST2gxNGQ2Tmd6aWxtbmpIbnE5cWpGc0tLN0tja2dGcm1GMmI1Y21VYUd3?=
 =?utf-8?B?NC9WVjZxZFhpQlR1eVhKUEhiVU9SckRRUnF3d2grdjBMMXE4Q1lPcEI5d2dq?=
 =?utf-8?B?MUlQcmlHbDQxYXU4UWJHQ29saklVNk1HakRtV2JrN2tJdE5Dc0VPSnJ1OFF3?=
 =?utf-8?B?elVhTmtXSFAxNEdZZ242S21rSnNKRk1WSDBtdExrUExSSWhXUkl3ZjBjME9R?=
 =?utf-8?B?QVpmc0tPQm1EZjRaeHhsSU5UT0F1SGw3WXZPbk1zeEZla25SREg3ZmJVRE4z?=
 =?utf-8?B?VmVXaU94dmk5YzVsNlhQcE0yVnBtZ1pzalh1RTltSWw2ZGxaNFJCeVZFbXBG?=
 =?utf-8?B?WHE0bk13WHR0ekh1d0hYa2QxNFVCU05ITFlZdll1TlJzSXZsQlBMdUl4VXFy?=
 =?utf-8?B?TStWTGhHQmtlQk4rT3I1a0RvV2ZreEdCTTMydTI3Qmw1SWpUT2d6aHZBM2lN?=
 =?utf-8?B?S0JsbVUvbjY2Vm1Ib3BCaWx5RGpnVldqb29BQk8xUG5zeFd1elN5L01RRG1J?=
 =?utf-8?B?OGtackJnRGlXWFp1a3J1WWdsNGlzbFpqM0w1a013S2xwN21QamNBUGppTFVq?=
 =?utf-8?B?MnFRT09FQ0E1OVQ5ZEo4bEdvejlvam1rQVdIZjdtVE9UN2h4NzhVQXpmeWdk?=
 =?utf-8?B?a0YzQzNKc3pjZXl0S05QL0NKRCtKUTdyNGJ3UW1DWkRWajhDZmtNcnNQN1Ji?=
 =?utf-8?B?MGdMOSs2TVNuTU9uakU4c09XcGlhc0hjTmhnK2lTMnA0THhDNlNadUhTZ2RB?=
 =?utf-8?B?TUY5S0RRcVkrbWY1UWhlMHFqSm5QaFlzRHg0M09lcTloVVR4M2R1M0xRdG0x?=
 =?utf-8?B?VjV0WjZvUzNDRzdVL24rUC9GMTJFUWV0ZCtvTi9ucTJJZHpCc0NncitGMHc5?=
 =?utf-8?B?dEQ2U3RoN28yWWpWV1EyeWZMaFBmVGQ4NHRwTkV5a1lEWG5HRlNRUk9ZbUY3?=
 =?utf-8?B?WjRmY29sQW1kMzJIRzRzMDR5bWZyT2lrcmkxdkNQYnBPOVJseVU3WjFBSXFU?=
 =?utf-8?B?aXBWRG8wY3c1QTJocCtVUnhSTGRVOFc4VVIrRXArSUZRQjFtWW13ZVNHeHhy?=
 =?utf-8?B?a1ptVE01bC96T0o4UlcvV0tvTUpHZXpKbVhkL2tmYnJqRlRiWVltdEVOSGxs?=
 =?utf-8?B?WU1KZGFsY3U2WkI0M2FLQ2x6am5oOWE1T0QyRWE5RHR4OGpyN3ZJMzJScHlz?=
 =?utf-8?B?TFNXWEdoYjNzTElyL043YjRwcnhWejIwRDZQVTRLandBZUF3dHJ0NGNRKzNV?=
 =?utf-8?B?REx5clRBVFVJS2hBQU4zcEFVOGF0QXpjaVBjL0NKQjhRa1N6RHpDRWdrUXlV?=
 =?utf-8?B?VHQrTVFCOTlJTEVvbTlFOXJNYUNUWElDUWY1WTJCSzFGdmNJVEdHdTM1QWhK?=
 =?utf-8?B?QzJReGZPbUxqZ3VRTDA1S0lSbHFxRlNEeXNZWWhwNEU2aUNBM05iZEs2S2Vs?=
 =?utf-8?B?ejNTVkJxVGdlY2luOVRadzE4Z29jUlI5Ly9IZm55eS9GL0dlV1BTMDVFU3V3?=
 =?utf-8?B?K3BDQXZXZUQyVGV1VFNKUWNsNzZ2QmE1ajErc1gvdjdKYVdBdk00cGN5Zkgv?=
 =?utf-8?B?aDdsL3h1WEhmQ2JjVFFIWjBBcE14MGhFQmFhZ1FyaXdwUU96ZXBNUWNWRGJF?=
 =?utf-8?B?TlQ3dlY3ZjRBSlpENE5PWDBmeWJxMEY2dEs0cmlTdi9lZklqaWthcFEvRzVo?=
 =?utf-8?B?eFAxYlJ4ZHh3MFJXdHBLNk9zd1I5c1VsYnVib0N5MTY4TzFUSENYTWxXS09w?=
 =?utf-8?Q?rG2w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emtkbHgvYjM0SmFnY1pqNEk0NlF3eUpPejlJeHBTbGJhcitaTS9wOGVhV3ll?=
 =?utf-8?B?UEZIdExULzRxeEFZdEpoVnVBSGR6dExKUGhpNGFRTnlVWFlzeVNMbE4reXJ6?=
 =?utf-8?B?ZUZRQkwwM0tJWm90MFYvNCs2cU5ia3lNTTdNSmlhZHZOVDN3YkJjRTljMndZ?=
 =?utf-8?B?eFd2VTNna1JGSjh6M0lkcXZIbEM2Q1ZTZ2grK3ltVXNYcE1NWTRKanRqUnVr?=
 =?utf-8?B?bGNKcFJrVTMyQ3drYTQ2eVQyaldBMGRpRlA1QldwYTgrSVJLMnR0c3ptRCtq?=
 =?utf-8?B?MjJUSkR4VzZHTTUzaUIva2QwbldZUWdrcFBFMkxJR05qYTA0ckhVeDVKUGFt?=
 =?utf-8?B?YWpTMVRXeU84L0VEUDJadVc2VXZiK1JXZ1ZRNC9EVDQ0N2VPRklmTnB1Yjdp?=
 =?utf-8?B?K0dLUWpPdWNXdExFUmpxZ003Vlg3TGRqa1BqS0Nva0g1VGplSHRSM0lJdkY0?=
 =?utf-8?B?cmtya05RbkxpRVpFcHhBTFlxU3BreWF2SFkrZ1UxZ0d6dFZlQWVCVzV1bXZS?=
 =?utf-8?B?bm83SW5LeDdBS25aWHJsQWZmcW5PZlU2dVl4OXd5QlJDQlFDVElQY0RVZElF?=
 =?utf-8?B?NERLQng4NkxqNXRQNXV2ejRSSnV0dURMUVdqQUx3UkZ2REdVbTlPOEZpOUxU?=
 =?utf-8?B?VE5qZ2tEazEvSWVFb1FEdkJNSnhkemRNR28ycTQ5aExzbXRSQmFpVHhhRzRp?=
 =?utf-8?B?SkZLQmJiVjJwd0t0cTRjT1loTEJYdnVnMnkwUUVXWklBQmhkcVdHVnhKZzAv?=
 =?utf-8?B?UFU2R21NUUhBZHczT0djUjBYTCt6Qjl3ZUJBeFVvMFA1ZVl6dzRDSGdkWGFq?=
 =?utf-8?B?S2pQTEtGbDJsenY3ZGNRYlRhVFh4L2tYMGhQL2hPWVVDdThhd3NlbXhjdURz?=
 =?utf-8?B?QVhSTGFYckVQL3VncDdXRng0cnFONS9aTThxanFDRjhrZzRGV2JUOUhtQzZY?=
 =?utf-8?B?N1BuMmRkWWtUeUY5aWtoZ3NQRGg2UUJLTlQ3Qzk3TXBDNGE0N3FRNU9nTFh3?=
 =?utf-8?B?US85VHJGSVVocTNuNHdBUFp1aDFTUlUxcE9mMmFLTEhpSTZSRGtvMzZqMExE?=
 =?utf-8?B?TVZhNERkcTlMSURTVUpsVmczVXg1UGk4ZVVBNFJSZjZwWGlRTldpU1oxandL?=
 =?utf-8?B?VERUdG80SHB5U3VNVmQ1anQxNVR6MkNHS0NJSTZ4OXBXaWc3bkZrZ1NaRnpK?=
 =?utf-8?B?K3ROc3UwSzV4WUhLQ0d0ckhFNmE1L1BYZ3dtSmEvcFVpU0srUEFSUXRLUmU2?=
 =?utf-8?B?N1dDZEtCTS8wcm9IbFV1a3hIQ0lYWmlNZWY4NEVXR01WZzVMcWszS0o3SXN2?=
 =?utf-8?B?K2ZCd0V5REtLVWt1WDZQU3BuVE91ejhRM1UralhjL0lERXIzekZkM0FoNFlj?=
 =?utf-8?B?M2ZjMlFGMDlVemJpSVNvMkd6TVJBUDFhTlJqakVWU3c2WVRZMC9PRGpqVkFR?=
 =?utf-8?B?aEJlT0RRbzRDa1pPaFNjQlR2U1cvYXQ1UHg3SUIrSjA5cjJjRGdPaFpxVjdX?=
 =?utf-8?B?N09KN2JGbFA2bFd6R0ZqNUlieWl5Y1o4aVVTMFh4TjBGTFBqM1d5YW13cGN0?=
 =?utf-8?B?TjZvbFBXOUNXTXhHb2VIYkJHVFYwR2ZpNEhFQmxSWUx6WVFBMm52QmNQa21n?=
 =?utf-8?B?bXY5NWdRRTdKRnIrUytkdlMvdVRKYmZXQWUrcXpXUWlWN0JUd2c2VFppblMr?=
 =?utf-8?B?RHNLcVBYZHRLUlZWamhJUTM4RlNpMk5rdEJ6c2FaTzRzUE53alJYcDRPTUNz?=
 =?utf-8?B?MmdCQVhDMytIaXRiWHNNM3VwT3haZFA1L0RiT01QOGxyL0t3aHNDbU5uM1Nt?=
 =?utf-8?B?TFNkU0hoeFZseDVHdFJQQUc0enBPTzZ4aHkxa0szaXo0SWRRWjBwQzhuMDFT?=
 =?utf-8?B?aVBNQUVHK0hRK3dmbDJhVFp2QkhxYk5BdHZ0dWhpOWVDMy9vUk9WcC9pT0x2?=
 =?utf-8?B?L1cxbW5xK3plNnVXdXEwajJSencwblF3RThJcnVLdzBVTHkrc0FkenZ6eGNk?=
 =?utf-8?B?VnlDNFRsRXRJYWR1dG5sNlVXMktXYU9pT1RlRnluOFBwV21VclYyMmd0Vmg4?=
 =?utf-8?B?Y21LZVlWTkthSm1oaTVhQ2wvVmNCMkNhZUFIKzdwWjk1UlEyTkF5d2R3Rzln?=
 =?utf-8?B?UjQ1OWR3VzY1aHJrN1UyTWp2dlpMdHRPaklqYlVMem9TRTZ6K1hNY25GRDlh?=
 =?utf-8?B?QWpUcGNWYmRZK3AxUjFyK3dlbm1VOVM3UHJnZURTVTNnbE5uRzFIRktmQ2dt?=
 =?utf-8?B?c0NkRS85b0t5R1ZLYzAxODA5c0drS1FDNFd3aEZLTkRpVDZqaWFyYm91VU9P?=
 =?utf-8?B?dWV1ZjNsb1gvVVdkUGtSZ1B3WElzbFg4c0ExUklKaTdrbFd0RWxYdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bff9eef1-4478-4c64-0074-08de67bea4cc
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:36:04.3298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apY8M4VbikUeskwgXrkbSWtMJQL4VWElM3+Qn6sMbL1kkZmyjhIPKDC03ps5WSs3E+Ky54tUGxsAoKXnJooijQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF035FE4CB7
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


On 23-01-2026 21:04, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: Tuesday, 20 January, 2026 11:42 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>> <pravalika.gurram@intel.com>
>> Subject: [PATCH i-g-t 3/3] tests/intel/xe_exec_system_allocator: Add
>> purgeable memory madvise tests
>>
>> Add six purgeable memory test cases for system allocator using madvise:
>>
>> - madvise-purgeable-dontneed-before-mmap: Mark BO as DONTNEED before
>> mmap,
>>    verify mmap fails on purged memory
>>
>> - madvise-purgeable-dontneed-after-mmap: Mark BO as DONTNEED after
>> mmap,
>>    verify SIGBUS/SIGSEGV on accessing purged mapping
>>
>> - madvise-purgeable-dontneed-before-exec: Mark BO as DONTNEED before
>> GPU
>>    execution, verify GPU behavior on purged memory with SCRATCH_PAGE VMs
>>
>> - madvise-purgeable-dontneed-after-exec: Mark BO as DONTNEED after GPU
>>    execution, verify previously-used memory becomes inaccessible
>>
>> - madvise-purgeable-per-vma-tracking: One BO mapped in two VMs becomes
>>    purgeable only when BOTH VMAs are marked DONTNEED
>>
>> - madvise-purgeable-per-vma-protection: One VMA marked DONTNEED
>> allows
>>    GPU execution on other VMA; both DONTNEED makes BO purgeable
>>
>> Tests use xe_vm_madvise_purgeable() for WILLNEED/DONTNEED state
>> management and trigger_memory_pressure() to simulate OOM conditions
>> forcing kernel to reclaim purgeable memory.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_exec_system_allocator.c | 638
>> +++++++++++++++++++++++++
>>   1 file changed, 638 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_system_allocator.c
>> b/tests/intel/xe_exec_system_allocator.c
>> index 8af66d76e..338037a48 100644
>> --- a/tests/intel/xe_exec_system_allocator.c
>> +++ b/tests/intel/xe_exec_system_allocator.c
>> @@ -32,6 +32,15 @@
>>   #define QUARTER_SEC		(NSEC_PER_SEC / 4)
>>   #define FIVE_SEC		(5LL * NSEC_PER_SEC)
>>
>> +/* Purgeable test constants */
>> +#define PURGEABLE_ADDR		0x1a0000
>> +#define PURGEABLE_ADDR2		0x2b0000
>> +#define PURGEABLE_BATCH_ADDR	0x3c0000
>> +#define PURGEABLE_BO_SIZE	4096
>> +#define PURGEABLE_FENCE_VAL	0xbeef
>> +#define PURGEABLE_TEST_PATTERN	0xc0ffee
>> +#define PURGEABLE_DEAD_PATTERN	0xdead
>> +
>>   struct test_exec_data {
>>   	uint32_t batch[32];
>>   	uint64_t pad;
>> @@ -2245,6 +2254,599 @@ test_compute(int fd, size_t size, unsigned int
>> flags)
>>   	xe_vm_destroy(fd, vm);
>>   }
>>
>> +/**
>> + * trigger_memory_pressure - Trigger memory pressure for purgeable
>> +tests
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle
>> + *
>> + * Creates temporary BOs exceeding VRAM size (VRAM + 64MB) to trigger
>> +memory
>> + * pressure, forcing kernel to reclaim purgeable BOs in system allocator.
>> + */
>> +static void trigger_memory_pressure(int fd, uint32_t vm) {
>> +	uint64_t vram_size;
>> +	const uint64_t chunk = 8ull << 20; /* 8 MiB */
>> +	int max_objs, n = 0;
>> +	uint32_t *handles;
>> +	uint64_t total;
>> +	void *p;
>> +	uint32_t bo2;
> bo2 suggests there's a bo1, but there isn't. Use bo or handle for clarity


Noted,

>> +
>> +	vram_size = xe_visible_vram_size(fd, 0);
>> +	max_objs = vram_size / chunk + 64;
>> +	handles = calloc(max_objs, sizeof(*handles));
>> +	igt_assert(handles);
>> +
>> +	total = 0;
>> +	while (total < vram_size + (64 << 20) && n < max_objs) {
> The hardcoded 64MB overpressure does not scale with VRAM size, causing the test to behave inconsistently across different hardware configurations.
> Use percentage-based overpressure that adapts to system VRAM. Like Allocate 25% over VRAM size.


Noted.

>> +		bo2 = xe_bo_create(fd, vm, chunk, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +		handles[n++] = bo2;
>> +		total += chunk;
>> +		p = xe_bo_map(fd, bo2, chunk);
> No MAP_FAILED check


Noted

>> +		memset(p, 0xCD, 4096);
> Why Only touching the first 4KB page of an 8MB allocation
> Touch multiple pages throughout each allocation.


Noted

>> +		munmap(p, chunk);
>> +	}
>> +
> Immediately frees BOs after allocation without giving the kernel shrinker time to run.
> suggest to add 100ms. Allow shrinker time to process pressure


I will add delay.

Thanks,
Arvind

>
>> +	for (int i = 0; i < n; i++)
>> +		gem_close(fd, handles[i]);
>> +
>> +	free(handles);
>> +}
>> +
>> +static jmp_buf jmp;
>> +
>> +__noreturn static void sigtrap(int sig) {
>> +	siglongjmp(jmp, sig);
>> +}
>> +
>> +/**
>> + * purgeable_mark_and_verify_purged - Mark BO as DONTNEED and verify
>> +purge
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle
>> + * @addr: Virtual address of the BO
>> + * @size: Size of the BO
>> + *
>> + * Marks BO as DONTNEED, triggers memory pressure, and verifies purge.
>> + * Returns: true if BO was successfully purged, false otherwise  */
>> +static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm,
>> +uint64_t addr, size_t size) {
>> +	uint32_t retained;
>> +
>> +	/* Mark as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	if (retained != 1)
>> +		return false;
>> +
>> +	/* Trigger memory pressure */
>> +	trigger_memory_pressure(fd, vm);
>> +
>> +	/* Verify purged */
>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	return retained == 0;
>> +}
>> +
>> +/**
>> + * purgeable_setup_simple_bo - Setup VM and bind a single BO
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bo: Output BO handle
>> + * @addr: Virtual address to bind at
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag
>> + *
>> + * Helper to create VM, BO, and bind it at the specified address.
>> + */
>> +static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>> +				      uint64_t addr, size_t size, bool
>> use_scratch) {
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = 1,
>> +	};
>> +	uint64_t sync_val = 0;
>> +
>> +	*vm = xe_vm_create(fd, use_scratch ?
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0), 0);
>> +
>> +	sync.addr = to_user_pointer(&sync_val);
>> +	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC); }
>> +
>> +/**
>> + * purgeable_setup_batch_and_data - Setup VM with batch and data BOs
>> +for GPU exec
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bind_engine: Output bind engine handle
>> + * @batch_bo: Output batch BO handle
>> + * @data_bo: Output data BO handle
>> + * @batch: Output batch buffer pointer
>> + * @data: Output data buffer pointer
>> + * @batch_addr: Batch virtual address
>> + * @data_addr: Data virtual address
>> + * @batch_size: Batch buffer size
>> + * @data_size: Data buffer size
>> + *
>> + * Helper to create VM, bind engine, batch and data BOs, and bind them.
>> + */
>> +static void purgeable_setup_batch_and_data(int fd, uint32_t *vm, uint32_t
>> *bind_engine,
>> +					    uint32_t *batch_bo, uint32_t
>> *data_bo,
>> +					    uint32_t **batch, uint32_t **data,
>> +					    uint64_t batch_addr, uint64_t
>> data_addr,
>> +					    size_t batch_size, size_t data_size) {
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = PURGEABLE_FENCE_VAL,
>> +	};
>> +	uint64_t vm_sync = 0;
>> +
>> +	*vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
>> 0);
>> +	*bind_engine = xe_bind_exec_queue_create(fd, *vm, 0);
>> +
>> +	/* Create and bind batch BO */
>> +	*batch_bo = xe_bo_create(fd, *vm, batch_size, vram_if_possible(fd,
>> 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	*batch = xe_bo_map(fd, *batch_bo, batch_size);
>> +
>> +	sync.addr = to_user_pointer(&vm_sync);
>> +	xe_vm_bind_async(fd, *vm, *bind_engine, *batch_bo, 0, batch_addr,
>> batch_size, &sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC);
>> +
>> +	/* Create and bind data BO */
>> +	*data_bo = xe_bo_create(fd, *vm, data_size, vram_if_possible(fd, 0),
>> +
>> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	*data = xe_bo_map(fd, *data_bo, data_size);
>> +
>> +	vm_sync = 0;
>> +	xe_vm_bind_async(fd, *vm, *bind_engine, *data_bo, 0, data_addr,
>> data_size, &sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC); }
>> +
>> +/**
>> + * purgeable_setup_two_vms_shared_bo - Setup two VMs with one shared
>> BO
>> + * @fd: DRM file descriptor
>> + * @vm1: Output first VM handle
>> + * @vm2: Output second VM handle
>> + * @bo: Output shared BO handle
>> + * @addr1: Virtual address in VM1
>> + * @addr2: Virtual address in VM2
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag for VMs
>> + *
>> + * Helper to create two VMs and bind one shared BO in both VMs.
>> + * Returns mapped pointer to the BO.
>> + */
>> +static void *purgeable_setup_two_vms_shared_bo(int fd, uint32_t *vm1,
>> uint32_t *vm2,
>> +						uint32_t *bo, uint64_t addr1,
>> uint64_t addr2,
>> +						size_t size, bool use_scratch)
>> +{
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = 1,
>> +	};
>> +	uint64_t sync_val = 0;
>> +	void *map;
>> +
>> +	/* Create two VMs */
>> +	*vm1 = xe_vm_create(fd, use_scratch ?
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +	*vm2 = xe_vm_create(fd, use_scratch ?
>> +DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +
>> +	/* Create shared BO */
>> +	*bo = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +	map = xe_bo_map(fd, *bo, size);
>> +	memset(map, 0xAB, size);
>> +
>> +	/* Bind BO in VM1 */
>> +	sync.addr = to_user_pointer(&sync_val);
>> +	sync_val = 0;
>> +	xe_vm_bind_async(fd, *vm1, 0, *bo, 0, addr1, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +
>> +	/* Bind BO in VM2 */
>> +	sync_val = 0;
>> +	xe_vm_bind_async(fd, *vm2, 0, *bo, 0, addr2, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +
>> +	return map;
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-dontneed-before-mmap
>> + * Description: Test marking memory as DONTNEED before mmap access in
>> +system allocator
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_mmap_madvise(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm;
>> +	uint64_t addr = PURGEABLE_ADDR;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	void *map;
>> +
>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
>> +		igt_skip("Unable to induce purge on this platform/config");
>> +
>> +	/* Try to mmap - should fail on purged BO */
>> +	map = __gem_mmap__device_coherent(fd, bo, 0, bo_size,
>> PROT_READ | PROT_WRITE);
>> +	igt_assert_f(map == NULL, "mmap should fail on purged BO");
>> +	igt_assert_f(errno == EINVAL || errno == EFAULT,
>> +		     "Expected EINVAL or EFAULT, got errno=%d\n", errno);
>> +
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-dontneed-after-mmap
>> + * Description: Test marking memory as DONTNEED after mmap in system
>> +allocator
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_mmap_madvise(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm;
>> +	uint64_t addr = PURGEABLE_ADDR;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	void *map;
>> +
>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
>> +
>> +	map = xe_bo_map(fd, bo, bo_size);
>> +	memset(map, 0xAB, bo_size);
>> +
>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
>> +		igt_skip("Unable to induce purge on this platform/config");
>> +
>> +	/* Access purged mapping - should trigger SIGBUS/SIGSEGV */
>> +	{
>> +		sighandler_t old_sigsegv, old_sigbus;
>> +		char *ptr = (char *)map;
>> +		int sig;
>> +
>> +		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
>> +		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
>> +
>> +		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
>> +		if (sig == SIGBUS || sig == SIGSEGV) {
>> +			/* Expected - purged mapping access failed */
>> +		} else if (sig == 0) {
>> +			*ptr = 0;
>> +			igt_assert_f(false, "Access to purged mapping should
>> trigger signal\n");
>> +		} else {
>> +			igt_assert_f(false, "unexpected signal %d\n", sig);
>> +		}
>> +
>> +		signal(SIGBUS, old_sigbus);
>> +		signal(SIGSEGV, old_sigsegv);
>> +	}
>> +
>> +	munmap(map, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-dontneed-before-exec
>> + * Description: Test marking memory as DONTNEED before GPU exec in
>> +system allocator
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_exec_madvise(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr = 0x1a0000;
>> +	uint64_t batch_addr = 0x2a0000;
>> +	size_t data_size = 4096;
>> +	size_t batch_size = 4096;
>> +	struct drm_xe_sync sync[1] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = 0xbeef },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint64_t vm_sync = 0;
>> +	int b, ret;
>> +
>> +	purgeable_setup_batch_and_data(fd, &vm, &bind_engine,
>> &batch_bo, &bo,
>> +					&batch, &data, batch_addr,
>> data_addr,
>> +					batch_size, data_size);
>> +
>> +	/* Prepare batch */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = PURGEABLE_DEAD_PATTERN;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr,
>> +data_size));
>> +
>> +	/* Try to execute - should fail or cause GPU fault */
>> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	vm_sync = 0;
>> +	sync[0].addr = to_user_pointer(&vm_sync);
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	if (ret == 0) {
>> +		int64_t timeout = NSEC_PER_SEC;
>> +
>> +		__xe_wait_ufence(fd, &vm_sync, 0xbeef, exec_queue,
>> &timeout);
>> +		/* Wait may succeed (NULL rebind) or fail (purged) - both
>> acceptable */
>> +	}
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-dontneed-after-exec
>> + * Description: Test marking memory as DONTNEED after successful GPU
>> +exec
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_exec_madvise(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr = 0x1a0000;
>> +	uint64_t batch_addr = 0x2a0000;
>> +	size_t data_size = 4096;
>> +	size_t batch_size = 4096;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = 0xbeef },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 2,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint32_t syncobj;
>> +	int b, ret;
>> +
>> +	purgeable_setup_batch_and_data(fd, &vm, &bind_engine,
>> &batch_bo, &bo,
>> +					&batch, &data, batch_addr,
>> data_addr,
>> +					batch_size, data_size);
>> +	memset(data, 0, data_size);
>> +
>> +	syncobj = syncobj_create(fd, 0);
>> +
>> +	/* Prepare batch to write to data BO */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = 0xfeed0001;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	/* Use only syncobj for exec (not USER_FENCE) */
>> +	sync[1].handle = syncobj;
>> +	exec.num_syncs = 1;
>> +	exec.syncs = to_user_pointer(&sync[1]);
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	igt_assert_eq(ret, 0);
>> +
>> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>> +	munmap(data, data_size);
>> +	data = xe_bo_map(fd, bo, data_size);
>> +	igt_assert_eq(data[0], 0xfeed0001);
>> +
>> +	igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr,
>> +data_size));
>> +
>> +	/* Prepare second batch (different value) */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = 0xfeed0002;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	if (ret == 0) {
>> +		/* Exec succeeded, but wait may fail on purged BO (both
>> behaviors valid) */
>> +		syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL);
>> +	}
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	syncobj_destroy(fd, syncobj);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-per-vma-tracking
>> + * Description: Test per-VMA purgeable state tracking with multiple VMs
>> + * Test category: functionality test
>> + */
>> +static void test_per_vma_tracking_madvise(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm1, vm2;
>> +	uint64_t addr1 = PURGEABLE_ADDR;
>> +	uint64_t addr2 = PURGEABLE_ADDR2;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	uint32_t retained;
>> +	void *map;
>> +
>> +	map = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
>> +							addr1, addr2,
>> bo_size, false);
>> +
>> +	/* Mark VMA1 as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Verify BO NOT purgeable (VMA2 still WILLNEED) */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Mark both VMAs as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, addr2, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure and verify BO was purged */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 0);
>> +
>> +	munmap(map, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm1);
>> +	xe_vm_destroy(fd, vm2);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-per-vma-protection
>> + * Description: Test per-VMA protection from purging with GPU workload
>> + * Test category: functionality test
>> + */
>> +static void test_per_vma_protection_madvise(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t vm1, vm2, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr1 = PURGEABLE_ADDR;
>> +	uint64_t data_addr2 = PURGEABLE_ADDR2;
>> +	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>> +	size_t data_size = PURGEABLE_BO_SIZE;
>> +	size_t batch_size = PURGEABLE_BO_SIZE;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = PURGEABLE_FENCE_VAL },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(&sync[1]),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint64_t vm_sync = 0;
>> +	uint32_t retained, syncobj;
>> +	int b, ret;
>> +
>> +	/* Create two VMs and bind shared data BO */
>> +	data = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
>> +							 data_addr1,
>> data_addr2, data_size, true);
>> +	memset(data, 0, data_size);
>> +	bind_engine = xe_bind_exec_queue_create(fd, vm2, 0);
>> +
>> +	/* Create and bind batch BO in VM2 */
>> +	batch_bo = xe_bo_create(fd, vm2, batch_size, vram_if_possible(fd, 0),
>> +
>> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	batch = xe_bo_map(fd, batch_bo, batch_size);
>> +
>> +	sync[0].addr = to_user_pointer(&vm_sync);
>> +	vm_sync = 0;
>> +	xe_vm_bind_async(fd, vm2, bind_engine, batch_bo, 0, batch_addr,
>> batch_size, sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC);
>> +
>> +	/* Mark VMA1 as DONTNEED, VMA2 stays WILLNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, data_addr1, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure - BO should survive (VMA2 protects) */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* GPU workload - should succeed */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr2;
>> +	batch[b++] = data_addr2 >> 32;
>> +	batch[b++] = PURGEABLE_TEST_PATTERN;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	syncobj = syncobj_create(fd, 0);
>> +	sync[1].handle = syncobj;
>> +	exec_queue = xe_exec_queue_create(fd, vm2, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	igt_assert_eq(ret, 0);
>> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>> +
>> +	munmap(data, data_size);
>> +	data = xe_bo_map(fd, bo, data_size);
>> +	igt_assert_eq(data[0], PURGEABLE_TEST_PATTERN);
>> +
>> +	/* Mark both VMAs DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure - BO should be purged */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 0);
>> +
>> +	/* GPU workload - should fail or succeed with NULL rebind */
>> +	batch[3] = PURGEABLE_DEAD_PATTERN;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	/* With SCRATCH_PAGE, kernel may allow exec with NULL rebind.
>> +	 * Without it, exec should fail with -EIO/-EFAULT or wait should
>> timeout.
>> +	 * Both behaviors are valid depending on kernel support.
>> +	 */
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	syncobj_destroy(fd, syncobj);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm1);
>> +	xe_vm_destroy(fd, vm2);
>> +}
>> +
>>   struct section {
>>   	const char *name;
>>   	unsigned long long flags;
>> @@ -2649,6 +3251,42 @@ int igt_main()
>>   			test_compute(fd, SZ_2M, s->flags);
>>   	}
>>
>> +	igt_subtest("madvise-purgeable-dontneed-before-mmap")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_before_mmap_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-dontneed-after-mmap")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_after_mmap_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-dontneed-before-exec")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_before_exec_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-dontneed-after-exec")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_after_exec_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-per-vma-tracking")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_per_vma_tracking_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-per-vma-protection")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_per_vma_protection_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
> can you please sperate all the test cases into the individual commits.
>
> -Pravalika
>>   	igt_fixture() {
>>   		xe_device_put(fd);
>>   		drm_close_driver(fd);
>> --
>> 2.43.0
