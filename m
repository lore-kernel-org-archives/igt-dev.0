Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCB7CC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 18:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A8F10F969;
	Tue, 13 Oct 2026 18:40:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F2710E9AE
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 18:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791916790; x=1823452790;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rYQ0FeVMqbPGNcOMyt0TcaXGm3q4rl94Y36ScCqanQw=;
 b=P0zhaAlo4vrGzFKzDLsy2BDE8gvLOEOFm9Vsz01UWDQ6nKnAKqKc76S3
 I6h329QHXx/MtNy3/yc65qyJnKN4zltZG597FlVIlGS863sWMDA6X+8XP
 hfU6Ti3N9RtM19p0kg5rwk+WfdDWr6Ry41sPFdzqFsSlwUFLZLQN4zAxK
 7Gt2h8YdTAmuyjWrMRQwEH/V/oeGeG1ZXT5lFXNvgazoHs1OH2qcC82cL
 dzZwVMFfN0z5mFgDNpJISsTv0/DppMafiEC8YikwdqJG5PE/V0a44MsEw
 UQaPoRYrXztAw5rCnBY66rso7MlLmzsbHxm9kG8z51U/DSh+oajWXFSgl A==;
X-CSE-ConnectionGUID: f1cjL+SzR4+7RWiLJv6HgA==
X-CSE-MsgGUID: NIgeOklHTE+umvhM31sq4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="553691"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="553691"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:39:50 -0700
X-CSE-ConnectionGUID: VvTZ9wxFReCA4CrIOYHjdA==
X-CSE-MsgGUID: 55D7zHI0TjqvaPwqKZ7h1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1570298"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:39:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:39:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:39:49 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.29)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:39:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N59OaHAfq0xiIIlEO4m1uViID4MCnIhKpzeaGTUIjEJOw9gk8R9Kopkk3pSSF3AB4CwCaoAe8s9YO0fozS0mI59FPGPXV7g3OOnSG6arP/X2EL9/9KAiUQxRQnLU+FwPT3VPCfljfQv3RWF21bmr8HZlPPHaImZ1f9F289QBIFupiAsGq2Sskf4DYSgMb6exCc/WguqIsE+XesDYs2T+Q7KKvIYhWQzBsV6CNSn4To62CP1wc90FneV+TlMZ1lS15/G4h9/k9J9QohzeJfYeHCc1Bv90ixhmkYIeur0PH52JYyONtTRsq/gKTVYvsU7GyaAA7IO1RhgxXGzIJ5ioJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4B+puHlqEgB0TF++bETzmRzBD5dLM/Twe+rLcqwJDZs=;
 b=pHzJk2e/wkIgO8sO9JeGqQXkpoQ+zzr1+iBBHl5nWNPWuPoQ3EnisQphEpDRXAoyFdI+SFj3M0PAN8OvUq65cqducMRejzilseev/aHKWxlNd0MzihBSez0RwXSNJ3JSjDKpMkfL39JvmfOT62Sb4bkSXNzdPZtTyuymVvMu3FVR+LoEAsVS2M4tOpWPUDf2DqLfvZoXfXkrmV1fehbd1YxFvKjGSYTOhY2U5UHiw2sdsS6RIOBQkrXXta/aBMdDWK0QDpecHqF0vpiXlC5nO8/KF7CKxJ96jf/O6MBegbS508DA05ViOYjdH+gYjIGnkj8LrhoPe8klPAq4LXMKJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by SJ5PPFF330187AB.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::860) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 18:39:43 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429%5]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 18:39:43 +0000
Message-ID: <1f2844aa-cb5c-4c77-bfbf-a8e473698ea5@intel.com>
Date: Tue, 13 Oct 2026 11:39:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/2] lib/igt_core: Check if helper proc was alive before
 kill()
To: Gustavo Sousa <gustavo.sousa@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20261007-stop-pw-reserve-v1-1-abbd3b879612@intel.com>
 <583c175f-9c84-4069-93f9-ec1a76cafd67@intel.com> <87o6cxa3ig.fsf@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <87o6cxa3ig.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0348.namprd04.prod.outlook.com
 (2603:10b6:303:8a::23) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|SJ5PPFF330187AB:EE_
X-MS-Office365-Filtering-Correlation-Id: 339a02fc-480e-4c4e-0dab-08df295958e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|22082099003|56012099006|18002099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: srz0Y25RyLVnJPIng/17Fi4m2HOic9mfQ1LWK/dvMiDqGc9flpAOCEsKJgXIZnYTSGlrqU9m0QerDexWI/oZTaffv3KBOPUmoLYwvQizzb0uhtSghy2e/+ZbrWICeelOlnYNFTePh/QGlDHMKMkmuhLNzkOBXzmYN/FTLkZceWd7zXYkCJBVbrvJ5f3t3NYAVLNW1JaAuNBPGMmnyPWpc9N4H9SqdkLvtmssRq0JNejlWbAKxk1zdzM6FoS0xMrwnzSi6Hkln8PlWHnZVHe+16bu28MRKqM3FDJX3Ow4sCQoDR9HWmrmKNBJmgu5TbWQwkL3d6d4mgh0MdY8dalEH0d57ioteNmQl56oF/VF3NMGnVCptVeBDvryz0IaDl0w1ANEdQtr7R1YBDhHZATzlbdbg6ulpTbL7Y6/N40VYPbMVoEYajz/csKfpxN9g41RkS/Ejb+FYv6q0USUO6Sv3agrnqWY7uA0D4HM6SFP+o6QsCDPcusMGNQbDNfrdKoHf6hSiWLcDXG61QWk4GTEfhraYvCEWHA88LBFuElh3D2No35Hm00TdPAM/jXqKjnWOyPniLwgw093OfML6VZCH2VYdwvSNuw9T8QX9aFXqqHDfV5aFe2U40SmqGtU9YFgprTswk9cVe9jT2LUJSO7mJQMk8ncGshnjxAH7do17aQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(22082099003)(56012099006)(18002099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEUvcVhZb1pDV1RHSUxoa05SOTNSclErYjJRUzBRWkdwYkVUZ0pzeEZEVlZx?=
 =?utf-8?B?d3RRNmlnQjFQL0J2YjFpeVR4c3E4c0xjd0JhbG1Dc00xazQ1aHlKSHZpTXVr?=
 =?utf-8?B?cUU0b3FwdzZEdGJEckM1ZXdQQnQ3ckdvZExObjUvb0M1elJtNWNCRWtSMUJz?=
 =?utf-8?B?MHpkTU9uTk5RTEE1SzNndEprMnBxSGo2Q01RWjBtVHArVGJ6Q3dWVEhJaktj?=
 =?utf-8?B?cTVXeE5Pd3p2dVFGYm9HMUc5M0RycUlKWHp3bTMxaGdJcDVzTk1IYnBycFcw?=
 =?utf-8?B?T2pxdUxsMXFNa1d2QXc2eWNWZFFWQXJHZDhZTkY3eXBhdiszL3ZteXh4V2Rk?=
 =?utf-8?B?d2NjMzVRUVgzMGZsWGhXYnRrNHRXZVhFT1JnREg2QVZvWjhXdTdPT295akZI?=
 =?utf-8?B?SkM0dmhWd1I4UHNPcFM0aVhhZFUzbUMzTDdrYm5LY0tnci9HN3VDd1NLMDFD?=
 =?utf-8?B?b2YzcnZlMEdoem5KaTVhK1h3Mnh6K1ZPNVEyckNRS3FVUktaK1dqRHdHYzZn?=
 =?utf-8?B?S2tVSERhK3Q2WGE2QjUreno3V0JwL0pKTVBSMlFtZ1loV0EyL0dzSDdQQjBS?=
 =?utf-8?B?NWVUTjIwS0Q3cFhMVWFoSDNWemZVU29YZVJVMXErUFZxZmdjcEVBbDhqV3dZ?=
 =?utf-8?B?OURMcVZ0SzUwQ0F1UkpKenZFSC9vVEtpZzFWRkNYTDJXSy85cEhDZVRrbGtS?=
 =?utf-8?B?OHJndmpUUk5yTi85QlM5RXhXUEZBd3lWNTJnK0FaamVLQnovTzUycWpqUzlX?=
 =?utf-8?B?VEI2WDdRU2ZJZ1NBZkh6OGFmVHo3eDZQa0JoMzNvOHFTd250U1Vmb1pJcFdz?=
 =?utf-8?B?OWRNS0Z6WExwNThtSUkvSkFxWW5ObjNFcXg2L0paZ2NwTlFwOWNPRktKNVZC?=
 =?utf-8?B?N09WRGFzV0ZzV1lXSHV5WDJlTCtUcXdSWUlpVjZ0eWVzYTJtRHFKV3JHVE80?=
 =?utf-8?B?S3pMZXhxNkhrQ1RXUmptQkhlMWZvVnJhMStZQzdyV01GV25TMHFqMklUdWZT?=
 =?utf-8?B?S1BIRmJXWlozOHg1bURtWUp5aWEybUgyK1ZqTDZwQXkraU9yMEIxMG41QmJq?=
 =?utf-8?B?YTFHdEUrQUxPc0FMOWtmTjdNRnRVSzRKQW1mS3ZEUUVjbDBKVW1pVmNSWGpT?=
 =?utf-8?B?dG5id21Xcm1heUhSOThIWElpaEQzS2llNzYydXZQNHZ0d1pxSVp4MWFpaUYv?=
 =?utf-8?B?MEY3dzZOR3J1dUVpZnJXa2VrNGNOYVR5TjVhdSttc3FvY3NWQklmaDlDeHRO?=
 =?utf-8?B?TEQxa091K2V4ZlJIdm5lWFptYTBVREJ3VjU5OU1CaE9EMVpncEcrMEhUMW1M?=
 =?utf-8?B?QldPTXFNcDBwYnFJVnYrejVvbDVTZFh4QWg5alBoTzAyZmp1eCtadUFEZ3lx?=
 =?utf-8?B?dWJDREpyL2M2K3hGM0JmQ0xwaE9RUnlnYlNvZHF4cWtuMStyR3FtTXRrK0hG?=
 =?utf-8?B?SVliNi9ob0d3cWZBSjlZMXlJZkZiY29iV1pqcHNmc2pRQUJVR2VDWE8yRkNW?=
 =?utf-8?B?TXBiMkt0bzZQNHNhb0dmMDZWY2J1a05hbEtKUWw5VnVESEVCNitpYUJIclZw?=
 =?utf-8?B?WUxCSXpPOTJkUDN1TnlYeFRqNW56UmM3MHZXellaMERtTVIycEJveUZnSDFr?=
 =?utf-8?B?R2lOTzl0MDZaOWRpR1BleG1lOWRQejVZOVhMMWtzdlBmN1VtZXBZN2MvOXI4?=
 =?utf-8?B?QVBxaXNISFFFSXhxWlNQM0lBd3dab0l0NW04RGM0UmRGSTdrbWpNR3VUekg2?=
 =?utf-8?B?Qnl4cFBqUWVHMWIzdDQ3L0pPRXBZM3UxSldHUVM2aFZkREkwbVNySTBMbk55?=
 =?utf-8?B?b2hUL0ZVMWU5VlB2SEVnYnZFRFJSV3N0WGhpRmlCYmwvTUZSNG1TcWRPZUZV?=
 =?utf-8?B?MXFhS084V3l4MThKU3ZRVGdMVVhkamFTVmRLOHNNUHRmME41SUdLWDY5WmhI?=
 =?utf-8?B?dFA4aVMyaFZkNkpZa09jck1hVkp5SmtLRlgxMW9GdHFVWElmSkR1ZWxtc1RZ?=
 =?utf-8?B?eGNobjRCeEtaSGFvZ1AyeFUxc1FOV0pUdVJLdk9samRYdE93SkZoZTBld2xP?=
 =?utf-8?B?d3lxMkMyT0JOQU5pZVRGcEZrQ25pOGVCc2VtN2plMlhWZjZId0lnWE1UQkEy?=
 =?utf-8?B?bkZIU3NzVHZxY0F4eTdETGROYmoyb3pDaEplMTNRUmNwcVo2dUtVNlRGRjVZ?=
 =?utf-8?B?YUJiRGNYOE11K3NIQlY3bEdpYmQwNDZTajZLR1pFMXV5amJ2cHBYY1Ztc2tJ?=
 =?utf-8?B?bnl4NUNJSGFuWmhOUWlUUDBEN2hCcURuKzN2NTdMUHZUZnlwQ2VvYzN6QXlp?=
 =?utf-8?B?bUlkb0I1YU12WTI0MFFYTzJ5bUo4OWxtNWFjb2Q1ZmZjdVM3ckxZWUx3Z1Rt?=
 =?utf-8?Q?Mf/QFRFpjZiWtb6Q=3D?=
X-Exchange-RoutingPolicyChecked: tQTnKnTL0BLkW9XOcJO5R03mGATMXCG5qneMMyzozB8pAajafGbi8rNwU24wLtPq8kM+qxGYuJlZrOPqpsWcLtutGK0mfWBMEo49snWjvQkTOKDY02S0mLRSIA2mhNvL70TVnrXfT3bUfFrl522SPn/1SSx34HBBpEYm74a8o7gH3KxSS/ND/FUxJ86QKquFrJHQCV3vbbFnllPb8Xla6BBS7WIoZAN2aNoNN7+82mKtoIys9L0S+LsEVqk+WykO9iNDcwxOjcmbHH+S/5a789n8n1/grNF0eCWWMeFjFHKvh+GVWBwVW3fhf/4fUjne0Q5Qw0GXNHaPr7LX0XJYBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 339a02fc-480e-4c4e-0dab-08df295958e3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:39:43.1653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqD3G4v7Wk2+kNanZYRZlHtfDyVkooCcTQ7Uj4d/TqKC1bb+R1jpxbzGmTy4Xxw/7APtnONWu5GtFS3k5lYuLCG9qiLDG5Zy0KeI3g71yJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF330187AB
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


On 10/13/2026 10:56 AM, Gustavo Sousa wrote:
> Daniel Charles <daniel.charles@intel.com> writes:
>
>> On 10/7/2026 7:16 AM, Gustavo Sousa wrote:
>>> The function igt_stop_helper() does a sanity check by verifying if the
>>> helper process died "too early", however it does that by checking if
>>> it was terminated due to not handling the signal used in the kill()
>>> call.
>>>
>>> That logic has a flaw though: it the helper process gracefully handles
>>> the signal sent by kill() and exits normally, igt_stop_helper() will
>>> mistakenly take that as dying too early, because WIFSIGNALED(status)
>>> will be false.
>>>
>>> That's the case with the pw-reserve process: in an upcoming change we
>>> will change pipewire_reserve_wait() to call it with execlp().  Because
>>> it handles SIGTERM and exits normally, a warning and assertion failure
>>> would happen with the current logic.
>>>
>>> Fix that by checking if the process was alive before calling kill().
>>>
>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> ---
>>>    lib/igt_core.c | 20 +++++++++-----------
>>>    1 file changed, 9 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/lib/igt_core.c b/lib/igt_core.c
>>> index 8ee9432923e6..d9949ea131f8 100644
>>> --- a/lib/igt_core.c
>>> +++ b/lib/igt_core.c
>>> @@ -2652,13 +2652,6 @@ int igt_wait_helper(struct igt_helper_process *proc)
>>>    	return status;
>>>    }
>>>    
>>> -static bool helper_was_alive(struct igt_helper_process *proc,
>>> -			     int status)
>>> -{
>>> -	return (WIFSIGNALED(status) &&
>>> -		WTERMSIG(status) == (proc->use_SIGKILL ? SIGKILL : SIGTERM));
>>> -}
>>> -
>>>    /**
>>>     * igt_stop_helper:
>>>     * @proc: #igt_helper_process structure
>>> @@ -2670,17 +2663,22 @@ static bool helper_was_alive(struct igt_helper_process *proc,
>>>    void igt_stop_helper(struct igt_helper_process *proc)
>>>    {
>>>    	int status;
>>> +	int ret;
>>>    
>>>    	if (!proc->running) /* never even started */
>>>    		return;
>>>    
>>> +	ret = waitpid(proc->pid, &status, WNOHANG);
>> put waitpid in a do/while loop to catch any EINT return that may need a
>> retry.
> Do you mean EINTR? EINTR would happen only if WNOHANG was not passed in
> options.
Yes it was a typo  and you're right on WNOHANG according to [1]
>
> This call is to check if the child process was still alive by the time
> we are about to kill it.
>
>>> +
>>> +	if (ret == proc->pid)
>>> +		igt_debug("Helper died too early with status=%d\n", status);
>>> +
>>>    	/* failure here means the pid is already dead and so waiting is safe */
>>>    	kill(proc->pid, proc->use_SIGKILL ? SIGKILL : SIGTERM);
>>>    
>>> -	status = igt_wait_helper(proc);
>>> -	if (!helper_was_alive(proc, status))
>>> -		igt_debug("Helper died too early with status=%d\n", status);
>>> -	assert(helper_was_alive(proc, status));
>>> +	assert(ret == 0);
>> This assert can be moved before kill call to make sure the correct
>> process is killed.
> Hm... This function already assumes proc->pid is the correct process to
> be killed.  The objective of the waitpid() call above is rather to check
> if the process was still alive (the expected scenario).
>
> If we move this assert() to happen before the kill() call, we risk
> leaking the process, because an assertion failure would keep us from
> killing the child process.

The process will be already reaped after waitpid if it returns the PID, 
then kill may signal a different process that took the same PID.

So call kill only when ret == 0 ? and keep the assert in the current place.


[1] https://man7.org/linux/man-pages/man2/wait.2.html#ERRORS

-- 

Daniel.

> --
> Gustavo Sousa
>
>> -- Daniel.
>>
>>> +
>>> +	igt_wait_helper(proc);
>>>    }
>>>    
>>>    static void children_exit_handler(int sig)
