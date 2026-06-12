Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9AECD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 04:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1932410E097;
	Fri, 12 Jun 2026 04:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frdrGqxY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523B110E097
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 04:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781238408; x=1812774408;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=L8Dyb4YcT2hjebYmZ73j0ycIVQ+FFdHZcQXvZ67+qV8=;
 b=frdrGqxYpb/GkbP0kaS2VjcPKu/KIWrIIKcBqpt+6nG/3gMeWIvLIYvJ
 i70pSmV7H/lfB9RFedsdHI8ATcZouH7nq36OrGDPwqFg9S0wvBXJwWyA6
 LvcWMkxsmT97pEicRjrLfRq7Jbth5xp7HMFLr2U95nxNmBQG0fqbuAzLf
 CbAyAVXEauRRXawh+Bh+D2iW71FWbU7Co1TqZ6V1ELBWjErBd8JOBZylJ
 jxLCxkz50Pb/st7DtjNpK+3d0od9jO2zx9tcDnClD2rwR0wMV61x4wqKz
 oHva089IR7O5dlXrr9h+1GoTkV2/yxEoCqG1YklKXNuTSt+EeBHixmyTg w==;
X-CSE-ConnectionGUID: KliiqYAUTWKBmkZYC71n8w==
X-CSE-MsgGUID: wxvjVUe3TbKqJmzmUd040Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85696506"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="85696506"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 21:26:48 -0700
X-CSE-ConnectionGUID: 971zT7ZxTKqH6wTUwAOiNA==
X-CSE-MsgGUID: LVZm/OlSSleKXyQaPKJL7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="250643400"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 21:26:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 21:26:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 21:26:47 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 21:26:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K70X0Mk2f6mqgSy9J+8Jg+U5XrM36nSSLdkihxU2JRPeXrO2ANRSbOmFyjMzv1H5INx/JfwoMI8gxZ9AMBZgTNKn+wF/49VxuOIQNZxFVRE4lriJKPQf/FXHcHYu1g7uNwcmpSkICbWM1zgsHlaUVi5wTUJeGPJVDll1wlWWXip/J96MBJyf3urK9KINOfv/BHs46JNaPK1j2VMh19yleI/VSIVnMO7xleZpDroZCvDrS6rHpU2+slWTihBiKUq2at+mbEyR8mWBDOVID/IQgt261rgaqcvvKxrHPmJ3qRqPcqDM5tD9YQ4Vl60XbKvqllx+cZaX2LTZwOKneLNIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5evPlq6wMoTDYvGRxBhEV/PQnXzTNC0prhiCn59SBU=;
 b=wTowAWOEWpg4TxvHTB9TPULZFLe97x5QOfy8qzDdzQi+nZ2bfN8UaKNgxeM4zPjCnhA+hSjmSdH4zbb9mdLFTxgO7ugw+X9+NeyvJbKacPaYJ1M5/rEkaHri0K1C1Wvs8M9ePJi26Rts+rfVmLzB35H6bhfz00nNGWzJ16SvndkuPop2LfseG6nDvQM8FrFX2NtDi+DL5Buy4BnU9I6Ijqb2Mp9RmaIhi/z2m92jcFjUs/OSLPzMNB4ygp6UQaK2f3lnAt6mWVrCE+4wSzY4tSm7Jf/xrLFXxw7WUoXlGfLUFIqn75NRrRTvCnOzfozUL+xw5cd1MO+k3XUuRozlFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Fri, 12 Jun
 2026 04:26:39 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 04:26:39 +0000
Message-ID: <db8f3421-241e-42ac-85e5-57fcefb7e858@intel.com>
Date: Fri, 12 Jun 2026 09:56:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/xe_madvise: Skip purge tests under low RAM
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <nishit.sharma@intel.com>,
 <pravalika.gurram@intel.com>
References: <20260610080206.1470008-1-arvind.yadav@intel.com>
 <20260611155446.kiso6cph53arklnl@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <20260611155446.kiso6cph53arklnl@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SN7PR11MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: bdbe068b-deb5-4462-42b9-08dec83acc0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|4143699003|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: RS0WS8KoDWtzT27AnRQDYmV/s0003K4bBr+AW1ig4wUtnvZz4XZlDJayqwk6yUVPhGK6nT219XJ9Rrtlz/z+TSnWT8ALtZ2RO0So636kxtajKb87tJte42Pg8dtgT8XuWJRDuM72Cv/Se+iadoz9tcOAafyZhFrP9BYWPT0eKA+tGoSSI9iIuvyUXaVPrO5LSFIG/9KlC+9etn+pI0SLlTvcS5NrkXMWuooppLddGTQ4yuw22kKOJiRbE1roUYDwg+8u9Ef9VooFP/LuAObCBqEm87oOrLZgd0eD5MHfrx7OLvi5FiUpL5JVKOFzayvQBjOi1b2IuzMfGsvPD1FM0o5pTfL3Lo92CC/172DMZIn7fBx55G+g/oNldEfMzLZ6b1uQGMPwKOAcn2UkO9Fk1uT5iFTJZxIs9mQ3Yp3ItPE8KBqrve8aYynTjZXlOyCZKBeC1f6o0O6Hw79njg9hCmxAEA3jbJKcHiFFxEQMDi6RKfT+9EwlBZzLv5gspVKMjATxmC3xiXR+rvMjIZ1i/yIbucOvS9Y9+q6CtbqM2XvJdqyIqYgeSwjGhwfRtxTM57CeAvlp/zGJgBZLVicSlqRWQkkWYv8cDp5Fdb5pVlVLufa61FBPe97HNl2O85aLpm7fBA6dYkt3wIFYkMdtIXYNZYIShN77eR14vo4dzkstl/NSOA6RdQ+pBss8f7F3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czBlVFNmWllaTGFtOUwvUVBlOUF6MUlXZzY5K3ZNcUFPOFp6Q3hVOW9IRlFh?=
 =?utf-8?B?UjI0YU8wZ1R4K243KzFaZWQ4NzdiYnFqclNSSXVUczhUTStiR2l3STdXVExl?=
 =?utf-8?B?WFNEU3V2a2tkc0x3Rm1ITklTZXd0c280aG12QSttOFlubjBHVnhGTHB0YUJ1?=
 =?utf-8?B?YlU0WHhiamNSTkJZeXE1YjNDRmJuSTRjY1NOaG5GQ2hBek1lYzBTOHg3UU9C?=
 =?utf-8?B?VW50d3hGYzN6TlkvcFlBV01xVndqc2hzbCtSU29mTEtSLzZNcXNJTVFkWU91?=
 =?utf-8?B?eWZyc2lVbGM2NmptRkkvNkQxTndacDlnUm9vTkJCdDc3OWVaVmdYY2xJU1NM?=
 =?utf-8?B?S2NNczIzSnVMQ2pPVWs1a0x2dklwNkx2TVBPa00wUGZoWVRJWlhCSDlDVUI3?=
 =?utf-8?B?dTI0NUFDb01GV1ZZd2VmUWhZb1E0eFY5N2VSYVNHYnZ2UVNaMjJSNENtTktt?=
 =?utf-8?B?Q24ya1NaN0xUczJQaVI4SWJJYXlVMjA2Qk8rcXcxWDF4di9DcWpOT3E5STlV?=
 =?utf-8?B?QUh6a3pzWUN6VnQyajBzdlFmS1dJWEVzQ09wdE0vZE1ZaStLYUtBY2NNT0NM?=
 =?utf-8?B?QmlibmZUMnNyc0VNK1laQmJZbnlYbEtXSGFZb3E0eVRaWmx6Z1B5VkFnamhZ?=
 =?utf-8?B?UXNaVk5rWnB5cDg1TzJua3BwdjJTY3NqdVRwcWxGSHd1WDRUdllFbFptbnZT?=
 =?utf-8?B?Z29IRmc2dEtsQlhuMjc4UFdyWjhkMUtJTmczYWlIeElUL1ZaWXhTWHZSQWJl?=
 =?utf-8?B?UmQ4QkhlRFR0Y1V3YTJCTzM5U1Y5bmwxeVlYV0RlaGl0enRPMXFSY0E4QXht?=
 =?utf-8?B?dmQzK1NmRFZZOFhCZWlsL1hUdVNRbnMwdDZLYm9mQUpHN1NqczVOMythcW1q?=
 =?utf-8?B?cDJYWWpOYS9SOFhidldCeFkrUlNKd3I3Uk1sNkhrYTA2dXcrNWEvTVptYVgy?=
 =?utf-8?B?Q1ZmeEJRRXdQZzJ4L28vUzdIcCtKVWNXWHVpdEZkSTFHOVBVT3BIMmNUQXdj?=
 =?utf-8?B?ZFNZT1M2VTA0UzNCdEZENHk5dWJrbW11Mmw4dlRiTnUrVDdXcE5mbVArcll1?=
 =?utf-8?B?cE5jZW9YcGV3dFlFclRSYk41NXdQYjZ4V2lHdWl3MXpwRmRTeW9nZmVXR1Jk?=
 =?utf-8?B?amFBZURNMTdXMC9KamJmZTRXMkpyZkF1ZTdQU01UZDArMnVDRDFFbWJGY1dB?=
 =?utf-8?B?TEkwc1VaMnZLcERFVXhDTkh6K3k2V0gxcktRblFYUnpCSnJ1OWRMQjl5VFNG?=
 =?utf-8?B?MnQxME5KQ2pHUG9zc0FWa1hlMTlob3BEamJvQTZUSFJxWUJWbDQweVIybyt2?=
 =?utf-8?B?d2NPL0VLemJ6VVFBdFM0VU5rWTlqMW1ZRXY2a0FUNW5OVXp0ZG03RitGRzdn?=
 =?utf-8?B?ajk2K2UxWGt6ZzJkZlhLbWFmR21QTld6a3NwVHRkQ01iL051bnNLS3g3UmRr?=
 =?utf-8?B?REFscVREZXIrVkFBcDRYaUQrWHd1VUJOLzJ6SVVTbjZrcmgvaXlvS0ZtTENu?=
 =?utf-8?B?dnMvblkzcDZoRGw0K2M5ZEFiZDh4MHZPL0VBVnBoSms2eG5HNDJHTnlmMGxO?=
 =?utf-8?B?SHBha3hBUkhwTnBpd3NXUU9CSjc3ZFBIalQrMHg0QmszQjIzcXRlVDA4a1Fl?=
 =?utf-8?B?UTl1YmIxd29KT09zYTdNMlJBNm42Zit1L3J1eUdDeTNCRkhuenlRcDVHeXJx?=
 =?utf-8?B?YUVaSnU4ZlZwVzUzd1dEVTd4UnE0bVdjUVlXdVJpTkQwRktJaGVLR21NSDMz?=
 =?utf-8?B?bWpaSVdVaHVhL0lKQzBJVUx2U1pHMDhmQkxtejRnSFRkSTZLOEMzbUdueXF5?=
 =?utf-8?B?OE43OHNlbmNuaE9ucXJBeVRVcTBIRUswampxQmNNazcxbm5wTUtLeW8vdkIz?=
 =?utf-8?B?OFR3UVNUSTZmVUlvWTlmZ01EblZhay9kVUtoVDFuNUFMb0xTT0VBekQzMkpM?=
 =?utf-8?B?WFJFWUdNNFljRVMwUzlyRU45MS9EN285VGF3RWJpTkdPdXlUWGc5R2N5UVJi?=
 =?utf-8?B?T29heHRKTGIrRXJOakJtYSs4ajY2RERPaFFWTVFiRGUrbElRUkpwazNlM2dq?=
 =?utf-8?B?dVRRSVRXV2tpaGp3czNoU0ZsV245K29VRkpqckNDTWhKdlhqUjBFTUJzVk4x?=
 =?utf-8?B?OXg5K2E0ZjNhaUwwM2M3WVNadzhva0xKclBHWTVkR2hNMVdYU2N0V0xMc1pa?=
 =?utf-8?B?MUtuVGlYc1dMOW9RbEd0bjlpSWo3Q29YWEdTRmdwTkhIVlJERmdEWmJRcU5y?=
 =?utf-8?B?VWJrQkpTaFBuUkZaRzhRK0pNVnVvbWF5TUpIaDJMUjlxQmplcWtBS1FHQjEr?=
 =?utf-8?B?YStCejZxMjhiMlcyOUVnSVRYdUNDZFg2N3RBU2kva09NWVJKZzhhdz09?=
X-Exchange-RoutingPolicyChecked: hV4DGVvy1euZ68WQhJj+KvEEmKekJsNLolJDZlF1JgDhobbKgNSk6PUQYsVwf7EitsvI6I8tM0EMNqQle2XoQHehtbJYVizC9oz3AUj8ALcYBrx8phGZr5E6XfQLUyXceMqei0sNZgpXXqhjs0vbeiSeh89C/uF0M8KCVY8laffSIqGh/OV0dFmeyShXh/felfu04/KmQvtvoBw5d65vPqp0NUWf/r9wCy8didEMPgX4vdL3Hf8dhKXDCLEt+3jX+Qx1O5ZTw8FNk+0UhIuEP2ZyU99duWcWUI3jKQFX8ut4iwhxnocuC2LyxVtk/29Zpu/3gHhVYIFV8/UZIWs+OA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbe068b-deb5-4462-42b9-08dec83acc0f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 04:26:39.4376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWwooBByydtrVMEPqP3EU8PJ/Cd0gs6fsXXwWg94Jw4F/kfHUGk3juv8C3bqfrrwYvGFUg+70x2QiZQycZSZPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
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


On 11-06-2026 21:24, Kamil Konieczny wrote:
> Hi Arvind,
> On 2026-06-10 at 13:32:06 +0530, Arvind Yadav wrote:
>> The purge tests create memory pressure to trigger BO eviction. If the
>> system is already low on RAM, this extra pressure can push the machine
>> into OOM and kill the test before it can clean up.
>>
>> Check available RAM before starting the pressure allocation and skip when
>> there is not enough memory.
>>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 14 +++++++++-----
>>   1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
>> index cdb115d7e..f9e2c4735 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -83,7 +83,7 @@ static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>>   static void trigger_memory_pressure(int fd)
>>   {
>>   	uint64_t mem_size, overpressure;
>> -	const uint64_t chunk = 8ull << 20; /* 8 MiB */
>> +	const uint64_t chunk = 8ULL << 20; /* 8 MiB */
>>   	int max_objs, n = 0;
>>   	uint32_t *handles;
>>   	uint64_t total;
>> @@ -98,14 +98,18 @@ static void trigger_memory_pressure(int fd)
>>   
>>   	/* dGPU: fill VRAM + 50 % to force TTM eviction */
>>   	mem_size = xe_visible_vram_size(fd, 0);
>> -	overpressure = mem_size / 2;
>> -	if (overpressure < (64 << 20))
>> -		overpressure = 64 << 20;
>> +	overpressure = max_t(uint64_t, mem_size / 2, 64ULL << 20);
> imho this is no-op, you will alwayes get 'mem_size / 2' for dGPU.
> Maybe just add igt_require(mem_size)?


Agree, will drop max_t() and keep the original two-line overpressure 
calculation.

>
>> +	max_objs = DIV_ROUND_UP(mem_size + overpressure, chunk);
>> +
>> +	/*
>> +	 * Pressure BOs are faulted in and kept alive until cleanup. If the
>> +	 * system is already low on RAM, this can cause OOM.
>> +	 */
> Can we just lower how much VRAM will be requested? For example
> fill VRAM + 10%


I would prefer not to reduce the pressure in this patch. The test 
currently uses VRAM + 50% to reliably force TTM eviction and purge 
DONTNEED BOs. Reducing it to VRAM + 10% changes the test behavior and 
may make purge harder to trigger.

>
>> +	igt_require_memory(max_objs, chunk, CHECK_RAM);
> So you need to get size of system memory and adjust overpressure,
> but that can be postponed after this change will be merged.


Yes, agreed. For this fix, I will keep it simple and just add the RAM 
availability check before creating the pressure BOs. We can make the 
pressure adaptive in a follow-up change.


Thanks,
~Arvind

>
> Regards,
> Kamil
>
>>   
>>   	/* Separate VM so pressure BOs don't interfere with the test */
>>   	vm = xe_vm_create(fd, 0, 0);
>>   
>> -	max_objs = (mem_size + overpressure) / chunk + 1;
>>   	handles = malloc(max_objs * sizeof(*handles));
>>   	igt_assert(handles);
>>   
>> -- 
>> 2.43.0
>>
