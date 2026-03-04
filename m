Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8A2EFCE2A
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 17:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F2D10EA7D;
	Wed,  4 Mar 2026 17:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1ryRuZ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FF010EA7D
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 17:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772646937; x=1804182937;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=htwky5y+wYJNVJaRu5ReEv6uz3H0TxpxqVGKGLBxq+s=;
 b=Q1ryRuZ95r3oOGh6yGSSyqZl+ArwY/o24Rz93ggI0gwhas3/MYBxOdfN
 NZQTU8ds9DfnS18sxtNTGBRngJPSiIvb2sQQR7OU3UmFS+xIOQL/YpW5i
 Q8d9tCErAqK3kh8H8EwY8ocYb+8pFiNkeBUcxgT76+Di/HrPev5mCd4iL
 RsKld6C1fLj9rMZ7bkdZjozbOMatIjkIZKaBUXjAV6aBmi9XsUy0r/m6c
 G66umJZibK55daPx8ta5j+rputovAow16cM+SLPyQwFXqsnXdYT27FpFR
 9sGpKPxPHta58JbCnz74US/ohMldwyEVhJECdjyKP/HNsqmkgA3e15kbA A==;
X-CSE-ConnectionGUID: 3PyOIP5MRI2aWWDx6wAT1w==
X-CSE-MsgGUID: 3yCmF0jQSbCung2yX8+j+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84428186"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208,217";a="84428186"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:55:37 -0800
X-CSE-ConnectionGUID: IyVq1G53Qa+tTrzqN3N3ww==
X-CSE-MsgGUID: Qvds5OcFSkSbwaf4aNDXjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
 d="scan'208,217";a="215326939"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:55:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:55:36 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 09:55:36 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:55:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luXfn9ffR87WmDwWPAXouw5xoouL4bTfjM8pyck03TnPt3nJwIGDgAkWnIeiR5w31bLCeXmbKoxay0jWbFEogVHJaCB4dxW3VPqxjjj0by9Ua8MrWe5MBg2N9jiuRo1+Dgj4NVC5ZqU2ZcZdDc2CTMPK0+asLXz3PWZhGZ5ex0fyNJT6KYi+Wk7cj2czOECVqjwQ/23AMz/7/jeaKv0SU6iGlSepFCosD3ASjRgvLRRAJI3nnvRW7dHUX/xfwMYOpyQkcgkH9EODRPuNGfz6fln0GKw3618rYrJkNB8uu0/cc3C0cCFjRssgXWFNsLSh21BdB0xgDaoWcFD1jctddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycjoQY2cYXpj1EHIZR8rl1uTwKU2C82oioLXUgyCcOQ=;
 b=fFo2AuylDMtyY2hOZElvf5Wq0cMc4QDn48ndASZb1l1M+EHVw2S2QoNtZT7OZHF2OlfMT1du5lWyQIfWrefDQDgPY0ISoMa2VM+QBUznJyZRecZvMWA8Hd71HhDuNzUmfesdXg4r1rfstpsTG20kmaZ6QHYOWHVRgIKzgoLDdRiGRNUF+082ldnOHJP8OgnFZKuliqwtY5DtS129OFNMESl/CVo0xtkZX2ZYRHV6XcUlbwHYMg2XcvMt9yy94U5HifoHaoOgoJkZ6G/QwP7n38SlQN91m8H3hPyl51vIOF01SoczL1AnhL+omVGq92TsFIK08rnb3Wne6Bl1RgeA0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ1PR11MB6225.namprd11.prod.outlook.com (2603:10b6:a03:45c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 17:55:25 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:55:25 +0000
Content-Type: multipart/alternative;
 boundary="------------7nv0ixyuHb90zWn1z0xG3hbb"
Message-ID: <c9c34391-5227-49e4-b406-f37a8d505b9d@intel.com>
Date: Wed, 4 Mar 2026 23:25:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] intel-ci: Apply i915 chamelium delta changes
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Mohammed Bilal
 <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>,
 <kamil.konieczny@intel.com>, <kunal1.joshi@intel.com>,
 <karol.krol@intel.com>, <ryszard.knop@intel.com>
References: <20260302101926.3015380-1-mohammed.bilal@intel.com>
 <20260302101926.3015380-4-mohammed.bilal@intel.com>
 <20260304171144.uyyc6u4uw4ufephj@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260304171144.uyyc6u4uw4ufephj@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ1PR11MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: 935ff7d9-75ee-4db2-8b82-08de7a17367c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: i07K3Wnk1BGkp8hf2ENp2mdr+2e+Eu8qbK3i79FkdvVsEfG9XWDxBi1AB8vo47tpfbxpbZD450HrjoRsPbgjSXXPiO6Q9AmjEVQoSSrkaoQDHWy9ZGqrZeZx5E8j6gKDfmyEJJj+Imt5T/iE8GXHANlFB5vOOsZj9LsYcXrFuD9cFimCmgA1/N33MbMn4kGKC/E4jPbgMh5woyPyF3ugE6KY3MJo8bQvh0WOmspjbQLGSSpViWI5hzCKyvC+pQLZfqdnv8tjMj/hUUVxFiEvf5gaPzdpJSAAGaV7K5/GL8/N20VeMVsThd2SngdDXX8sF6PqgIf5JuO+rntxsR2rq1i+ndDA14n2TH2IVmSIE17dLj1E73/Rb8o3yB9mWsU+ciUUpiFJoXEN18jKEq5oao7ChL8/zu/Idhjvf/remk6JaSlutQHyxdaE8+X7Gh8lHtvLrwkUv0ew079L+DR0FeGlqY0/fXhYc9c5o3PZiz3A18DBam9e/Nc9FwwhOfK3zI3OraE4+S9/t0Zh7dflEFTYEjxbws+iyx6WQach9IiahBNHwAufJaNdzJtzNOA0UlYL7WCmxJdJ4Q3m39EFPVRrys3BlK1xR1P4jVGTC0EuoXJAtWnidFt4SPvjyMK1y3xP52YAH8NCmiiqWCaqDxgOQF2kJxFyLVA5mbEwVKcyf/tQ4m2D0REZT0SA09kqMUFeuORmezGTbbUMGbhJ+dDfm+0uB6GDVqv7chI7XkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjhSSzVYeGttUWpDMEl6cHFIb2ZuOTR6ajZFc1c0UmJUVFdtcDhUU2t2c1dQ?=
 =?utf-8?B?K3djdEhHKzlCT0VtSkdockYzeC93SXBxRWs4OXBrNnZITHlQOVVBTkIzVzM0?=
 =?utf-8?B?ci83WVBSVGgzNG8zZDlKSDhmS1pMaXhKZTBpeUNPK1ZNVWwxVml2SXcrWlJh?=
 =?utf-8?B?MTZPOXhURkJGLzd0QUliUU9BeEZiT2sxYWkrYmM1NmYxMS9QbWJjNkVmWEI4?=
 =?utf-8?B?bW9QdGcyS1BFWlprQTgxVytLdERVYWxvSmtMYVpYZWFPTmlYY3RTN3FndnJM?=
 =?utf-8?B?UWtMTVNiRlFjbSthcWZsREVhTFJYOTZtbUZnUzNVaS9QTVRMakQ0N2NHV0RL?=
 =?utf-8?B?OGZkQmUrS0hJcXhydkdIYXVXLzNRaUJuZGpCWHYybXhzT3o2R0RTalo0UVlV?=
 =?utf-8?B?OWRvRi9JYTU1dzdnZC9ZYXF2ZEkzUS90M2hITXVvWVl1MDZhanJCOE5QR1ZW?=
 =?utf-8?B?SFR5ampKczFUNFExeG5seUZkYjhGKzFzTC9WUFk0UGErQUhsbWhIdDVOb1Ex?=
 =?utf-8?B?eTMrTDA0YlY3anlsWGtMZFk2VTc5RUdsMjA1MVpnSVFnMUtPemIzMTdxeW01?=
 =?utf-8?B?enl0N21GODhEMEh1dmUzS25PU2ZVZEFnMlkrUTRpeGhnc1IwczRiTVY4NFhz?=
 =?utf-8?B?RU1qSy84N1o0bEk4bUlweUtTVEREQjB5WTNWOG1GS2l3eUloS0w2T1Jmc2dZ?=
 =?utf-8?B?dktCaVlXV3ZMZm8wUzZaYWZpTmQwcnltNGNQenlVY3JscUFES3VWOXZHbDlW?=
 =?utf-8?B?ME9wb1FBeUFkczRwb2NzZHhIL2hHVlhsUldtM2hGTXZGK251ZlNhcVFhY1Fu?=
 =?utf-8?B?d05ic0dDN2hSL0dhQ05SMG9YTlBleUVrY09JOGt6aGZ4SFlSK0ZySEtrWVJR?=
 =?utf-8?B?TTNFd3pFSzIwQzl5SSt5YUVGR3Brbjd3S3JadHlvTWhzSzd5MzVrMzYwM3Bm?=
 =?utf-8?B?aUZUSS9PdFZlbUcrMnkyZm5saTVJamZwMFpscXRCT1drRnowYUlZcGxvZDRt?=
 =?utf-8?B?K0JHdW0xQWgwZ2hMOHR4U2x4T00wM3RDUDl6Y2N3TzZ4MjFOa25DdFBhUlNV?=
 =?utf-8?B?VTZGd2ZkdE1BcVpMQ0FxemZWT3MyeEFDMDBXbStjdGNWTGJqdU9OYXZpNW9L?=
 =?utf-8?B?SzhwNmMzdXFmTVkydHdzamd0ZmZlSXJrRUdPd3MxU0tZWWFhSVNZZTFMMXdG?=
 =?utf-8?B?RlN2N1VCQjNON0hDTmRCcjVBMjFMVVBwWVBadFFiN2g3ZG5xejlGY3Npc0NY?=
 =?utf-8?B?RGlEUGNDWlF1RDhDVlBNbDFkVElLYythc2RVSmdpZDYyQjZPQVVWdVVDM1hM?=
 =?utf-8?B?OEdINTkzbXVnaUpIaHlmQlhjNXVmeXh1SnFiZ1lQMDlHNkZsRGRydzNTcEdv?=
 =?utf-8?B?c0M4T0ZsenZ3enhZODhEYnh2bnpGL2xJLy9KRmtiM2IvTTBGTTB3SXNkTHpN?=
 =?utf-8?B?QzVFMUNpRWlORWl0NGJIT1pqOE02M2QxYlpOSmFJMHMvRVJxVnQyOE82OXZ2?=
 =?utf-8?B?TG1aVzQxZWpuRWRZSXlGYVU3L3FBZUFkV2ZFcDVXSTNQWVozTkdtR2czN0RS?=
 =?utf-8?B?RkxnbzVwQmlKbmtpQWpaQ0tYSmZOeGZLUTFuR2IwR0NXeHRPRTY5OVMwaW40?=
 =?utf-8?B?MzdKMXlERWJjRUNHRDg0MUcrM1puQks2ZVdZcmdOWUJ0Z0VtTGpoZHExUnJ0?=
 =?utf-8?B?NEphNEltaWJVeTZYRWdZQ3cvUUZSSTJQUDV1cUZaVzdFRFk1a3NEa09NdUxB?=
 =?utf-8?B?Uk9OTXlqKzZiWEtkSEw0ZXpyWW5OUDZXTUppR0RkeHZXTTZNTjIvWU5nWnZ4?=
 =?utf-8?B?cUhEUGNsei83YlpUOW5DM3Z3NVFONGxRMXRleUlkTkZwZWhFclZlc3ZZSTg4?=
 =?utf-8?B?NzFveG5ING1LcWplMnp4THVLVmIwQXRQM3d4eUg2ZFpnNDV5Q2o2YmZrNHQr?=
 =?utf-8?B?dG1MQncwRXhLc2hvbFloVzdjWUZuNUJmUWRPTUlWbHliLzdoYmhuZWV3QkFt?=
 =?utf-8?B?N0NPeTRQMlREZHBQU2RGK0pMcXEzTUtpdVJUVWxhYVRBTmdrQUQvS28yMTVF?=
 =?utf-8?B?ZUp2azliSS9iclU4N2FSQXZLcHcvbitSWHZEUFlXVXE3TXFCa05vaStEWThH?=
 =?utf-8?B?MVI0WFA3WmNsOTlGR0dDR1pOL3RIU0pYY1JRVzY3MW0wZUlKU2FzbE5BV3dJ?=
 =?utf-8?B?eFZhZmNoUGIvS3dTNS9JME9nNE5Db2d1V1hUUVh4TjdFbTE1UW55RGdkT2cv?=
 =?utf-8?B?cmtteXdjWFU0MjdqWGc3U05XMHdMSDh2dXloWHBxNEw1Z2paSklHRVV6cjB1?=
 =?utf-8?B?WXVOMlVkR0J6TmtWSkZoQ2lQSDJud0JlQk1YN2p2bnRvelZEdmJNRENjaGpn?=
 =?utf-8?Q?gS/WX9QoNf1a699o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 935ff7d9-75ee-4db2-8b82-08de7a17367c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:55:25.5053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WszmxgGwVP3KnHXmn3F3g1T7GnoVDtMoYgxtlm9DmEyH7gx5W8VoHRJ6ZFfA/YBAuOUY5dtbxxRjMQrkXd7zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6225
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

--------------7nv0ixyuHb90zWn1z0xG3hbb
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bilal,

On 04-03-2026 10:41 pm, Kamil Konieczny wrote:
> Hi Mohammed,
> On 2026-03-02 at 15:49:24 +0530, Mohammed Bilal wrote:
>
> could you be more specific about changes here? imho:
>
> [PATCH v4 3/5] intel-ci: Apply i915 chamelium delta changes
>
> is a little to vague. What about: Remove random tests
>
> [PATCH v4 3/5] intel-ci: Remove *-random tests
>
> and then describe that you also moved suspend to end
> and cleaned up descriptions?

Can we split this into 2 patches?

1. As Kamil suggested, Remove *-random tests

with commit msg why random tests are being removed.

2. Move "s/r" tests to the bottom, again with commit message

describing why part.

>
>> Apply i915-specific delta updates to the FULL chamelium
>> testlist by commenting out non-deterministic random-plane
>> subtests and moving suspend related subtests to the end
>> for stable ordering.
>>
>> v2:
>> - Move suspend resume tests to the end of the testlist (Kunal)
>> - Comment out random-plane test (Kunal)
>>
>> v3:
>> -Use move-fix-add approach (Kamil)
>>
>> v4:
>> -Restructure move-fix-add approach (Kamil)
>>
>> Signed-off-by: Mohammed Bilal<mohammed.bilal@intel.com>
> I will wait with merge for ack or r-b from KMS team and also CI.
>
> Regards,
> Kamil
>
>> ---
>>   tests/intel-ci/i915.chamelium-only.testlist | 23 ++++++++++++---------
>>   1 file changed, 13 insertions(+), 10 deletions(-)
>>
>> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
>> index 9adace28c..56bffd8de 100644
>> --- a/tests/intel-ci/i915.chamelium-only.testlist
>> +++ b/tests/intel-ci/i915.chamelium-only.testlist
>> @@ -12,16 +12,14 @@ igt@kms_chamelium_color@ctm-negative
>>   igt@kms_chamelium_color@ctm-red-to-blue
>>   igt@kms_chamelium_color@degamma
>>   igt@kms_chamelium_color@gamma
>> -igt@kms_chamelium_edid@dp-edid-change-during-suspend
>>   igt@kms_chamelium_edid@dp-edid-read
>>   igt@kms_chamelium_edid@dp-edid-resolution-list
>>   igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
>>   igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
>>   igt@kms_chamelium_edid@dp-mode-timings
>> -igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
>>   igt@kms_chamelium_edid@hdmi-edid-read
>> -# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
>> -# removed test as its having a mode 4k@60 resulting
>> +# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
>> +# removed test as its having a mode 4k@60 resulting
>>   # TMDS config errors on v1 board
>>   #igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
>>   igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
>> @@ -33,17 +31,17 @@ igt@kms_chamelium_frames@dp-crc-single
>>   igt@kms_chamelium_frames@dp-frame-dump
>>   igt@kms_chamelium_frames@hdmi-aspect-ratio
>>   igt@kms_chamelium_frames@hdmi-cmp-planar-formats
>> -igt@kms_chamelium_frames@hdmi-cmp-planes-random
>> +# Tests are exhaustive and pick random configurations
>> +# removed tests as results are non-deterministic on each run
>> +#igt@kms_chamelium_frames@hdmi-cmp-planes-random
>> +#igt@kms_chamelium_frames@hdmi-crc-planes-random
>>   igt@kms_chamelium_frames@hdmi-crc-fast
>>   igt@kms_chamelium_frames@hdmi-crc-multiple
>>   igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
>> -igt@kms_chamelium_frames@hdmi-crc-planes-random
>>   igt@kms_chamelium_frames@hdmi-crc-single
>>   igt@kms_chamelium_frames@hdmi-frame-dump
>>   igt@kms_chamelium_frames@vga-frame-dump
>> -igt@kms_chamelium_hpd@common-hpd-after-suspend
>>   igt@kms_chamelium_hpd@dp-hpd
>> -igt@kms_chamelium_hpd@dp-hpd-after-suspend
>>   igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
>>   igt@kms_chamelium_hpd@dp-hpd-fast
>>   igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
>> @@ -51,7 +49,6 @@ igt@kms_chamelium_hpd@dp-hpd-storm
>>   igt@kms_chamelium_hpd@dp-hpd-storm-disable
>>   igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
>>   igt@kms_chamelium_hpd@hdmi-hpd
>> -igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
>>   igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
>>   igt@kms_chamelium_hpd@hdmi-hpd-fast
>>   igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
>> @@ -61,7 +58,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
>>   igt@kms_chamelium_audio@hdmi-audio
>>   igt@kms_chamelium_audio@hdmi-audio-edid
>>   igt@kms_chamelium_hpd@vga-hpd
>> -igt@kms_chamelium_hpd@vga-hpd-after-suspend
>>   igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
>>   igt@kms_chamelium_hpd@vga-hpd-fast
>>   igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
>> @@ -69,6 +65,13 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
>>   igt@kms_chamelium_hpd@vga-hpd-without-ddc
>>   igt@kms_chamelium_sharpness_filter@filter-basic
>>   igt@kms_tiled_display@basic-test-pattern-with-chamelium
>> +#Place suspend tests at end
>> +igt@kms_chamelium_hpd@common-hpd-after-suspend
>> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
>> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
>> +igt@kms_chamelium_hpd@vga-hpd-after-suspend
>> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
>> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
>>   #Place hibernate tests at end
>>   igt@kms_chamelium_edid@dp-edid-change-during-hibernate
>>   igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
>> -- 
>> 2.48.1
>>
--------------7nv0ixyuHb90zWn1z0xG3hbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Bilal,</p>
    <div class="moz-cite-prefix">On 04-03-2026 10:41 pm, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260304171144.uyyc6u4uw4ufephj@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Mohammed,
On 2026-03-02 at 15:49:24 +0530, Mohammed Bilal wrote:

could you be more specific about changes here? imho:

[PATCH v4 3/5] intel-ci: Apply i915 chamelium delta changes

is a little to vague. What about: Remove random tests

[PATCH v4 3/5] intel-ci: Remove *-random tests

and then describe that you also moved suspend to end
and cleaned up descriptions?</pre>
    </blockquote>
    <p>Can we split this into 2 patches?</p>
    <p>1. As Kamil suggested,&nbsp;<span style="white-space: pre-wrap">Remove *-random tests</span></p>
    <p wrap="" class="moz-quote-pre"><span style="white-space: normal">with
        commit msg why random tests are being removed.</span></p>
    <p>2. Move &quot;s/r&quot; tests to the bottom, again with commit message</p>
    <p>describing why part.</p>
    <blockquote type="cite" cite="mid:20260304171144.uyyc6u4uw4ufephj@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Apply i915-specific delta updates to the FULL chamelium
testlist by commenting out non-deterministic random-plane
subtests and moving suspend related subtests to the end
for stable ordering.

v2:
- Move suspend resume tests to the end of the testlist (Kunal)
- Comment out random-plane test (Kunal)

v3:
-Use move-fix-add approach (Kamil)

v4:
-Restructure move-fix-add approach (Kamil)

Signed-off-by: Mohammed Bilal <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.bilal@intel.com">&lt;mohammed.bilal@intel.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I will wait with merge for ack or r-b from KMS team and also CI.

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
 tests/intel-ci/i915.chamelium-only.testlist | 23 ++++++++++++---------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
index 9adace28c..56bffd8de 100644
--- a/tests/intel-ci/i915.chamelium-only.testlist
+++ b/tests/intel-ci/i915.chamelium-only.testlist
@@ -12,16 +12,14 @@ igt@kms_chamelium_color@ctm-negative
 igt@kms_chamelium_color@ctm-red-to-blue
 igt@kms_chamelium_color@degamma
 igt@kms_chamelium_color@gamma
-igt@kms_chamelium_edid@dp-edid-change-during-suspend
 igt@kms_chamelium_edid@dp-edid-read
 igt@kms_chamelium_edid@dp-edid-resolution-list
 igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
 igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
 igt@kms_chamelium_edid@dp-mode-timings
-igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
 igt@kms_chamelium_edid@hdmi-edid-read
-# Chamelium v1 board HDMI receiver supports max 4k@30 resolution 
-# removed test as its having a mode 4k@60 resulting 
+# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
+# removed test as its having a mode 4k@60 resulting
 # TMDS config errors on v1 board
 #igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
 igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
@@ -33,17 +31,17 @@ igt@kms_chamelium_frames@dp-crc-single
 igt@kms_chamelium_frames@dp-frame-dump
 igt@kms_chamelium_frames@hdmi-aspect-ratio
 igt@kms_chamelium_frames@hdmi-cmp-planar-formats
-igt@kms_chamelium_frames@hdmi-cmp-planes-random
+# Tests are exhaustive and pick random configurations
+# removed tests as results are non-deterministic on each run
+#igt@kms_chamelium_frames@hdmi-cmp-planes-random
+#igt@kms_chamelium_frames@hdmi-crc-planes-random
 igt@kms_chamelium_frames@hdmi-crc-fast
 igt@kms_chamelium_frames@hdmi-crc-multiple
 igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
-igt@kms_chamelium_frames@hdmi-crc-planes-random
 igt@kms_chamelium_frames@hdmi-crc-single
 igt@kms_chamelium_frames@hdmi-frame-dump
 igt@kms_chamelium_frames@vga-frame-dump
-igt@kms_chamelium_hpd@common-hpd-after-suspend
 igt@kms_chamelium_hpd@dp-hpd
-igt@kms_chamelium_hpd@dp-hpd-after-suspend
 igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@dp-hpd-fast
 igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
@@ -51,7 +49,6 @@ igt@kms_chamelium_hpd@dp-hpd-storm
 igt@kms_chamelium_hpd@dp-hpd-storm-disable
 igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
 igt@kms_chamelium_hpd@hdmi-hpd
-igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
 igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@hdmi-hpd-fast
 igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
@@ -61,7 +58,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
 igt@kms_chamelium_audio@hdmi-audio
 igt@kms_chamelium_audio@hdmi-audio-edid
 igt@kms_chamelium_hpd@vga-hpd
-igt@kms_chamelium_hpd@vga-hpd-after-suspend
 igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@vga-hpd-fast
 igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
@@ -69,6 +65,13 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
 igt@kms_chamelium_hpd@vga-hpd-without-ddc
 igt@kms_chamelium_sharpness_filter@filter-basic
 igt@kms_tiled_display@basic-test-pattern-with-chamelium
+#Place suspend tests at end
+igt@kms_chamelium_hpd@common-hpd-after-suspend
+igt@kms_chamelium_hpd@dp-hpd-after-suspend
+igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
+igt@kms_chamelium_hpd@vga-hpd-after-suspend
+igt@kms_chamelium_edid@dp-edid-change-during-suspend
+igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
 #Place hibernate tests at end
 igt@kms_chamelium_edid@dp-edid-change-during-hibernate
 igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
-- 
2.48.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------7nv0ixyuHb90zWn1z0xG3hbb--
