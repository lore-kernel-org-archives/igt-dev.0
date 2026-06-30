Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73ABC43458
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 07:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5546810E183;
	Tue, 30 Jun 2026 07:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNdKFzHQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A475110E183
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2026 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782805616; x=1814341616;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nkS+u1hQu3PGSw8tC0lpjWNhZ+rWtG9wCdloTp+NSmQ=;
 b=iNdKFzHQyeWH9wdHIAiZxh3FdoKJ40+QuUXr9yWunaR6doNhRDzulN9s
 eXTJsnfiAsfef+eSQv8k0O1rDRCVe4xw/lmrIuQ2TgnUncLO/qqSLn2z2
 bDLUaDBFzduMUzkVEx30D6RbC9wdWab7lbpVP3jaqEFzYwTlDjduOmFPn
 WGubieU6JIFTV3zK4hXCrk0fhjEPAJxQNr6ftnGKn24sV8dOBoXIB89zB
 ztklmGzRKOtZz1ZVtr195z3sGocjFd9I2B981lFWHVosyXlyBQUg5OipT
 Eof/cMDZJ1jog7p8M2CVp564FYo/aR9tc2yovk3gEc+FkHqBG6/1Vm/ws Q==;
X-CSE-ConnectionGUID: FwMgXKo0TAC5nWMc61auVA==
X-CSE-MsgGUID: spGAsahPQJWGNS+qj6udNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="101055377"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="101055377"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 00:46:55 -0700
X-CSE-ConnectionGUID: Pm5Db01qTme4s+a9wWR1RQ==
X-CSE-MsgGUID: fkQ6h4FgTe2egpgeKo7/uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="290307654"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 00:46:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 00:46:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 00:46:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 00:46:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=As07Y1zCI42HiZU8xaiOf8RbDoa+KLD2vbRwfrg9WJujBKYgCxyCtNRoW1LxPrC3NN+UHKLu7DFCHm8wbptP8f2Pd6HzUEqnrwyZ08rAN2dY1T0hXxGWNNZ5MI5QfMQMRO1NhP5yOSW7XNpAW+deDbrTn/uiXFrVh6L+vOVlSDefNS6MIpWuw3yE0DZsM+VPIyGf1dJCisESy6pg10jYqCVDhvdC54cw06RzNzDQ0jsHcC3RfOhbuUTrDM1ekvPrPlclwT87hEU8Sx/lfi9N5XYrn0cGomeL/sSFSxupoSDcV9OcTVFC2o0pfMXNZlZBivtsFd32AtRekwg1dl86rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMFEXpB0aWTAvvdPwji8ZbHIzs0vKpAF8zI4yVkBp7A=;
 b=dwaNBkf4Y26R5SWvm0189J62+CE6uS8bVXai0uiFgvv5SdkOdL1nOpzLzWLdKySo/gFl5VjVkRSupi0E84WFNHmNSdFzJyk+1OkxMct9zzNutfarKe5GOF2ZalNGtyhAGOUAnauN7ONNu8VHIpl9/SRDjziki7/aXigtGg/U48/2xNkYG0NbkAgnfc9sAmo+DmsMYxF5l/8onCiJp0akrymtE8DdJXVIMtJuQa5mryNVRjBUcxt6osXbbmWSiV35P6VIQ/Vzdf474jnbNH3yjB3ZK9NYp4mvxxMtqj7Evz4aM0DL2UITdums2jP15/kLCrV+cUNLaFl8uxusVfcKcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ5PPF0FD67B0BC.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::80f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:46:47 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0159.015; Tue, 30 Jun 2026
 07:46:47 +0000
Message-ID: <e8711629-29a5-4074-9dea-722f3665806b@intel.com>
Date: Tue, 30 Jun 2026 13:16:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>
References: <20260629120129.3412130-1-jeevan.b@intel.com>
 <da8087b8-24f0-4b32-8a7e-d11706aae6b7@intel.com>
 <DM4PR11MB63128ABA9CEB2F69C455FEDC90F72@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <DM4PR11MB63128ABA9CEB2F69C455FEDC90F72@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0237.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ5PPF0FD67B0BC:EE_
X-MS-Office365-Filtering-Correlation-Id: 04871075-a11c-4c85-21d8-08ded67bbcae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|42112799006|366016|23010399003|3023799007|22082099003|6133799003|5023799004|4143699003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: h80EELSB6hr2TlLNSDhn8gLGz+zq7Qo2DAy98m3WP8Sv5X1CguF+Ce/UOaX7ms6zpHx3qldCKeuKzBaJGqzd5OU4O2Sk18i/KZiUoBan8SauuKd5y5R6xcml7MEk5s7I0Emm5H7Zj3hSlJk2kEB2vDpUEYH4HP6S8uotp50e/DkuJTaAjZHLvVFBXju4jEmUyPkSjCaAGS8KBl6y+dtTJ9gnq08BZuWG4WCOc8oDL1WwcM2zABTl2z2kycybtK/y4JQuq41rK18wYeKwK5lqNxNMF2XEAhO3Oh6AIA3JkBNpsuiw65V3rsZJhxdt6/LWUg2A9ZcbWhhSmSKi24G/e5GMTXjoduyNADfem/pGAF66Hz/AvinbXOgo2RVXGpFzFKDLZrGfZh7xprmk795EiER/EzC8e5YYVwZG0a2tyG75dZZh6bFxkfesUNbc5NYgrZXJkjFJdiRgETFqqFOQABNwrv2Wog3s4rqPLfIgoi1Rupi6xFb3uiQSxe9e1tQDTDZ6wD84iMCBqBsy88FwoETFQhn/DdBw4sDq6vZ6y9nLzkP6r2jstc9obkiClfN5g6OVRX8cMN9FZP4LDfOt8vdL6JsYHcdlmAw8+zAcXllIylV1lqCmxqxG7tIM884gRt9ypXUBMmEvFGVqJ8OUEmAYst9ZShSn0A52R+isFnY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(23010399003)(3023799007)(22082099003)(6133799003)(5023799004)(4143699003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1Fqdm1NTjU5enhVcEhVVFdpbFFjZE1mY3A1Tk5od2pGVEJuQXdjdkxaQ1h1?=
 =?utf-8?B?cFROT0ZzemJlWkt6UmZmeVJZL2lPSndrSGY2VVZWVGdaenNTYysvN2VjRDR5?=
 =?utf-8?B?SDg1ZHJ2NEwrV0R4a0hhS216VVZtRDZGL1ltdlhIUHJxYTRQdEticmt2bTVL?=
 =?utf-8?B?UHN6K01iQWdUWVh3RXVZR29PS0UwUnlWb3BnRVZFaFRaRVJHVi9FbmJBQktN?=
 =?utf-8?B?QVlqOGNpUCtnaGMzQXpTbjEwSE5OQTNEK3V2T0xaZnZNK3RwbHVET01VY1BY?=
 =?utf-8?B?UlBVNlVZWXFSTmRNZWJYd0Q3Wk1HeEpOS1E1MkM3VHNVSTFlVGp3bnlNWXNn?=
 =?utf-8?B?SW5QVERFbThZMzFGeDZaTVlrVGptcmxZL1FCWW5rcndPVTY2NFpiRUhyOEti?=
 =?utf-8?B?Smo5RmpWSUZRR1dhMEFhOXpnSERRaGRsbXA2NUVDVldNWmt1ZlVHU1VXeWll?=
 =?utf-8?B?emIzbkY1bjJ3UitxcVJmakVEbld5Z3EzK0c2aVRITTAyaE5sVjlvV2Zpa0Jx?=
 =?utf-8?B?RUMrZlNtUmZPenFPbUFnaEV0NVJBSmNSTHFOSVc4dzhvREFremRhaFJET0hW?=
 =?utf-8?B?VVJSOW5mVHJZRHZtNlRVWmdldU42OEFIWGVybkVEVlVSaU5ZN3NpV2tCY0Ja?=
 =?utf-8?B?VnNSMk8xUy9WY1pUZ2lyNTUrdDRnU3lrTVQ0anUyRnBWR2Y0S3Z6cXJmbkRB?=
 =?utf-8?B?SGdRRmxnMENqaWdWSkg1SzJaeHhMTGpDRFVzVGl5OXh0aUNhc2VUQjZEVHJ3?=
 =?utf-8?B?SGx5Zk5sbUpFeDV5aTNJNlN1ZThqNjBVZ2dKTVc2M2FiMjdiUHBqK2FBK0xW?=
 =?utf-8?B?S1NKVWp5WllTeWRJTUZLaU0raUdUNEZBWXhXSXVna2N5b1hhbkV0WnJpYTVI?=
 =?utf-8?B?VWliM0VYeHFKOENWcWZVaHRSZEVVOTF5eEV6ZkFDYTk4MXMvNXYwSzNTT0wy?=
 =?utf-8?B?bkFQcHBBM1BGZmNDQjROelRvQXRpQXR6S3pFNDVHTkNtOVF1ckE3SzdWVUpq?=
 =?utf-8?B?VDZ0elh5cWljd0ZjdlRyRjkvRzR5YnRhdkxvclFGWEo2Tmo0d21lQkpVYXVZ?=
 =?utf-8?B?dVlBNGQ2L284NWxJSHdTd0tiS0FjV1p2dllpRmhyVVRnMzd4Qnh2OEtUSWY2?=
 =?utf-8?B?alMwUHp4SmFUMFVUc1RDU2NoUFppck1CTjNBcjl6WVBpR0JiZDRXMXdVbVBw?=
 =?utf-8?B?Z3RDMWw0UUI5MUxSZEJhKzZjNnBLbDlENzVteTA5OTVneHJwdm12aG9HZ0ZM?=
 =?utf-8?B?QjdXUnJJVmNTRlk1c1dUdUl1SDV0RDgyQ2UxRGNvbGpBSjY5WXBObmFmMkN4?=
 =?utf-8?B?dHFIQWU3RDBTSW9QZW50ck1qK21EVXl0SC90c0hnU1Q2K0oyMVFZRGZqMkkz?=
 =?utf-8?B?QlI3em5GQnh1T0NTd08ycUJqNHQ5NW0rOTlmYmFWZEJLSDdiSW83R2N0bkkv?=
 =?utf-8?B?TE13bUhUZjlPSTRXMkM5OGxuanA1aDVOWVRSUytzNGJ6ZDZxWi9MRkdETEYx?=
 =?utf-8?B?bDlYdllCT1pndElnN2hCVXhqVkNUa3JYUWlaamNBMFl2ZTBBblIyZXpXemgw?=
 =?utf-8?B?ak1NVDBKcEExMkF5aERUQXlmcCt5Ui9LaGcrRGdGbjdxRmkyelpFdzUvUDUv?=
 =?utf-8?B?SWtBVTdiZlphdkhhV1JEVUJySHJNcE0rd2lQRFI5RDhHRDJpNUxIRzdnUGtk?=
 =?utf-8?B?TFZCRG5sdDhDejIwdklOUm9nOXRqeEF3N1B0ZVNxUUZUbi9KT3huUEtIVkRY?=
 =?utf-8?B?eUxkZVJTc2pId0x6ZE5RTS8wYmNmaWRRWlloc1FLZnNvTUxMLzYwSVJGbHJO?=
 =?utf-8?B?TTRiVkhlTVRJbVFHRW0rRXIzcmFKaEluaG1lWGJvMDlrdEFNb0g2OVBxejVq?=
 =?utf-8?B?TlBvVGdQKzhDcnpwNlRYK2JpcWtVVmd6RVhTY3VxQkN2T29jRk52M0w3c0ds?=
 =?utf-8?B?T1NOa0FpaGtzUWFBT3B0SjVpZC9EbkVSYXZHTGxVWWMzUWZTSmMxVm4rcitz?=
 =?utf-8?B?cmFtUU1kcjVvU3JYd0QzczNFK3c4R2ZKL3dVaU9lY3djdm0vczRsaS84bFlp?=
 =?utf-8?B?NzB5M21XQVArelhMZzNrRzQrM2dsWitlNFp5bXkwYWxRcysremdxYndpb2xs?=
 =?utf-8?B?Wk5INnpUZlBFc0lOV2U2ZHp2UlYwa0FraVFXRGhzT3hjMkNBTGlMdFJNV0Jy?=
 =?utf-8?B?VDVHWTdMRkNtYW1vWkJBY05YdTRHZTVVTHB3WjZRczR5VmU1OGM4dmkxVStq?=
 =?utf-8?B?T3J1TDJBVE5zZ0p4NFNnb25GV1NLMkxZT0pndzJNNk9aRldkRzVrQ0lIaXBr?=
 =?utf-8?B?dU5mME1mZlUydXFnSmh5WFVuSFA3eE5FbnpoZ3pEc1VZZTNIS2Nrdz09?=
X-Exchange-RoutingPolicyChecked: MM2Jej4fJes3Mrl/sOoQ8g1HyYjhwAkMaxSxv/hCTZPzrmbEOsUfMvHSog7q0T1HcnVL/UONVWSKBCt8nOiBtgqwN+jj6u1B3p6dh30/L0pSxAZBsPsul4HIxYHTn/jb4lIW7JywCyd6g7vkYDBHmcPgSvnHH3E0+1GQ2syH1bznS1e3PfGeG+famIBwHbrpOjN+oEQy8HxnoUDodi3KcGGbFX1pykU4QS2nqAFCWjnkTgwuNS9Fg2FG+AoiriWnhqqWePlzDUTcbUbELCjcXpFCFlt+iIw+fXKnZ9VIheKk5E/e1mA5/fB6IwerULa0pP42uWBjjAI7ViMJcQf/Kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 04871075-a11c-4c85-21d8-08ded67bbcae
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:46:47.1697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyytX9qAaOlVwbeB+PQQNIlFQox9kNQhbO26gGLg0MSdBWoilahadGMzwUqDWrVJ3w2WGVM42rGxMiulVkQbBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0FD67B0BC
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


On 6/30/2026 11:26 AM, B, Jeevan wrote:
>> -----Original Message-----
>> From: B S, Karthik <karthik.b.s@intel.com>
>> Sent: Tuesday, June 30, 2026 9:10 AM
>> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
>> Cc: Samala, Pranay <pranay.samala@intel.com>
>> Subject: Re: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
>> suspend/resume audio tests
>>
>> Hi Jeevan,
>>
>> On 6/29/2026 5:31 PM, Jeevan B wrote:
>>> Add test to validate audio works after suspend/resume on HDMI/DP
>>> connector.
>>>
>>> v2: Perform a single suspend/resume for all audio combinations.
>>>       Re-enable chamelium after suspend and separate pre-suspend
>>>       and post-resume validation paths for clearer failure diagnostics.
>>> v3: Drop commit and use igt_assert_f with explicit messages to
>>>       distinguish failure in audio tests.
>>> v4: Updated test to avoid false-pass on zero executed configs.
>>>       Replace post-suspend forced re-enable with connector
>>>       re-probe/connected checks.
>>> v5: Remove unused variable and add chamelium_assert_reachable check.
>>> v6: Skip suspend/resume subtest when pre-suspend audio validation fails,
>>>       and update suspend subtest descriptions.
>>> v7: Update fixture handles cleanup regardless of skip/assert.
>>>
>>> Signed-off-by: Jeevan B <jeevan.b@intel.com>
>>> Reviewed-by: Pranay Samala <pranay.samala@intel.com>
>>> ---
>>>    tests/chamelium/kms_chamelium_audio.c  | 158
>> ++++++++++++++++++++++++-
>>>    tests/chamelium/kms_chamelium_helper.h |   3 +
>>>    2 files changed, 160 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/chamelium/kms_chamelium_audio.c
>>> b/tests/chamelium/kms_chamelium_audio.c
>>> index df8d27c0c..e3c0e4b86 100644
>>> --- a/tests/chamelium/kms_chamelium_audio.c
>>> +++ b/tests/chamelium/kms_chamelium_audio.c
>>> @@ -52,6 +52,12 @@
>>>     * SUBTEST: hdmi-audio-edid
>>>     * Description: Plug a connector with an EDID suitable for audio, check
>> ALSA's
>>>     *              EDID-Like Data reports the correct audio parameters
>>> + *
>>> + * SUBTEST: dp-audio-after-suspend
>>> + * Description: Verify audio works after system suspend/resume
>>> + *
>>> + * SUBTEST: hdmi-audio-after-suspend
>>> + * Description: Verify audio works after system suspend/resume
>>>     */
>>>
>>>    /* Playback parameters control the audio signal we synthesize and
>>> send */ @@ -695,6 +701,66 @@ static bool
>> check_audio_configuration(struct alsa *alsa,
>>>    	return true;
>>>    }
>>>
>>> +static bool run_audio_test_once(chamelium_data_t *data,
>>> +				struct alsa *alsa,
>>> +				struct chamelium_port *port,
>>> +				snd_pcm_format_t format,
>>> +				int channels,
>>> +				int sampling_rate)
>>> +{
>>> +	struct audio_state state;
>>> +	bool success;
>>> +
>>> +	audio_state_init(&state, data, alsa, port, format, channels,
>>> +			 sampling_rate);
>>> +	success = test_audio_frequencies(&state);
>>> +	success &= test_audio_flatline(&state);
>>> +	audio_state_fini(&state);
>>> +
>>> +	return success;
>>> +}
>>> +
>>> +static bool run_audio_tests(chamelium_data_t *data,
>>> +			    struct alsa *alsa,
>>> +			    struct chamelium_port *port,
>>> +			    const char *audio_device)
>>> +{
>>> +	bool run = false;
>>> +	bool success = true;
>>> +	int ret, i, j;
>>> +	int channels, sampling_rate;
>>> +	snd_pcm_format_t format;
>>> +
>>> +	for (i = 0; i < test_sampling_rates_count; i++) {
>>> +		for (j = 0; j < test_formats_count; j++) {
>>> +			ret = alsa_open_output(alsa, audio_device);
>>> +			igt_assert_f(ret >= 0,
>>> +				     "Failed to open ALSA output\n");
>>> +
>>> +			format = test_formats[j];
>>> +			channels = PLAYBACK_CHANNELS;
>>> +			sampling_rate = test_sampling_rates[i];
>>> +
>>> +			if (!check_audio_configuration(alsa, format,
>>> +						       channels,
>>> +						       sampling_rate)) {
>>> +				alsa_close_output(alsa);
>>> +				continue;
>>> +			}
>>> +
>>> +			run = true;
>>> +
>>> +			success &= run_audio_test_once(data, alsa, port,
>>> +					      format, channels,
>>> +					      sampling_rate);
> Thanks for the review:-
>
> This is already being printed in audio_state_stop()
> "tests/chamelium/kms_chamelium_audio.c +1038"
> if (success)
>      log_level = IGT_LOG_DEBUG;
> else
>      log_level = IGT_LOG_CRITICAL;
>
> igt_log(IGT_LOG_DOMAIN, log_level,
>      "Audio %s test result for format %s, "
>      "sampling rate %d Hz and %d channels: %s\n",
>      state->name, snd_pcm_format_name(state->playback.format),
>      state->playback.rate, state->playback.channels,
>      success ? "ALL GREEN" : "FAILED");

Thanks for the clarification.

Regards,
Karthik.B.S
>
>> If we do need to run all the possible formats even if one of them fails, then
>> IMHO we at least need an igt_info/igt_debug calling out exactly what format
>> failed here?
>>> +
>>> +			alsa_close_output(alsa);
>>> +		}
>>> +	}
>>> +
>>> +	return run && success;
>>> +}
>>> +
>>>    static const char test_display_audio_desc[] =
>>>    	"Playback various audio signals with various audio formats/rates, "
>>>    	"capture them and check they are correct"; @@ -762,8 +828,10 @@
>>> static void test_display_audio(chamelium_data_t *data,
>>>    			sampling_rate = test_sampling_rates[i];
>>>
>>>    			if (!check_audio_configuration(alsa, format, channels,
>>> -						       sampling_rate))
>>> +						       sampling_rate)) {
>>> +				alsa_close_output(alsa);
>>>    				continue;
>>> +			}
>>>
>>>    			run = true;
>>>
>>> @@ -789,6 +857,75 @@ static void test_display_audio(chamelium_data_t
>> *data,
>>>    	free(alsa);
>>>    }
>>>
>>> +static const char test_display_audio_suspend_resume_desc[] =
>>> +	"Verify audio works after system suspend/resume"; static void
>>> +test_display_audio_suspend_resume(
>>> +				chamelium_data_t *data,
>>> +				struct chamelium_port *port,
>>> +				const char *audio_device,
>>> +				enum igt_custom_edid_type edid)
>>> +{
>>> +	struct alsa *alsa;
>>> +	igt_output_t *output;
>>> +	struct igt_fb fb;
>>> +	drmModeModeInfo *mode;
>>> +	drmModeConnector *connector;
>>> +	int fb_id;
>>> +
>>> +	igt_require(alsa_has_exclusive_access());
>>> +
>>> +	igt_require(chamelium_has_audio_support(data->chamelium,
>>> +						port));
>>> +
>>> +	alsa = alsa_init();
>>> +	igt_assert(alsa);
>>> +	data->audio_alsa = alsa;
>>> +
>>> +	igt_modeset_disable_all_outputs(&data->display);
>>> +	chamelium_reset_state(&data->display, data->chamelium,
>>> +			      port, data->ports,
>>> +			      data->port_count);
>>> +	output = chamelium_prepare_output(data, port, edid);
>>> +
>>> +	connector = chamelium_port_get_connector(data->chamelium,
>>> +						 port, false);
>>> +	data->audio_connector = connector;
>>> +	igt_assert(connector->count_modes > 0);
>>> +
>>> +	mode = &connector->modes[0];
>>> +
>>> +	fb_id = igt_create_color_pattern_fb(data->drm_fd,
>>> +					    mode->hdisplay,
>>> +					    mode->vdisplay,
>>> +					    DRM_FORMAT_XRGB8888,
>>> +					    DRM_FORMAT_MOD_LINEAR,
>>> +					    0, 0, 0, &fb);
>>> +	igt_assert(fb_id > 0);
>>> +	data->audio_fb = fb;
>>> +
>>> +	chamelium_enable_output(data, port, output,
>>> +				mode, &fb);
>>> +
>>> +	igt_skip_on_f(!run_audio_tests(data, alsa, port, audio_device),
>>> +		      "Audio test setup failed, skipping suspend/resume audio
>>> +test\n");
>>> +
>>> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>>> +				      SUSPEND_TEST_NONE);
>>> +	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
>>> +
>>> +	/* Re-probe connector state after resume instead of forcing a re-
>> enable. */
>>> +	drmModeFreeConnector(connector);
>>> +	connector = chamelium_port_get_connector(data->chamelium, port,
>> true);
>>> +	data->audio_connector = connector;
>>> +	igt_assert_f(connector->connection == DRM_MODE_CONNECTED,
>>> +		     "Connector disconnected after suspend/resume\n");
>>> +	igt_assert_f(connector->count_modes > 0,
>>> +		     "No modes available after suspend/resume\n");
>>> +
>>> +	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
>>> +		     "Audio test failed after suspend\n"); }
>>> +
>>>    static const char test_display_audio_edid_desc[] =
>>>    	"Plug a connector with an EDID suitable for audio, check ALSA's "
>>>    	"EDID-Like Data reports the correct audio parameters"; @@ -854,6
>>> +991,9 @@ int igt_main()
>>>
>>>    	igt_fixture() {
>>>    		chamelium_init_test(&data);
>>> +		data.audio_alsa = NULL;
>>> +		data.audio_connector = NULL;
>>> +		data.audio_fb.fb_id = 0;
>>>    	}
>>>
>>>    	igt_describe("DisplayPort tests");
>>> @@ -866,6 +1006,11 @@ int igt_main()
>>>    	connector_subtest("dp-audio-edid", DisplayPort, &data,
>> test_display_audio_edid,
>>>    			  IGT_CUSTOM_EDID_DP_AUDIO);
>>>
>>> +	igt_describe(test_display_audio_suspend_resume_desc);
>>> +	connector_subtest("dp-audio-after-suspend", DisplayPort, &data,
>>> +			  test_display_audio_suspend_resume,
>>> +			  "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
>>> +
>>>    	igt_describe("HDMI tests");
>>>
>>>    	igt_describe(test_display_audio_desc);
>>> @@ -876,7 +1021,18 @@ int igt_main()
>>>    	connector_subtest("hdmi-audio-edid", HDMIA, &data,
>> test_display_audio_edid,
>>>    			  IGT_CUSTOM_EDID_HDMI_AUDIO);
>>>
>>> +	igt_describe(test_display_audio_suspend_resume_desc);
>>> +	connector_subtest("hdmi-audio-after-suspend", HDMIA, &data,
>>> +			  test_display_audio_suspend_resume,
>>> +			  "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
>>> +
>>>    	igt_fixture() {
>>> +		if (data.audio_fb.fb_id)
>> This check is redundant and already checked inside igt_remove_fb. Please
>> remove this.
>>
> Will remove this.
>
> Thanks
> Jeevan B
>> With the the above 2 updated, patch LGTM.
>>
>> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>>
>>> +			igt_remove_fb(data.drm_fd, &data.audio_fb);
>>> +		if (data.audio_connector)
>>> +			drmModeFreeConnector(data.audio_connector);
>>> +		free(data.audio_alsa);
>>> +
>>>    		igt_display_fini(&data.display);
>>>    		drm_close_driver(data.drm_fd);
>>>    	}
>>> diff --git a/tests/chamelium/kms_chamelium_helper.h
>>> b/tests/chamelium/kms_chamelium_helper.h
>>> index 606079666..65c6067db 100644
>>> --- a/tests/chamelium/kms_chamelium_helper.h
>>> +++ b/tests/chamelium/kms_chamelium_helper.h
>>> @@ -81,6 +81,9 @@ typedef struct {
>>>    	int drm_fd;
>>>
>>>    	struct chamelium_edid *edids[IGT_CUSTOM_EDID_COUNT];
>>> +	struct alsa *audio_alsa;
>>> +	struct igt_fb audio_fb;
>>> +	drmModeConnector *audio_connector;
>>>    } chamelium_data_t;
>>>
>>>    void chamelium_init_test(chamelium_data_t *data);
