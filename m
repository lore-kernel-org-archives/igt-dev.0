Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E686FD88FF
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 05:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C584710E31A;
	Wed, 11 Mar 2026 05:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJ7n4eUu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049C310E31A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 05:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773208198; x=1804744198;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UuGzdbDkbpUhTcoCZVQtmy2BRFk5B+lXQVYSWAhhVC0=;
 b=VJ7n4eUukyOA2h5m8T7hz2VgQDakqC6wB5Db/qI5TTZ77jtKGoX2uLTN
 cCipZ4byLtNbWFy0LaXDEoKeDORoOkET32vFg9HU9wH4xxHNL4JND3A38
 I3F0bP1ug/HYmOwNh1X3RSj8XjZU27Fl6TN1Ax4y47WuqLENWhsQ1TCUQ
 TIaJBqUQYfajWrbTDQMOiwEzLLGTLAnCUhNd8lSz2pLIyhh1tuqk+1Ng6
 EjL6x9jX/vOXmNqll/YOT/YUKBFJF1R69Yt+Kzfo9dkxiSmP5U/WcPb2P
 sJT5BZdRAiUsvvo7aenNpJoA7vVXT0WNtc8D/rTqdts4dfy8sUvzklnkM A==;
X-CSE-ConnectionGUID: NtyB2uk5TP+hLjYEy0LgQg==
X-CSE-MsgGUID: G9uWKyoxT8WHYoxmqaLxDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="61841292"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="61841292"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 22:49:58 -0700
X-CSE-ConnectionGUID: NXJ1f0+dR1qBYskpPSl67Q==
X-CSE-MsgGUID: D3D8cIMYQxOV6bmNJT0EpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="258270762"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 22:49:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 22:49:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 22:49:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 22:49:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TygS7MaRg0afLu+GmYCJKc6m8rNVWEU6AoT5+89Lq3hvo2dWNdRFa0ix57DP5wO3V+uNLkhWAFdFqptQaqHfxoQLb8j6ZkRX15B8WwVc3s2I2ZnV9IoHsD4j/LEZ6O/NfELgJEJLjSiNHGnfBXn7BQbCnyDCVzIL0Qz8ejZt8rcHDmYPITtWzWZJLJcQrLuco6zGyTpVaSzhZO1mqkEHY2xSajwztGGMRdsLN33NDG+4ewzypL8oLM7SElcNCa4H544wQnYqsVtA3fDFuIZ6e9M+OjP27TyCQEl7GznJqyEVigYRvnAIOcnKyWqn/qT+En3vaRTgtpuzLhtcMFusHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4sSz1es4GT3WjyMMuKUT6Y0IqhX9S47kjXdL+JErfs=;
 b=XtV4Ywumbzsl7ivKiBQlqUzuGSwBiGNU9n4wTvKKuVFozxVVLwQYrCg4fXheMzsoXWkGAT24wL1zglsWmDkZXtkPZqXfYVDookINPhHzqkbd8rLvuoHgha9D/fUmwxCGbrN/OtKNxfl4KrcobtMK3hxUkyLtdZHTwdGJ1FhCkVERdKydfN7M7JqDaVnoET0BihmcdrkxwN7c6jfZ2GAmp/JTipJ9i8S4YitzqpAjG/pxvkYe/EIL+yPtED/66fexpghuU0aj104xepeNAklu9Ic23m93ImoyD45jfj7ftbQI/v6dbbhOnzctix7vWt8kC6PtEq77e/gxKSaPhTmJoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DM4PR11MB6309.namprd11.prod.outlook.com (2603:10b6:8:a8::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Wed, 11 Mar 2026 05:49:51 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 05:49:51 +0000
Message-ID: <b2583d17-b950-42d9-9aaf-6b74a841f35b@intel.com>
Date: Wed, 11 Mar 2026 11:19:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_async_flips: Use lowest mode for crc
 subtest
To: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260309082450.1897617-1-santhosh.reddy.guddati@intel.com>
 <2f87eb4b-8aa8-463f-9b45-36453b48d0df@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <2f87eb4b-8aa8-463f-9b45-36453b48d0df@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::8) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DM4PR11MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: f2db44b2-446e-4711-e988-08de7f320309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: etW7P4yeI72i5oCCVCE2gAEe1vW2dflBWsJraiGBeNMjcxNMqSpuwTK2umFGQlOq2eSqecQJtyFBZgIqsq3HxJrY2LiRIdSyORmfDLtHVpEOKso8BCPwBoMOJFpgULDRTLayyLbcnq6meW1UWJX/InNReGIhLoX87uIU4AL7FXPL8TWX2WaIPhN1E6iYjo4+DhUL6zmhmN1xSulhLgqqhiHFZZ2W6gE5C91BeMAP5aX7xc+4U6zQnn0vjhtWLc7ljr8QEEJP7fasEwhU9UuuevabqFs8V9zoAbAQjSjqSuEHGiH2apgGKEeTP07yKAjeaWzIZgrOJdS4v8IsXw+9tfFLRrnEQeUsLOP7HIGqJZGMrlMP7LMS0g6ZHCZwhivc7oUW3Qc1ARoCB0VmeJzW6qpaC7nMX3WQmnq17ICjj32+L0pZ1Iz0GksFYGxUhbkOVFhlz/skQWGp9MNKk5gO9SMBUqfbxkeZAT+3+bDj8v0APvmHvHrRNhrexfMs7q/T3nL07LUrA/HlRs1UWQWLrrHfx02awk9bJRQAlAKUdJQmv/XJpeo/d0m5F7qYEEUaf4pgyEFZDkfvx3NMEYRyGEen48Foc1f+NQbNhltAarlaNX4/LH/34BKVu6Amrpc8n811EPNuaZDHMUOhTt7/LkRO+qND40i9XfUhkO/faoDs0zzUau1OtDfycMDKZKns
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGErNlgrSWVFNjBLYXJTbUEySy8vd2hjdEc0bEpwWitNWUJrUVFONERUK2Vh?=
 =?utf-8?B?dDFSbmthSW5oTjFldzJVajFURXNobUpuWXRLVlpROXloU1NZRnBiN1dGTUp0?=
 =?utf-8?B?R1N4NlBzNDN2OGlacVRlTDZSRGU0Y0MvK3V5NVoxa3U4a3gwQnB2ZjhNZklB?=
 =?utf-8?B?MzFwbDhUQXgzeG5qTTQ5OTVGUnlzeG5kMThnamJic3VOSUViUVl4SUxJK1hI?=
 =?utf-8?B?VUp6MlA3c0lxUmJYRVJPMVJOYjlMRjNGdHRBcU9IcjVnNG1MbWhsdHpVbi9i?=
 =?utf-8?B?bVVRV2pqUG16alk0UDFLR0NxZE51WWRBRTVoVkd1ZC92WGdUWkdmU3RrVG9C?=
 =?utf-8?B?SnJKc1J4ODllYklhUlZPZ0lncWtpTGZKZ3ZhNEc5NUZKTllIMldTWGZGSjdu?=
 =?utf-8?B?dUIvbk00R3ZleVpzMlpsRllTMDFoYytXckh6SWE3Z0xEb1IwWlFvTkFtOXFP?=
 =?utf-8?B?NThpUENvVDJtbW9vOUgxNVlWTGJEQ1d3bDRpMVdSOERoSHFXWWJXSFhzMDA1?=
 =?utf-8?B?Q1VUeU02NjErTjZSWDB3Zy90M0loSHVaNEhnVFcvUGxMYlBxRDFBUzhUOXQ1?=
 =?utf-8?B?TzBRRitWVkFHTkNQN2x1c2ZnQjNjaW1kaUNETFEza2hBMFNVVUN4b21wVDhI?=
 =?utf-8?B?S1lwcEw1MURoOU5yRENyWEtOQ203SkdwT2llTWlCVkVGUzd3RjVPRkZGZFN4?=
 =?utf-8?B?TFRnU3IxUERYdHZCVzZJbk56QkhRQk4wRFJWREptdWpOY3dOWnRWZEVOWksy?=
 =?utf-8?B?emFraG1QeDhsd0lwM3VlcWN3VmUxWVdOMVFmT3dZQ2NnRFNvcTQrSzIvWWZa?=
 =?utf-8?B?NEtVNUp1TmFrMS9IR2NVNHZxU2dIVVZPN2dOakFRTlZienFzYmtKMXFpR3Jr?=
 =?utf-8?B?TXlLbDhoNE5qK1RrUkRyaGUrTlE0RjZ0ejZmdHY3ckhNOXQ1SmRRdjNiTk5t?=
 =?utf-8?B?TCtzSzhMYytJZWJoUTgwYjB2STFDODdST2xCU3NvaUROTDZXY3I2dHFGZ1F5?=
 =?utf-8?B?T0dhZGtDdTh2N2h4SVliWXpJN1RWelQ3cFVqZm84dGdzMzAyYWQ2bEp2YWFH?=
 =?utf-8?B?OTR6K1pWMzJTUUhsM3BHM2M3V2Y2R0F6Wlg0RjIvMUpTcnZzUUtIK2lXWHFR?=
 =?utf-8?B?ZzF6TzBYWWRabWJtWVJtWTlBT2E4Rk5jZ3htRDlIclE5aGlSWnJEMERnNkVB?=
 =?utf-8?B?Ylh1MlBHN2F5bFI4aFJqZ0dIU3FkT2gxVTNCSVNUUWVUcnJ5QXNjL0Z4aXkv?=
 =?utf-8?B?VWxKdzVFdWo3KzZpNElYQTVsaHlRaHNFWjBGUG9Ucko3NzVIZ1B5Q1VNZGFO?=
 =?utf-8?B?SUx4UnZhY2lUTElTTmZuSC91TzFZM2o5ekFVVTVoTktQQ2tObDl1ZnZPb1ZW?=
 =?utf-8?B?T1FTaGJMOG9QSGFta01XZlRMODVxT3FZRzk2NmVMR3JjcHRMN3hPWTM0MENQ?=
 =?utf-8?B?SHFiZFJxUzZXMHp2NjJoaVV5RWd3cXVYK0lMUndzMVdrT3UzQ0VnV2poK0ZB?=
 =?utf-8?B?bzZNMGw3YWNiN1JlZWhQbUoxVHBMTDdnUEpsSXNnenZlUmhmRUdLMnMzVzBl?=
 =?utf-8?B?NFJRRzJrQk5WVHE5cE94djByMUdJVUJ4cGJ3SG12YkMvclkwVDRYcEZvKzBv?=
 =?utf-8?B?RVZWYlNJMWppZ3Y1aHFUbDhpdUpXZTdxVzkzK1ZFUlZkWEVQOCtIUmNwbnRU?=
 =?utf-8?B?dGtLOW1hMURCUWZzZlNyYUl1OTdqbUxGMWpYYkNTM09sc2YxSjRJVkZvZGhH?=
 =?utf-8?B?MnY3MGZ2Y3p1MFpKWDg3d2MrUmwzL3U1end1b3pEOHBpOS8xVEhkVXpENWJT?=
 =?utf-8?B?NmhZNlVhM3B2RVlEb0x1WjlHcklLbS9kYjgxVTlDcGxabzlnNUIrUnFZQW1J?=
 =?utf-8?B?ekRqbktqWTh6c3RTQ0paUVRHeURVSFV3eU53SjZIS3ZKclNCSTU2VFNTTUlv?=
 =?utf-8?B?ZGNiVnU2UGN5WitxVHkzNFAxMmd1YU9FT25TK2l4cUdYL2JSbk9zYmh6S0pz?=
 =?utf-8?B?ZU5reE4weDFTYkxlcDN6RkxmakdVU200d2FpZzFCbEdJOHdyQm1LVERCVUp2?=
 =?utf-8?B?Z1BPNDdSSzVvellWdHFTZVdqQllMMzNBVFhxaHkwSzZBS01YQ0VqRWxNTzZa?=
 =?utf-8?B?R2FDRG5GZjRoaWIrenZqd0NwbFBBSktOWERJNmErbSsrRVdrazZKU3R5eGxE?=
 =?utf-8?B?ck9GOEY0NnlEVGVPT29Yeld1OXNwN1l5TmMwM3h6QjNnUU9OV2NQTlJVOFhW?=
 =?utf-8?B?NUN2R2dIYjJQUDNjM09FTm5iVy9CSUVJT21JenRIRThrd3ZhUHhoZjk4OFhr?=
 =?utf-8?B?anV4QWM2bTRYQXZmZy80UGFuUlNqelpaWFFsRTVMN3hLZFJjMUFRQWxzV1E3?=
 =?utf-8?Q?AfPgH/XgkYlH+sy4=3D?=
X-Exchange-RoutingPolicyChecked: VkVX0H9nsxcUEs+nz47y+qROQ++s6eaUGNJpnN5ZIvRdoNvciTNTDpZpGS6NqPWBUhBw+7BG6ROuiM/pp/s67VqB7oW052qXdHgAn1yIZJaI29QzoeSZX6b5JATZJzJmVrEjtUUmXjbK/9Zeu9KkZ2585WQRvwz+5XzvugKGO+YnSGeYQqLD7rHwueIJHMe1Vo9V44Zc9RTO9Jyu9/e9ZsYOvFDCr0iegwQ7TDC4sU0vFepydPjQxtC4N+iXGWXPEZkpd8QJ1mqgRpZ9uKUSgMuIaU6goV0Y6TYuYTMgT3FuzeKsjdnEx9UL7ovOurGgLGO12SgrFGa4vFW81qV/qA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2db44b2-446e-4711-e988-08de7f320309
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:49:51.0647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpQFqHzeX95AgXojMYxpV7ZQtGp5MXTXMAr3RyauWjifX+qoaY2EXlPVbhGTcVP5zztHMioF91H6FalH5Nnj0vlKoxnHBdLwseBzB2utWoPh2pPSfEAhlmvauaeIByTy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6309
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

Hi Rama,

On 10-03-2026 20:37, Naladala, Ramanaidu wrote:
> Hi Santhosh,
> 
> On 3/9/2026 1:54 PM, Santhosh Reddy Guddati wrote:
>> Currently The CRC subtest uses mode[0] which maps to preffered high
>> refresh mode. On panels with multiple modes, pick the lower mode to
>> speed up crc test.
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index a42407363..8639e2299 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -825,6 +825,17 @@ static void paint_fb(data_t *data, struct igt_fb 
>> *fb,
>>       }
>>   }
>> +static drmModeModeInfoPtr get_lower_mode_for_crc(igt_output_t *output)
>> +{
>> +    drmModeConnector *connector = output->config.connector;
>> +
>> +    igt_assert(connector->count_modes > 0);
>> +
>> +    igt_sort_connector_modes(connector, sort_drm_modes_by_clk_asc);
>> +
>> +    return &connector->modes[0];
>> +}
>> +
>>   static void test_crc(data_t *data)
>>   {
>>       unsigned int frame = 0;
>> @@ -834,8 +845,8 @@ static void test_crc(data_t *data)
>>       igt_display_commit2(&data->display, data->display.is_atomic ? 
>> COMMIT_ATOMIC : COMMIT_LEGACY);
>> -    /* make things faster by using a smallish mode */
>> -    mode = &data->output->config.connector->modes[0];
>> +    /* make things faster by using a lower bandwidth mode */
>> +    mode = get_lower_mode_for_crc(data->output);
> 
> This optimization is for simulation? if yes, Add a check for simulation 
> then change to lower mode. On Hardware it won't take much time. Why this 
> time optimization required on hardware?
> 
> is any issues seen?

Thanks for the comment.

This change is not for simulation.

The purpose is to fix CRC subtest mode selection on panels with multiple 
modes (especially when there are HRR modes). Earlier we used 
`connector->modes[0]`, which can pick a high-refresh/high-bandwidth mode 
(if modes[0] has highest) and make this test path more sensitive.

Now we select a lower-bandwidth mode using `get_lower_mode_for_crc()`. 
The async flip + CRC validation logic is unchanged. So this is a focused 
fix to make the test stable on HRR panels, not a new behavior change.

In past , we have seen issues related to this and the test was handled 
to adjust the criteria.

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8247
> 
>>       width = mode->hdisplay;
>>       height = mode->vdisplay;

