Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087F3EC01B6
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 09:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A641210E4B6;
	Mon, 23 Mar 2026 09:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NADMWwHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C6110E4B4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774259894; x=1805795894;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y0tIyC8lZbt3JFOiA90gILhYrngNJ9ttJx+pz1LAQoM=;
 b=NADMWwHa0iaraxo/IGZa69cKs36LkCQA3S/1tuFJA7eIC+JFVRQ88H6M
 Z6vxehI0QHmPivyHY2888fQjkRpR8i4cuKtgA+Jhmk9IyqdEPKnRYhwOk
 w3POsDx8qivrortv3gtU+AsyDHmnPpyk9mLTQKJUF/M6nR7zU2GRmwpd+
 nIs9S3vm894lVX9S+juElqzeuc03bQK901Pwr1Hh0kgrAKCMMaBabSujc
 qdwJ2BMwjoVgDvXyVJhfSoH3SePZWorBF0NNgmXRADwb8vhM0fq2d4T4w
 yYgnQ8GgJHoWPnlH5+Ysg383Id75r1hFbZE2t+x45IlNVHgeKSm6THQdQ A==;
X-CSE-ConnectionGUID: 8a0rRq1eRQOAWwmo2aXdrg==
X-CSE-MsgGUID: iXMVRvZSQyiYoGxuRhoRjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="79158953"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="79158953"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:58:14 -0700
X-CSE-ConnectionGUID: oUvuowOgRYCPbXRW7xvl9g==
X-CSE-MsgGUID: oGbVMCBPQQKVtERlAN4SeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="223999987"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:58:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 02:58:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 02:58:13 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 02:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6/NF2B9xsgxeTPCXYd20AHwyWs9Oxmmz9q9gfiD3WX33DIhslSCIMGdY4iCqZ3BtpArRLAp1C/PqvcTZQmnSV56nJgXFpLPzUcNOq9m+m3Y9Tg00uBMcvgsuJhoqCmUs4QdJKhj26HWgJU25oi2sjB59h0AItQS2alC5ZbqILXYkjQHWpdRjhY3igcLwn3TtBW61eLR7JiZGwwZekCA+S7IJZ75+SAlqdgx8lFm3h1GF4BZilfs0uxUCy3/O3hsJks6tx/n7x6ftguAOW4Vx++UPEkESaKkbEyGDZc0fpjJx6Wc/Dw+4P1dXWZRonu0JL9vyFROs8ey41xbXVEx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56HfX4K1btOpeUeMWARsMfUEJ68l4Mr+t3eOBCGoaxI=;
 b=b6nQdArMiUM5Q2MqJwGUczpCGT3oPiXOQfU5DAE3w/Iw+yt2XRr4/iWezuu0FkPDrHVDu/16f/VTXGlGFHbrm6efQHrjKtQj0epL0cxzYKhvVBO6AifMw3J9Di2PS5/Oc66remi8wnGvM8hki6bSLsFp7jf+cAirzbyqK4cdTQLtb5SNmqfadFafSdAjEXVufyFdmCSWx8EBQNHxDYmH7qfmHaRtToXth6rILmcC1bnFrxi32to6hprwJTa5gWE4MKp/ikSoWno/JNFRZioSogyP6vJbYPzUZxrI9gRwtVDBDgQ2+/j3fYqHoz+YVM47jsZwcP+bn2+g1zbE0XSnuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by IA1PR11MB7810.namprd11.prod.outlook.com (2603:10b6:208:3f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 09:58:11 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 09:58:10 +0000
Message-ID: <6fa014a2-2421-4de8-9f97-dc1ecaabaac1@intel.com>
Date: Mon, 23 Mar 2026 15:28:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pm_residency: Fix suspend duration
 calculation
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20260323070228.1383377-2-sk.anirban@intel.com>
 <a59e6c3b70eccfa43a5902bb089f9e799b1df68a@intel.com>
 <e9e96a80-5a0f-4aad-8b29-e5ff9fd09ddb@intel.com>
 <0df9c0376894cc064be3254fd39b7c52842942ff@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <0df9c0376894cc064be3254fd39b7c52842942ff@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::19) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|IA1PR11MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c79650-2983-4341-217b-08de88c2b099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: ptw03NFaHWRYMDlIl8EU8B5qLe3R9WTNxXGcEFLbnYRxfAuqOr2vSGi334S1NqCbnInWiEEaliOZNTYLjeE7Bs9MBKLZXKTb0pH2p+PuxmXpAFlxZxli3fVWNlFh0tg42bJZnUNBhfdfFiHU5s9b3dYRs+/d2zynRb0yt1eUhbRw+t4qMU7XtOnd0Sr8gfGcqKo5q6stkv9PRqX1PaYL6FsuMw8EashRAP2JoRvBaHKPyoPIbFRf2pTnAa6U4quvTLsEwtxrlXyJ+fO1yevSzQiOrRRbVyCkRSNYRtsau2FSYVoSHLqrkhJEXjkhzFAysoKew+EK8bcPwnW7HPQZQ0+cc8nMcEsIk1HtlxG4Z4Ehhc7qLCS9WH/qWusyKdxRiFQ1HyiPxlhtLxff6PIvX+DWZP6/CMEgrXIyLuOd+NcgUuSBUDjNta6sBr/kofgVlmba5WMVPsMuRakuS1+siOpK/s2evxoaSp2OePu0ivbIxky+9yqxHm82xLLNpquRkS5EpNl6QTE1zZjto5daB0dGnVKsqD7guYVY2iKbTT5ofCMkalF6ftcAequ53D5Ya5G4dwgJdA2yOkSorz4l9UJWIIEjSP0vqixiBb7tbrtMcITzqB2oTej3zhvj6zeBC7TP6C8PU3h/jup9R7CsvjDZ8x1BZYJLbezY3Xo1RxqmWlw7xql3yp2ioHsra4gx2HHLjQCJMNnRh/t6sDMnJUQLhF7K3IYhfYwyJUr0zqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S21hditpQWNaZnRCWGhQdW5qQ3ZkZm9yMStuVDBkMzdlNEszRnhuZFR4MFNo?=
 =?utf-8?B?elhJS0NiZ0QyMW9rekVYa2tRSVdTVG9NbTB0aU1MZE5ITExLRDJVclgxQjNH?=
 =?utf-8?B?bHAyaW91TDVkNTN3ZTdHT2JHckhyMkFwc1JvNEpiWmZQL21PRjl1WEhBU2ZG?=
 =?utf-8?B?WmRhL0hzeDUzN2VCbmFkVE1YMVpvSWRNaTkvRjFHa215QnMra0RDTkkxVWdh?=
 =?utf-8?B?U2lHY25mVFJpcUIwR0ZQLzJNZzF2Q0FsbVBtUm4raU91bDdPbzFYRS93MFE2?=
 =?utf-8?B?cmVVVHVQOGpuM0RWeGZOMEVrV2xCdG9xNU8zZTVrNGtENG1SbWtDMHFVb3h4?=
 =?utf-8?B?YVdqSDJoeWdFWldRc0Z2dEdmTnU1dDNCNWxLNXBnZXBBSVVKU0kyejRUcTJO?=
 =?utf-8?B?MThSYlkzUS9SSCtvQjJrWm92eXRYVDMyM1QvRDlJQ0RZNWtPU2FtajR6T2wz?=
 =?utf-8?B?bG9oNko5L0hEbzIvMnUwT3I0b0dESUU5emxOcmJ2ZVQrRVUyZ2VxNFRjOE14?=
 =?utf-8?B?RWs5L084blF0bVl4bnFZcFIwY1YwQ1ZUVmdBc0Uzc2NOSmZldk9CNFF3OU5t?=
 =?utf-8?B?ck5kajlZakxld0dGVmdGUExFNkg1N0N0WWFRSUhZZ2d5azd6UW1XYXY0SitQ?=
 =?utf-8?B?T2RDWGlhMmRDeFppQkJ5cFE3T2VPZHJoajNmWXNncVRBdW1sZnJIZmR5Q0g2?=
 =?utf-8?B?eUQrV3MycGdjaE9QT0NPM2NlajZITVBhRmlnZXhjckk4UG1pbWhwWHZ2dnFH?=
 =?utf-8?B?eGdIaUJoUjh0d0NWVm8yTUI2Y0hmZVVlNU5DU3Z5cDVsblBybWxLcTdCTXJY?=
 =?utf-8?B?MHMzVlU5Y1dyWm9Cc2NKMEU4M1BMMWZjKy9EL0ZmbjRla3o5MEQ4a2VuSWVa?=
 =?utf-8?B?TkR1UGNEMURyYmJJSlN2TDZzanYzWS9Kd0Z6S1ZDb3hQN0hNL2NET1FhZGZE?=
 =?utf-8?B?NGxRSWhWN3M0RGtZZDNDS05RbHBHVW8vSDZoMmFiM1UzV3plS2tmZlh0WWJG?=
 =?utf-8?B?MlJxWWZVS2F3WFFEbnlZRFBmaWlNSUkybGVVWTgyMzFJbzFCVVh5OXc3UlpD?=
 =?utf-8?B?THhpVWl6ZlJsaHVLTHM1ZHBoYUFDZy8wak5pVHIzN3VPR3grVEphZFpnNFVm?=
 =?utf-8?B?clh6Nm4wUlk0VlBRajA0MXR5SnBlWEtiL0c4ZERyZlJiZEl0dVkzb3UzN1VB?=
 =?utf-8?B?YjdGYklDRldKM1RRZkltU2lUYzQvcnQrMFVvK0srRjlINE11aGpJWWYyd3RX?=
 =?utf-8?B?MUJVa3Q4OHhBZTU5Q1BHblN6SEtOTHZDK2NoWG9zN3JTcDhWRXJTRWl1bTJB?=
 =?utf-8?B?alV2dFJmaDBWUk5BWXhEMVVVRjZkUUE2QVdBUGpSMVE2eENycmNLYyt1MEJN?=
 =?utf-8?B?eEtlMFBTMUIvT0p2ZnMxeGFIT2kxNDFsZ05lWnBUOFA2cHNUK1pocUdrdENh?=
 =?utf-8?B?aS84YnlwelJrOGl3eXZKZHZCNVg3RENFaFlRamVrYlQ4OTkwSXpRckU0d2ZP?=
 =?utf-8?B?WGVuM1piamNiYkQvTVFraFlhMjhhSmVDdHZUSmo5MWRrR29zWTZRUTIrTXU2?=
 =?utf-8?B?UEVmQ0Y1MEZiV2ZuUlNqSFBFYmZTUE1hZnVHbWo2RXJuZkRQL1grZXlNU25C?=
 =?utf-8?B?MTRnVkFrd0c0MDlFZnBvbnZKMnM1bHAydmVac1BEaW1kRjR4ZDNrSGZYT015?=
 =?utf-8?B?REdkSW5NL004c2o4ZGlGcnliendhcXE0ajRyeGcyaVExd21qc005eXlpQUI2?=
 =?utf-8?B?WWM3dlFETlpHZlB3aUFqUFpncHNET2dZUzJDeGN5bFhqQkl3aGdLREFZOWs4?=
 =?utf-8?B?Q29sMm9sUEh0Qk9RdWp0ZW1zQzhZSlhNYjJ4bkZYV0JVMFhsa3pkWUMxbFdC?=
 =?utf-8?B?NlI1TzhyaGtIdjZhc3BXZXZNV1B2ZVFtM0Z2QUJQY2x4cGJXZ0N3RFNyZ0dG?=
 =?utf-8?B?YmxrNktDTVlzYWYxdHFxQU5jajVneU9GWDFFSVNROXNTNmlHeUFnV1lCYnJM?=
 =?utf-8?B?amF5VkV0U0lqZE1ORmdjQ2dFWmtIUlVsZk4rQk82d2YxbW1EeHkwa1FpZStF?=
 =?utf-8?B?YWZqd1BieFF5dnozQWlzeFRUcThIcW5ScVFKNW1MaXRYejIyTGl5bWZVd25K?=
 =?utf-8?B?WjlSeWRmbDhGckVBYVhnaER5aDFOeFJ4VnF0OXlXOWMxUmJoeFlRUGtTK2tx?=
 =?utf-8?B?eUorNVVMZFh0VmhDTzd1dVhlMXNZZklmZ1lrdDZ5TnV0YXB5QUt2RjZQeTVr?=
 =?utf-8?B?aUZTYy9wZmxxUWh3c09kZEt1b1ZyaFE4RmFuWDZRRkdqMWpVRXIrL0REM0pE?=
 =?utf-8?B?WkNRQlg5N3VLVGZjY1lmSi9LNlllRW1PVDEydnZkZnVwNVpHUk1OZz09?=
X-Exchange-RoutingPolicyChecked: IVYW34uzjiZzX8WsV1E9Bc9Xlbr9b+b4Fe+uK0t8NKEbhQEvn29QXWVaFbB/rUsop8NmSjB/cNT3sGBmAjnn5gd1gIrBP5NCSQak9Cf5gsk2d58ewM306D4MxJxTYRaSouHywkVflokfyULMLVdSVCn8f9a1HAgZMLOKQyuO/n26Q0SooBpPrbOvdncfOCYNthOlKcCN+REQDmCEx/4pzk2IHkBsnMdfuNVTrBR8m8gPgF2Fwg3X9GM9ieD6YdHqs7ETfeDdhfQ2isERIwZG7TXW/XNmJxK1hf/VQpLgzeAYfxs8c137VrG1xBN+9eWnl0Ohad8jVoil9GOfwGav8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c79650-2983-4341-217b-08de88c2b099
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:58:10.4323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1+4K44LT6YRIi+A0vrfueDlxCz3Fpdf4UDUz13fVsVN/oiOwHNXg+QISjpYsACUcI3fyBer4x6iQMan0H9LYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7810
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

Hi,

On 23-03-2026 03:24 pm, Jani Nikula wrote:
> On Mon, 23 Mar 2026, "Anirban, Sk" <sk.anirban@intel.com> wrote:
>> Hi,
>>
>> On 23-03-2026 03:00 pm, Jani Nikula wrote:
>>> On Mon, 23 Mar 2026, Sk Anirban <sk.anirban@intel.com> wrote:
>>>> Fix the unit mismatch caused by interpreting seconds as milliseconds
>>>> during suspend duration calculations. Apply MSEC_PER_SEC multiplier
>>>> to ensure correct unit handling.
>>>>
>>> Fixes: ?
>> The change is a part of test gap which is filed internally.
> No, Fixes: should point at the commit which introduced the use of the
> wrong unit in the public repo.
>
> BR,
> Jani.

Got it. I’ll include that update in the next revision.

Thanks,

Anirban

>
>> Thanks,
>>
>> Anirban
>>
>>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>>> ---
>>>>    tests/intel/xe_pm_residency.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>>>> index 61b63ed4f..46718a444 100644
>>>> --- a/tests/intel/xe_pm_residency.c
>>>> +++ b/tests/intel/xe_pm_residency.c
>>>> @@ -223,7 +223,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
>>>>    		 * elapsed time during suspend is approximately equal to autoresume delay
>>>>    		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
>>>>    		 */
>>>> -		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
>>>> +		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE) * MSEC_PER_SEC;
>>>>    		residency_start = read_idle_residency(fd, gt);
>>>>    		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
>>>>    		residency_end = read_idle_residency(fd, gt);
