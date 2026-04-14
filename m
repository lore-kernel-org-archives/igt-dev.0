Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E303F531EC
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 03:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195B810E103;
	Tue, 14 Apr 2026 03:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkYaADYb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC8810E103
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 03:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776137389; x=1807673389;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vTw8aUdM1vHFCWKA4zmej0w188SRK+6S1WxrskDBS1k=;
 b=EkYaADYb51v3vYSa7Tv77RzNZ1jC81ciXWLw26dJZqFIL3QAb82GcALz
 ppV2WghRwl3MNOqwkcy1izTvAxqCi1T6mz0x2pHo/o94gSp0yWBfTCBlm
 sfnqb9LjxOeI3y4e+kkt4jvkrDSE+2lwXWDDkWienlp+A84Y/w9NtRVwI
 4hpmPKfo9aGcMwtA1H3lTpkVMIxjmOFqG4Hb7yf73l8xSUC7sIXmSIhYr
 TGDDPAI8k9YS+LZiQp9GWjk1VmP3axOquXN0r3NuaCQiXhl7oJf+FFxAv
 dAk/kcV9Iz5YgnKyQVZ+hFonipmURkdKfhy9NZqkKHJhRsW6GMf6wGTZW g==;
X-CSE-ConnectionGUID: DKfvL90oTYWEPzyZxW5MPg==
X-CSE-MsgGUID: FU2j3UNrTZWtiH8wZiK6rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88465682"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="88465682"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 20:29:48 -0700
X-CSE-ConnectionGUID: hMYKQ3PRSXC1DRqVsHCmFg==
X-CSE-MsgGUID: B/LuSiORTguj8GMNG0Zzow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="267952911"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 20:29:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 20:29:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 20:29:46 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 20:29:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbAJcJDq5vvvxHbJcUxjJj9yP0tVNl3aSjQqVxDKP4mVF6ih7aLPahj39Kw8XQ8+i/07qsTjrTbzt8rXg3XxrB4qI2hnhLbmp9g/7d2VVUbw34qXxdEX0fiY3YaNWLNq7PYIiXyM5nFLOebTJ4c80LSDTizo3TWLKpAFKzqOQQAHSanZ2Hduuccf2K3CuZPNR+Qo7z6StwPIggWVqGN68cH6n7b17QHD04pSDqToJT4WilPcQR8fyzmLc9DTGreK5p8tfWQGGKr1LTjSRmafnVDbTacl/qiFWZ75Infsi0Rm1wIDHKe/dbiISH8xCdx5/B/OjRB+jvBgTwlJTFAVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jI3gvatSUmN4QJiKrIt8qFAfbU5ytkWPdeeLuwlZK4=;
 b=f7LoWg/+Taq4UERIQhFltM0fjXA2Q5WYyOjrMe9yf+sOqYAclwvwpSVwUedMz41kIuhz2Z5XClHyfeuuZxk7fVkC31AGJXh0djp1jmrgXvJLf3B2SEoZNTZyb7kMH+KsfZIMl5UNhFZ/pxW9ljBI7kwTMMRnJp3lgxOzsfk9yNpe22fbxl3XxY99AxldcqFZIUVoqKr8awOFBpLbYleRSrEFIfD3kst1ZRjZon5+DWgAobJk6CKWYsCwUCgI1NiXX5nGYo/7zH5gjg4YQespBKPG3Q19mduVhwC9HvT47Bi22PFQwOS+4u6UnpPfI4dkRpgWtTnf9C8h5/eg4LF5iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 03:29:37 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9791.035; Tue, 14 Apr 2026
 03:29:37 +0000
Message-ID: <a380ae2e-bd56-4652-b403-a646b67d13ec@intel.com>
Date: Tue, 14 Apr 2026 08:59:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/kms_pm_backlight: Setup output
 before reading writing backlight
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260407054302.1454584-1-suraj.kandpal@intel.com>
 <20260408050326.1569511-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260408050326.1569511-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0238.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::19) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SN7PR11MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7bb3a1-e433-449f-dcdb-08de99d60e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|376014|22082099003|56012099003|18002099003|20052099010;
X-Microsoft-Antispam-Message-Info: ABlL9XSpMpWQIrUhnCcFTmnmTDBfFUl+3HglRkbdQ7fEO8CZ56AAYtW9emb78DUJr4L+QMD+vqsM7Bd2nYBjYHBpezUc1Kmc8oF+laNJD83/i7JnYfRikKPLNNmlSWuPlMIBAdbmAemTowjjQZ6H7WfbVzOUdmiPYrUaQnikZ8Fl1ftJQVuBuT9H5QSYYKmurpioarI4LVfsxLkGA5CfIpSK0N8Nh0mBMku1sWC/JsHPTHJCaPHj2top/xrLPp3bZMmIkEXPj/0cx4VsQhcqOE4UAHrEcCXJl8+BQwsj1aO48RtOnwJVTvtG8uIZ1LGs1qsb3IUlbzPjq1yzPPCKruljbu+vkiYAs/QxQJgV4jQf+CSgYDESE7+dtMgZaEKpcjTzMYYbLcEsRuu4EWBzewf4CTEUYQAjfFaNr4CypBeLWHAUz+cBGtd8Lts+tN18eGiR31cqa4AdX019tnXRBWW0c+lCdPXfD+aABIbNXpskDEYZqLa91130tUV3xfxvXP9mJ85jJczIBNMrl6CKcl5A+wJC0DXPisO4fXeEiQi5cdDgIF1uDidU3mZI3ink9cCGbhkIbsU3rVxows5WpvEFpMpvWiJbNoctoQG+mD2+YfFOInQcZVqicPS8pK53TjElPtU2ClV3rm+Kimh0waUzahilPOu/QZ3TtkfIoE9jHlqpzH+6g8UL8kdLiyD/Uqn03TDgwcurqhPYqqvqzfWJhMlJPKnSMcwSdnPtIAg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(22082099003)(56012099003)(18002099003)(20052099010);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUpQNldsejdkRnZxcWFLR25XcXh3Z3NGY1pwUzJiUmQ4Myt3eEdZZ0htdFpG?=
 =?utf-8?B?ODlQRFhtaVJDMUU1SWljSGZKRVQvOWVkRDVVOUZLTnYyeDc5SFBHRHFnT0ZZ?=
 =?utf-8?B?cXJXc3lkUzBhdjA3NTA0ODJ2aGRORmM4M3QwaldMVnB1RnRLN0lCK2JPd0RP?=
 =?utf-8?B?NGRVdG5LS21DckZWalpRT0xTZTIrSGpVK2IvdnZsbEU2SllJMXh6R3hOWDIw?=
 =?utf-8?B?bFJtT3JDRzRtbVNaSFVCV0tyR0FiVWRxaFNsMmltQkdPS1ZpNVY4SHpLcVR3?=
 =?utf-8?B?eFVpemRhcDZJSzF2UVFpUnNFeFI5SVJiemR2dUNKdlF1YjAzWjQ0akJoZ3Ni?=
 =?utf-8?B?MmZUVENnRHpISUJCUk1BMjIvYkgxZ2plSTZyZVhQdUNPYmdhTWI3Nm9YaEJH?=
 =?utf-8?B?eXU1eXBIN1grOGlicFU2UHF5cFFMV2RvNGM5cUlORmFtM1R2WGdta3Vpakgz?=
 =?utf-8?B?SW5qc0tRT1p6WlArcmxOOGMwWVNBYzFTV1A1TzRGZGtnU1RMMkt5clBZUk9F?=
 =?utf-8?B?bnI2aWorWUF4V1lnUUtCNUFROFhsdkVkejNtM1MyNnhlS3FrTGFqZk1DTEZK?=
 =?utf-8?B?cEJUbXQvMHhZaWhYMlMzUjMyL2ZocjV5b1hVejdhejRlY3ZTN0czV1YyNWEx?=
 =?utf-8?B?UUxuVWwrMjI1dlVkeWF4cVVoVHVDMW5Sd0FZOGk2eGs2UFlnbThQTEZKUHlT?=
 =?utf-8?B?c1RpeU5vZDRvKzBDd21HVHlTUnNMVTBaL0ZZNWM2WUE5MjZCcTJHYnRZSEJX?=
 =?utf-8?B?RDNJa3ZiTGpOUFZDVDIvcTFWdWNxYzBuK1RPSDBMbElKSTVkZVlkY1Fvb0Fr?=
 =?utf-8?B?VEFKaGZvS2JoaTJwZm1LOGRYdzlyZ1M0NWIwb1QrdTFsVU81Z1pSSGNoeStO?=
 =?utf-8?B?NWNlOG8xUjMwd01EbXJ0VXVyWm1rUDBSOWs2YXJtZEkzbzk1VjVRejFzQVVV?=
 =?utf-8?B?NDgrRzVFWkpsZkMyaEVxNUFzWjV1TEhNUy90OEZoOHg4WEFraVFLcVhST1Nr?=
 =?utf-8?B?OTlZQTBUL096THFYZ2owWDJKN25lM3Q5UFpNRStxWlFsNEQ4cnYyd0tiVzkw?=
 =?utf-8?B?bnpyMkpRWmlrS3VOem5SSUxRNGZEN0wwNHpHQ1BzSndoVS9mcWp4RjF2YlIw?=
 =?utf-8?B?eWxiQUVSN1NlYW1JaGhpblBVc1dkUlZ6dUZiK1lzSktHQnBkd2U5YXFqSkdr?=
 =?utf-8?B?eEovN0EyUWJGSE8vellrbFBSYllqT2I3bUttMldPQWxUaTNLWm56V2tkUDlr?=
 =?utf-8?B?bDZJVkxMK0ZuVU51azhIUzJQYXAxUVNWYUZzTUw2N0t6VEI4NW8wYnFzaU5H?=
 =?utf-8?B?RTBkTzg0WW5tbjZOalRTYWtFRkxqUzZzeGlZSVhPKzNMRmh4RHZLYndnOWVE?=
 =?utf-8?B?MW1WM2svZFNxcXFiaHA5Q1o3S0RiNEdFM1UwT2J3dFZJY2kya0ZscHZEL0NR?=
 =?utf-8?B?ckRERXV5aTlUUkpGaVRRU21xSWRGNDBKbTd5YW1WWFJNTWVHMmhUZkxVSmk1?=
 =?utf-8?B?VFhDalByZ1lwUmUrOER6ODFaN3l3RnhZZGJmakJqdVY2c1hXaGlLLzRWVDZD?=
 =?utf-8?B?N3N0Z0htaGYvY2F6TU1lcDA5a3lpeUpZeEVXMERzYWkrRGVUM3NLODVoYTRz?=
 =?utf-8?B?Rnd0Q2szdWRhVTR5YVp5WXJOMElaNzNBZUVzYzhvVmEyR05uZ00yY3FNSitC?=
 =?utf-8?B?VVVSdjRLSTcyc25Ma24wNVp3Kzk2Ty9pZlVWSXVmU1pVb3YyazU4ZmcyaVda?=
 =?utf-8?B?dEZaNVIvNWxORm1JYXZ3azI5MFhHeEdHVURqdDdXQ2NMSVhJeGpkb0N5QkdG?=
 =?utf-8?B?T3hMY2I0bnE1b0J3VDhhdU54RURZaFd3REd0UitiZWM3TmhNTVNJL3JZMkdt?=
 =?utf-8?B?RnZYei9BSWJxZk1sMWJJWmxUYTFlc0dYemd1dmZtNTVZSmU3a2cxSWdhaVhY?=
 =?utf-8?B?QlJmV2RVTkh0Lzg5NXFTek41RXMyVlhGMVBER2ZMTEU5cW54Y29FM2l4WWJX?=
 =?utf-8?B?RUFka1pKRVAxV0ZQRkQ4YXU2MitsQVJLZDRWRkFnbVNlOEZyYWJjSE1YVkl5?=
 =?utf-8?B?MzgveUVxOUVRWXNTRkRIV0dWem5aTGNUWkpBVXpNNW9MNks5b2NMSDBEWWJp?=
 =?utf-8?B?b1BKaGdOdklHekdvWHVtMWx6c0N6U2lTRzFWWXlLeWpNMDBCUkY1Vm9mZG9G?=
 =?utf-8?B?a3N5clA5bFRWYnNtVjJlRzgxMkt0TlNzYTZLT2FWVU11WWJKZUpPcG8yUWx1?=
 =?utf-8?B?RmREN3FuUGpRcGxOSkVEMlE2SHdndG9KVEd4OXlmWnBZaXh3a0xyTEJIZE9a?=
 =?utf-8?B?VmlnYkZFNE9mTk1VZnN1QTZyYTJRSDNaUGVLbGorWFBXL3g1bXp3dz09?=
X-Exchange-RoutingPolicyChecked: iZ31ebEPd4dmmJa8D+77qpRY+ALS0NXwWPzAAIID4l6otUJAugxW/Zcq5wTrCUAfu/nE1UIVhminCR567KZzPPR/WrFIAzWcHlzJMIzr5+InW1qrCxnoYo2usDJ6L5hS7bB7gheKLa8zB7jD2uKFmDRKc0mFffHavsX7pPdJNCkCYXjL9li23RDby0YOwQw9DQdL0rsnL3fmIKY80NXCfRPnbbGmV95Lbb1PiGMZejEgy/0YkuIqNFNJn6iJE5i9SS9oYSPi/gM8JzYx2JLkYYZDij2QtXfTmiFkZDTqVCzv7VdO47i2o4TR88fLCc0Dl/K6ubMWXnrHCKPrMidJoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7bb3a1-e433-449f-dcdb-08de99d60e0d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 03:29:37.5086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vwh94SnVLan5FiT3unQr4mpMVi2wd/FxnVLsOlEz3K07naS/J5dafxyHpXV9MLDneQwYyvYc1/ud48DZowP7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
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

Hi Suraj,

LGTM and now CI is green as well after rereport. Merging this.

Regards,
Karthik.B.S

On 4/8/2026 10:33 AM, Suraj Kandpal wrote:
> Currently many pm backlight tests assume that panel will stay up until
> unless we tell it to go down or AUX transactions are happening.
> That is not the case, some panels when they detect that there are no
> changes or commits going in, it will go to a lower power state. This
> causes issue in this test like AUX suddenly timing out (mostly in
> fade tests where each backlight change has a 10ms sleep and many
> steps giving panel to internally go in low power state). Also since
> changing backlight has its own interface it does not count as a commit
> hence does not contribute to the panel staying on.
> Also trying to change a backlight when panel is not up does not make sense.
> To solve this setup the output and do a flip to make sure panel is not
> down to simulate a real life use case on when backlight is changed.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com> #V2
> ---
> v1 -> v2:
> - Remove setup and commit function from check dpms as it is not
> needed there (Karthik)
>
> v2 -> v3:
> - Redesign to make sure we are not creating FB's every 10ms before
> moving backlight (Karthik)
> - Make sure we are releasing all the FB's we are creating
>    (Karthik/Ramanaidu)
>
>   lib/igt_kms.h                  |  3 ++
>   tests/intel/kms_pm_backlight.c | 60 +++++++++++++++++++++++++++++++---
>   2 files changed, 58 insertions(+), 5 deletions(-)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index f994d91d3..69cca327d 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -550,6 +550,9 @@ typedef struct {
>   typedef struct {
>   	int max;
>   	int old;
> +	int color_flag;
> +	struct igt_fb green;
> +	struct igt_fb red;
>   	igt_output_t *output;
>   	char path[PATH_MAX];
>   	char backlight_dir_path[PATH_MAX];
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index daa70c716..58c0b4427 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -84,6 +84,44 @@ enum {
>   
>   IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
>   
> +static void cleanup_fbs(igt_backlight_context_t *context)
> +{
> +	igt_output_t *output = context->output;
> +	igt_display_t *display = output->display;
> +
> +	igt_remove_fb(display->drm_fd, &context->red);
> +	igt_remove_fb(display->drm_fd, &context->green);
> +}
> +
> +static void create_color_fbs(igt_backlight_context_t *context)
> +{
> +	drmModeModeInfo *mode;
> +	igt_output_t *output = context->output;
> +	igt_display_t *display = output->display;
> +
> +	mode = igt_output_get_mode(output);
> +	igt_create_color_pattern_fb(display->drm_fd, mode->hdisplay,
> +				    mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    1.f, 0.f, 0.f, &context->red);
> +	igt_create_color_pattern_fb(display->drm_fd, mode->hdisplay,
> +				    mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    0.f, 1.f, 0.f, &context->green);
> +}
> +
> +static void commit_new_color(igt_backlight_context_t *context)
> +{
> +	igt_output_t *output = context->output;
> +	igt_display_t *display = output->display;
> +	igt_plane_t *primary;
> +
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, context->color_flag ? &context->green : &context->red);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +	context->color_flag ^= 1;
> +}
> +
>   static void test_and_verify(igt_backlight_context_t *context, int val)
>   {
>   	const int tolerance = val * TOLERANCE / 100;
> @@ -131,12 +169,16 @@ static void test_fade(igt_backlight_context_t *context)
>   	int i;
>   	static const struct timespec ts = { .tv_sec = 0, .tv_nsec = FADESPEED*1000000 };
>   
> +	create_color_fbs(context);
> +
>   	/* Fade out, then in */
>   	for (i = context->max; i > 0; i -= context->max / FADESTEPS) {
> +		commit_new_color(context);
>   		test_and_verify(context, i);
>   		nanosleep(&ts, NULL);
>   	}
>   	for (i = 0; i <= context->max; i += context->max / FADESTEPS) {
> +		commit_new_color(context);
>   		test_and_verify(context, i);
>   		nanosleep(&ts, NULL);
>   	}
> @@ -164,15 +206,21 @@ check_suspend(igt_output_t *output)
>   	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
>   }
>   
> -static void test_cleanup(igt_display_t *display, igt_output_t *output)
> +static void test_cleanup(igt_display_t *display, igt_backlight_context_t *context)
>   {
> +	igt_output_t *output = context->output;
> +	igt_plane_t *primary;
> +
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
>   	igt_output_set_crtc(output, NULL);
>   	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_pm_restore_sata_link_power_management();
>   }
>   
> -static void test_setup(igt_display_t display, igt_output_t *output)
> +static void test_setup(igt_display_t display, igt_backlight_context_t *context)
>   {
> +	igt_output_t *output = context->output;
>   	igt_plane_t *primary;
>   	drmModeModeInfo *mode;
>   	struct igt_fb fb;
> @@ -292,7 +340,7 @@ int igt_main()
>   		igt_describe(tests[i].desc);
>   		igt_subtest_with_dynamic(tests[i].name) {
>   			for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
> -				test_setup(display, &contexts->output[j]);
> +				test_setup(display, &contexts[j]);
>   
>   				if (tests[i].flags == TEST_DPMS)
>   					igt_pm_dpms_toggle(contexts[j].output);
> @@ -302,7 +350,7 @@ int igt_main()
>   
>   				igt_dynamic_f("%s", igt_output_name(contexts[j].output)) {
>   					tests[i].test_t(&contexts[j]);
> -					test_cleanup(&display, contexts[j].output);
> +					test_cleanup(&display, &contexts[j]);
>   				}
>   			}
>   		}
> @@ -310,8 +358,10 @@ int igt_main()
>   
>   	igt_fixture() {
>   		/* Restore old brightness */
> -		for (i = 0; i < (dual_edp ? 2 : 1); i++)
> +		for (i = 0; i < (dual_edp ? 2 : 1); i++) {
>   			igt_backlight_write(contexts[i].old, "brightness", &contexts[i]);
> +			cleanup_fbs(&contexts[i]);
> +		}
>   
>   		igt_display_fini(&display);
>   		igt_pm_restore_sata_link_power_management();
