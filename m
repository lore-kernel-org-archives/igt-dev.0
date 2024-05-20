Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A23C25B78
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 12:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D2D10E59A;
	Mon, 20 May 2024 12:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJqRv4Ge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAD410E59A
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 12:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716206459; x=1747742459;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=V8oDHoNabccQNOCxBm6gwVwEazfZc1+Sqs8NfN16LYk=;
 b=FJqRv4GeMyaCElbH7c79LLG8ZJCWWZEcTY+gGgYb2eHVN7CFnRJAQ4dE
 ylIuFcMpbEa9bKKrZ3pwmKCGrPJ+G0FE/mh9MRJLfuyRHGIUC8gMs3cGT
 LVvpbaiTB5EOcrXACD6kXTC+yowp07MZSSXFL8JVBOJMSXbAhFVIQ38U5
 I2mMkUZMjx9y25nIkE4e37cdodIU3WRQaekl9IlocLg2heP5Ux8GPVYzP
 CwDbmlUCnOTh8elnQK03hojK8E+pi5HobJZ+cCRQ4ZTVfsPYQDWZtgN6m
 BBRqfLd/Q2RmfXBLv8NC7C/dJW4mwYFih0mVxWK/8uM2YwOp1crbH/MZ0 A==;
X-CSE-ConnectionGUID: ZO0T+lmhRFKqQ1nvzGbL1A==
X-CSE-MsgGUID: sczyctIfTyOkilmIHxZm1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="11606271"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="11606271"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 05:00:57 -0700
X-CSE-ConnectionGUID: 9DA7gpK5TuCEjef0bo12pg==
X-CSE-MsgGUID: tKg54XJrTai98QdNGQwx3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="32410781"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 05:00:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 05:00:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 05:00:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 05:00:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDMPZkWE/VFK8TlWUj1inSGLN9afrrbmhdTzCEQx+BGr6p/AspFa1Y6D0RlTCThjJiYAn2Qi+MKv7l4hP22qRRMsHe+rH9Dq3Ha3GSfKvzki5ADopani5cPVRhdNW9Fw+/dz8janphz7q8HQHsKKI8IxniWh/xJ18xRfA9KyDlcy7GklBcEdn4yfO7zdtEKMVNGA3x9XcT5aIy+/BZReBECHmYdwCIMXQAmtCik0v/wUULjLZYqIDX7asy96HE4px5hq9Iw8DsZ/TJtNtjounnamZnKjnI+nYtsBecftWZsreSKghY+kxVBkLMNxReA5s9x7y6pr9DJ6ZiLHNN0FdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4YpeAOU5V6Thr1Xs16pwJYnQdnjwCTDxWLj/01+ZVA=;
 b=hgNZZmKgAutDvSi2SClmsakS7v35jCjnfbhNbfdJaFwV4TrFZxLyBzRUmv8cX++gLa0aVm3qmwIM7T/NLSWjD3x3IVARkK0NcSfRoUF0m7w3tcrMsPGq+P80j94k4ZZ2IJcCcpIQ+viKlNEOMlpfsajnaUtpYw6NN6ouDZIXSYlzrHIvxw0DUVLZ2qWCa46m+vlOnab/z0yKpgIWYfD4NR+Nm9Dc3r6VYiwVhP4Gx8sbe8MXBX4MwNdvrrDu33qB51VjqXmpys2PAme391qcxyFAzgQmIrvntr6A83XFCtUAOLEfP9su/ls1bHUxJ8ru0hRje4cT53HcfZk1FSvlbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 12:00:55 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 12:00:55 +0000
Message-ID: <0c319f00-57de-4ed7-a9ef-65877a67c232@intel.com>
Date: Mon, 20 May 2024 17:30:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms: Move kms_plane_scaling to intel directory
To: <juhapekka.heikkila@gmail.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>, "Mark
 Yacoub" <markyacoub@chromium.org>
References: <20240520064150.2519210-1-bhanuprakash.modem@intel.com>
 <20240520082217.agl3fz6d6d25jyhu@kamilkon-DESK.igk.intel.com>
 <50dbfa55-b7ff-42cf-88b7-ac5a73ad846b@gmail.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <50dbfa55-b7ff-42cf-88b7-ac5a73ad846b@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 370b8826-6b66-4c33-9b74-08dc78c480c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjU0MXRwVmxLRmdEcGoveWIrTitDdDJhMlRuWWJTR0dhRitXYlN3bEYreDd3?=
 =?utf-8?B?eW9BbnpKeHFxUExCamhyTmZKUXhhVDUwL05ZalpYN2RHWjkvNkZiRmZpcmth?=
 =?utf-8?B?VzVIT29CTnVvZDJDbFRieDNVK3B6Vk1lL3gvV01xMGEyRHBSdFgxdVJhSml3?=
 =?utf-8?B?dkpBaVlneURpWXhCU2YyeTJqSEN2VUozOTFQS0NUa1JkNkFZZGQ5dXhHbHJs?=
 =?utf-8?B?TDk3Z1Y0RFhWVExUSGlEMnhvQUFOdldXMWYzaTJsOGNETC82bk1iWms0Qm1N?=
 =?utf-8?B?cU1SeHMvOWtjWTRrVVRyRGNTUzRqY21qRGpvSllhdzNBN2l3OVJiUER4WlUx?=
 =?utf-8?B?UDZCeUZIeUlHUFkyZExPQmZwN2RkdDZkemhDSWpVb044ZUcvWFNsSmVWcGJ4?=
 =?utf-8?B?dGVTT0xWS09OdjlMQU01U1A4WEF1OE0yTTBob05vWmhwQ0dGMGJnRmpRZ3Bp?=
 =?utf-8?B?aUcvV0x0S2FmaWcvQXJvVjFHUm1JT2E2ZDhFa1FIeVJGYUx0NjhIWFZjWk5Z?=
 =?utf-8?B?UHVjY25JeU5lMVVNY3VJMzZYUVFYbFBiajdlN2JRNVlpQklINm0yK0lZV3Ar?=
 =?utf-8?B?aCtxS0phUTB2ajVuYWM1WWlXZ1BQekcxRGNwaS9wS3MwK21qQU50bWpEdGxH?=
 =?utf-8?B?SHVBME8waXE5aUg4OXpKSXd2QnhBMnVwMms2TExXZE5IRVJPaldicWVOK3F2?=
 =?utf-8?B?czBxV09qS0M2UXg0MVNZWFlCR2E3VUkycUkzTXFOaVJXR2lrOTd0aFFHK2Zw?=
 =?utf-8?B?QnNBbjlxeXh4NzI4TUFIWW1GeEMwNWtCMXNRcUNnZDVUaElxeXJtbHhUMEk3?=
 =?utf-8?B?T0ttMzN6bG9wVTdUT1A0SDQvMlV0TzRXRno0VFZWZ1ZrSG02NUxqVndTckND?=
 =?utf-8?B?Z2JGMHIweVFhWE5aSXBzd2Y5K003bVFlUWwwWGZOUjg0N084UWR2WkVzM3NV?=
 =?utf-8?B?a1YxYXBJZVdyU1JtVlZ5bWFUb2wrOUVhLzQrZXVMNEtjcnY0N0ZIdGdpbVJJ?=
 =?utf-8?B?SjdvTTltMGJtSUxQbk1Jc1pBUC9FL3I0dHUwUmdGVjV0RXFiUTNGMHhBVzVi?=
 =?utf-8?B?RVRnQUdlYWNYQlZvTzZxQi8rQXliWit3d3FFbzQ5VE1zZ1JPYkNKYVcvbmdo?=
 =?utf-8?B?WXV0VzBkS0tKR1ZKNDl2U1VBTWdTQ2hBa1BXT2x1MlVvY0J0UGE5czhLbTIx?=
 =?utf-8?B?WmVncGdQS29FZnhPK25kL1RCdmZVVVNJQTRFekZ0Z0N3YmprYVdubFljSjNq?=
 =?utf-8?B?WmdTUThwbENodGZacDYrSDRCWk5XSjdDQjFZeHBUeFV5RjNpYWlMczg4UXFk?=
 =?utf-8?B?Q080OG13L2NYMUJ5K0dUM3J6WmZZZUtHNzZoa3hya0xyaG45bXBONlBieldx?=
 =?utf-8?B?Q3UrRUlaTGhNZG56UUZOcTJVQ0JrQmhXZVlDWXlvdDNKZm14OWc0Q2VZbUtE?=
 =?utf-8?B?RGhSQWZ3Qmw5Z2NwUndSMHZOelJCWnZCUGlVNXduSUY5Rk14NERTM2N3UGg2?=
 =?utf-8?B?bkdWamZtM01lM09jQlZUZzdXRFJYc29iRW0xSnJZZEF6TFd5VEEyN1ZrVzVa?=
 =?utf-8?B?aGhzSU1yTjdkd2NaZHJrK0tOR1YwRm9qUkk4dzNQcTRqZHlQazZHbWFoMVdD?=
 =?utf-8?B?WjVKTnBlbWYwTFU4d0JtMXNyc2Jsd2xvbmxlS01kQ011NDhsRzhUVFZvV0RR?=
 =?utf-8?B?b1Q2WDFRNll4ZkgyNmt1Y01SNEtWWlI5S2pCMHRQZzZBM21mWU5hWGZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0haY3VwWFZ4UThrNGcvdUpnRlNWbGlRSWpDRmh1WHdSOTJmSEsvRCtST1d6?=
 =?utf-8?B?UHYxSGNHMCtlVGlVaUczczFIelZtTExKT3RuVEhPVm5TVWx0QUYybGdwbHIw?=
 =?utf-8?B?azBJTTFpQS9NNjVwOGp5UzhyUkViSkRXMGM5WVpna0FibmtxRktYa0E2WFNi?=
 =?utf-8?B?ZXhJNGVzTlc4ZzFNZS9ocXl4bDJTeUx6aEpwb05BOUkvdWdJVytRRVpnbFZx?=
 =?utf-8?B?T0JJSExEL1h0NUo5cCtzSUIxM0tTYjFlL0dRdlpCL2I2ditmeDJpTHQrZEgx?=
 =?utf-8?B?ZGNJMlpIUm9LQWZtaWszcnlLZ1VGNGY5b1EwSTNENDdjY2VlaGFQSlVjSFBz?=
 =?utf-8?B?aGNpdDBBSHFEUVNmcnovdHpiREN3RWoyb0g4M05iWVFkNFZEUWxUM3FXMEtT?=
 =?utf-8?B?VnY0bUt0dnBmSEx6azJlcENKQ2xzUXlWbzd2cy9obG1GTU45ZGxxMzNlZDRN?=
 =?utf-8?B?MlhrZ0NqL1lwOEVQaU16Z3JHR1NBTzB4bXZCSE1ZcHRJR2ZtNmtFNXF5SUhD?=
 =?utf-8?B?UmJLK1gwVkFIS05iS0Qxa3gxZEwyaG5oNjNzVUxHbGJJbyswc2MvbW5IczFo?=
 =?utf-8?B?eWlZaUlmRVpnK2hTS214Umdxdk9yNkhnYWRrNTN3WTVaMTBMS0hlL3dVVDZL?=
 =?utf-8?B?UUIwZTBtemZvZy95KzFWWS9ENWRzTXE3S2ExRXIrbElHRUNNNUJVd3FYRmJZ?=
 =?utf-8?B?RzdqZXJXTkVOQWF0NEFtTDhCM3JWZXNNKzFteDdiaUlCSUtUZkhycmZUSGp4?=
 =?utf-8?B?aWVha2lXYXVKWFU2d3JDVVVOb3ZVT3ZKcklNZHBUU2xVOVlhSExMNWd3K21Q?=
 =?utf-8?B?SlhWcFJ1SXQ5VHVqNmFNZFRKUGthamYwRFFvaUt4eEJaTGNialUybFNEQ3cr?=
 =?utf-8?B?V2NjSGxFV2NJL3VPYU93ZUdLaENndndzKzJXYjJJK1A4TkVSUUJZa2REMmVa?=
 =?utf-8?B?NmVmSU1SakJJZFpKaE5nSElyWGhkamQ3Q0loSTZNdktOelNXcUJiVm5GMlF4?=
 =?utf-8?B?TkhHdUNsTW14RlFSL0JNVk10akVuQ2lKR0FHUEhnSjNMaGdsM1l3Nkg2UGUv?=
 =?utf-8?B?OEdiWG1hRDlkb0VsWTNTdElPeUhaVHVlM0U1YmZFTk9waVd6ald1TTEwTEhR?=
 =?utf-8?B?VmZlMVBiNmNnek9vb09TTEExNW85bDlERjV2dFBnNjVvNWdtQlFON3JYa1Ar?=
 =?utf-8?B?VzhMNE9ES3N3OVVva3pEM1E0T2NZNkQ1bWhlQnBQNk9XMGdLTUJhQkk0N2gv?=
 =?utf-8?B?N1FleDF4WWFFNE0rSkZsWVRCdVNXRVQzQW5NemNrcVpabEFYN0U2TzVXL0da?=
 =?utf-8?B?UFVkZ1RWZjlwc1VaVWpQZ3E0R3FGVGVoV3M0cEtFQkFILy9tVWI5ZTJabzdo?=
 =?utf-8?B?MTZRUFVVQkJXZW93NVg0bHV2WDJ6d2RQTjlWZXZvVHFPS1NEdFMrSEdsN3JS?=
 =?utf-8?B?dTM3eVF3dXB2M3VGQlZkZHFzMTYybnpkYjM3TDZkQmNrWWtBcU5RMCtUaDNK?=
 =?utf-8?B?L2w4WmYrb0dPTG16MDlTdzZlalNBdDJxcWQzb2d3SG5EbnQ5QVVpMktjVTVv?=
 =?utf-8?B?c1RLZmFMT2JMd2g0SDNlblBjVHNXMDVxZG1zR2JyVUJydmRXeGxvRU9YRkVS?=
 =?utf-8?B?Y3hoOFArUDkxc3FhVWtYTklsaVQzbTVITTZsS3lzUzdrblNpaEFiOE5ZSjV6?=
 =?utf-8?B?OERpRE4xT2plSWZ1aFVzYTBrcFRWdXFyYXdUc1RLWHd1RlBsSHU5V2pXWFE0?=
 =?utf-8?B?MXZqOVJtclkrSi9Md2JQZEdJendyRGdKcGxDdDV5NlA3YTVzSHQyWVhkTnRu?=
 =?utf-8?B?dVVFVzVCYUF5M0dqNGkyNmZmL1VGbzJTOThoN3RmL2dZaUtSUVBNTVBTQzlM?=
 =?utf-8?B?eUswWXk0RmVRTTZJbXFwL2hZTlpmQi8wcTBMK0N1cnRKVktFMjNta3JyRGFn?=
 =?utf-8?B?ZERncDBKT05YQ29QeVR3VHFSQk1zYmQ3U1ZWNHJuRnBvVmVwRXlncCsxTDR4?=
 =?utf-8?B?WkZkTzVLWXU1Q1dyZVJWeHJmUytkQ052dVFDaW44Si9HcUlsTHVLSU9QdnRu?=
 =?utf-8?B?VnBDMjZMWUgzeFlIQldqMnZsMGZvZmxmSkRzaFd1SCtLZW1ZTGQ1MXpRQm1y?=
 =?utf-8?B?d0RqUmFDcy9Yd0VadWRraUVXNGZkLzVJYkNXRlFJUGZwaC8rZGl5RlFuZktZ?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 370b8826-6b66-4c33-9b74-08dc78c480c5
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 12:00:55.0193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qu6xMzUip9Lav/aiby/g0CkO9MR0YWaKdM5bpVr27kpsAFkEtHpAWcZ0FRwyQhe3bDUIWeG+/QgxAUTOApQVzKlS6f7CImDJ21ypGm4QDQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
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

Hi JP,

On 20-05-2024 04:19 pm, Juha-Pekka Heikkila wrote:
> I didn't see why this test would need Intel HW? I see Intel hw is 
> handled with special casing, normally test uses linear tiling and checks 
> if Intel specific tiling can be used. What did I miss?

If you check the helper function "get_num_scalers()", that returns 0 for 
non-Intel cases, which causes the skips.

- Bhanu

> 
> /Juha-Pekka
> 
> On 20.5.2024 11.22, Kamil Konieczny wrote:
>> Hi Bhanuprakash,
>> On 2024-05-20 at 12:11:50 +0530, Bhanuprakash Modem wrote:
>>> As kms_plane_scaling is limited to run on Intel hw only,
>>> move this test to tests/intel directory.
>>>
>>> Cc: Mark Yacoub <markyacoub@chromium.org>
>>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>>> ---
>>>   tests/{ => intel}/kms_plane_scaling.c | 6 ++----
>>>   tests/meson.build                     | 2 +-
>>>   2 files changed, 3 insertions(+), 5 deletions(-)
>>>   rename tests/{ => intel}/kms_plane_scaling.c (99%)
>>>
>>> diff --git a/tests/kms_plane_scaling.c b/tests/intel/kms_plane_scaling.c
>>> similarity index 99%
>>> rename from tests/kms_plane_scaling.c
>>> rename to tests/intel/kms_plane_scaling.c
>>> index acb4a1da1..620dba911 100644
>>> --- a/tests/kms_plane_scaling.c
>>> +++ b/tests/intel/kms_plane_scaling.c
>>> @@ -1291,10 +1291,9 @@ igt_main_args("", long_opts, help_str, 
>>> opt_handler, &data)
>>>       enum pipe pipe;
>>>       igt_fixture {
>>> -        data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>> +        data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>>>           igt_display_require(&data.display, data.drm_fd);
>>> -        data.devid = is_intel_device(data.drm_fd) ?
>>> -            intel_get_drm_devid(data.drm_fd) : 0;
>>> +        data.devid = intel_get_drm_devid(data.drm_fd);
>>>           igt_require(data.display.is_atomic);
>>>       }
>>> @@ -1464,7 +1463,6 @@ igt_main_args("", long_opts, help_str, 
>>> opt_handler, &data)
>>>           for (int index = 0; index < ARRAY_SIZE(intel_paramtests); 
>>> index++) {
>>>               igt_describe("Test for validating max source size.");
>>>               
>>> igt_subtest_with_dynamic(intel_paramtests[index].testname) {
>>> -                igt_require_intel(data.drm_fd);
>>>                   for_each_pipe(&data.display, pipe) {
>>>                       for_each_valid_output_on_pipe(&data.display, 
>>> pipe, output) {
>>>                           drmModeModeInfo *mode = NULL;
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index 758ae090c..c53e3bc3c 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -47,7 +47,6 @@ test_progs = [
>>>       'kms_plane_cursor',
>>>       'kms_plane_lowres',
>>>       'kms_plane_multiple',
>>> -    'kms_plane_scaling',
>>>       'kms_prime',
>>>       'kms_prop_blob',
>>>       'kms_properties',
>>> @@ -262,6 +261,7 @@ intel_kms_progs = [
>>>       'kms_legacy_colorkey',
>>>       'kms_mmap_write_crc',
>>>       'kms_pipe_b_c_ivb',
>>> +    'kms_plane_scaling',
>>>       'kms_pm_backlight',
>>>       'kms_pm_dc',
>>>       'kms_pm_lpsp',
>>> -- 
>>> 2.43.2
>>>
> 
