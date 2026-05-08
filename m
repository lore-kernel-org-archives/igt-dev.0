Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE31CD3436
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 07:55:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FCE10F3D7;
	Fri,  8 May 2026 07:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4FAqKr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D08410E5D4
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 07:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778226928; x=1809762928;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eyzVBNNRPrcAzDDbYNR4lp6bW8zVLsCAqd50rluLozg=;
 b=D4FAqKr7vHPRi+bRlJ0J7mxTr2AFs4rXAVkj8ksAqMaj0WkluqvEI3rE
 PREXFfo+u4GbRzdPxg4pKzrUuDI9r0N2ETU39jEmr15xK7iDTwD3NVXVw
 mOmIb47SyRKYI9U3zj/2A86j59FflWI45PiMso9Fdw5qCabuaF21al2Gq
 NBznbarPJGi7htopHymAHoyQxuPrA/gCJWUubBbEbqsORZXnE5bhifUe0
 T+iuCqJzw5wXzO6kEb7JQxvBzG4us4VK9DNU4gHsnthJQNm5KxUwsCkhY
 83c/eXQd8+g2J2ESW41+Ab5f8Gvet/WwywLLTILr8HbWzEhom1OkZtImS g==;
X-CSE-ConnectionGUID: xTQHtIg+R8KSiJC8g0ytGg==
X-CSE-MsgGUID: sryDHtmdT1eXW12X8DpK8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78336692"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="78336692"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 00:55:27 -0700
X-CSE-ConnectionGUID: OgRIvU3aS2Su2lmUofWZpA==
X-CSE-MsgGUID: eRExlLqrQtGfJTda75tfnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="235715280"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 00:55:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 00:55:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 00:55:26 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 00:55:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPaW2e17eDKu1zpH9MEXt8sML+sWsvqYY21BOSZdntSjpPS4YDWroRFj0bAiq/RM3Lu9BCGO2y9tsC5sJf2Yjvx9pc32uY+vt+Qb+F69kpxz/pxU6LB2wa/yQLIc0jUhyklZlSit7bSfPWGBE1s3oFwTKLMBA1iWdk+sP+JfmOxDArC+1oLiTggdGTl+CWJqJP9Efj6w9tOy3kXJdLxSk/IH+Q2cdxJdrIJQHu8sXt4lkG/QXndeCrMRGQvun3mz6OS8YFyQ+D1LamM41mTIwEUYGlkzp+d6GuDc0Wxw+zs5kePYRg0BPnYRIPdFcFFkYPuKSisH6mOEBjVuyq9R8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mJs5ILjZu/m0NuqInfclCmR+5PIMYhrl96gL5ko5Cw=;
 b=lwTSvYrYZKJKB5FJ8QM4BA5cXk2ATbbMIIuAQmGUI4qsW7Dc92a//0eqs8oJZe7Wpkzg6XU0hNBK1I0MwOEof1iKVpfbOkNNwnK6uKLel0nbnjsdOWwKTN5X2l9wYSI3w9lsayKJAXQ3Xgde62wyLnGAt6mDbw7r4p0HEITRIGeYIddeC5iVDZwcyrFrw0wbTiuC5s3zVQ2+HkLPU08OeyPkTZjctcKFF0gIeTKM/2mbW6/U1MidLIt54M+5IGbBWFGdk1paWbA7lyz4zkcm03/sqLw0dqSRSMK8aQY06HkNw8mz/3IcqyYbxA6uKAyMrg8hKsxSUwn2pXEHnL2ezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by CY8PR11MB7922.namprd11.prod.outlook.com
 (2603:10b6:930:7b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 07:55:18 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38%5]) with mapi id 15.20.9891.015; Fri, 8 May 2026
 07:55:18 +0000
Message-ID: <815c4a69-9d15-4ac3-a150-ce42b019a1c5@intel.com>
Date: Fri, 8 May 2026 09:55:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tests/xe_eudebug_online: fix thread ID math in
 pagefault-one-of-many shader
To: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260128113934.707513-1-jan.maslak@intel.com>
 <20260128113934.707513-2-jan.maslak@intel.com>
 <b82cf976-a87d-45ce-94c6-6c32ab8a4618@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b82cf976-a87d-45ce-94c6-6c32ab8a4618@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0023.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::35) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: e6aa9044-f899-4cb7-05e0-08deacd7256a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: +Soh93oNL/Rdsi4Kh8MhYOYv8vAxIbu2HKhcktxEDIoPyyi/LCVT+TMLq1wz49V4z+t7Fp+P30ei3PKblCdlYTbx5d+5zPzVJq54T++HAji5ec8a3Ok+VcVrHFfWKcDlUYNGYhXN8PBn9BCUplxeWpLMnFnRAS1ilm6OJbOZ2tqJS7nrJxctgDx0mXC8N07/TwM9t+gqVi5jp2RFqF39kHeV+hI5W9sNIAa6cB9Sor7DIhB+j0y1SrCv5FtcMMIqjMfAWvEbu4BObCYuGn0PBJxn6Xm/U6I1BRevEPwvAAWkBvTSXBeFP4GpDfoCfCACr6pEGSrAIv6kWxUPaitiljwpz1isdVULvOLMxS8zUXfnhBjRA8+Plte+csCD9SmRfLb5UdeX+AGIceLdIpHDAIALZMb1RBn6bFufAEK0Uue4xPPKKsUIPAavRYu+8MvVXdT74CN8Ly3KXoZw7tIQKUzs8CGfNcO6BLkX7JpiYis5WqZFiZLdcSzt0VR7jwid5a7QL+Y0dg1aTUCkQjqjM9MAj4Y1kITcluY2Onq/Sqquau43b4y7bTJK0Zs/gvrFkOc3oXvFMtVcaNVGkN74TymOkWHUoEWOZngfMojyHHMOTDrT6X1+ESze4+tXzrOfdMaxGg00Vz4p+Y4qt+HPBpkzplkA5joPqvzJfTMbCbmg0GGtoqYrh3B3KRrb+nXl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b09ZajIwTWdsNUQ3VUVMNk9ybEFsU3dzcDdhd01yNHIwcCtVaWxORnNIZm9Y?=
 =?utf-8?B?YVFGWkpIOUVZQUp3UzlYdDlNaWFXcUczRDBQYmRwMVNxbnB5UmxvQmdncWVL?=
 =?utf-8?B?WWgvbDFVTnhzVXh0RXlrMUdmcnJjeTJUS0RKOHRHb2paMVIxcTZBbTdyL2I4?=
 =?utf-8?B?aktpTm9HamVtMTJuY0ZWZ2duQURNbmI0QzVUTjJ4SHJYbGgwNU1vWVd3ekhl?=
 =?utf-8?B?MFJSeXFQbzhyY294MGl3VXFZV2JycTB4VS82NjNMWERjVG5pWGZqRVB4YXBJ?=
 =?utf-8?B?dVA4ak1QVG8weU1oNlVoSnVuRzNIbjdVVHh2L3dIOUEwSElvcmVRQlc2cG5t?=
 =?utf-8?B?S2FuL292YTdxa21PbVJxMTBLa1dnbWY2M2FGeFRJN29OeTFCQjFVYW1LTjM2?=
 =?utf-8?B?N0RiTldxMzdRSnRNSDJ5eWlyT2VTdGtpeWxMNldDcnVoSm9RdjlyQjVTWGJz?=
 =?utf-8?B?cFp6aVdBaWkwL242N1VSN0FRSU8ybnY5NURkam1rY3MxUklXbzJyNG1KZG9x?=
 =?utf-8?B?YkxKNHBCWDQ5ZVNQZitWRmh5NGl4aEdmWlErd3Y1aWFvSm5VMytnejdKdnAy?=
 =?utf-8?B?L3VRVUdjMWNDdGNOaE5iTnRKV1lJM2ZndEkvV1E1WnNlM3VRSTdXNkdLT2Ry?=
 =?utf-8?B?SndSOGdRRHR6YUpFbWtmNzZCeXhiUG9Ydy9KM3A2ODNCV1I2TkFCWEZDOWVx?=
 =?utf-8?B?ZHk1d3RoQkREaGkxV1VjeGh1V3ZCbDZhSXdsd0tadHFKaVRqSE5QUkk4MDhn?=
 =?utf-8?B?Mll5dmJGNDNKKzl3bXRlQ0ZXeXZSWXdxTHE5TncwSFBqNXowSmx4MXpicVBZ?=
 =?utf-8?B?cndjVlI4OXFYR2trRTJHOHhlWDNOQklnUnVFNXlZeTgrM1Y1TDN1Sys3Vm9s?=
 =?utf-8?B?eVdYaHJva3dUT2cxeGtTVWp1NjJScUYySGZHUXJoeXYxRHRzeE0rQXQ5MHBk?=
 =?utf-8?B?emlFcGdLYU93VW1tOVNMRkI4THN2Uk4vZlQ3YWlMbGs4ZzVsSGZXTkF0eXM0?=
 =?utf-8?B?VVFpcTU1MHZFeWJxcnVYTHJmZktvWVQ2eTlWNHpSMkN4MU9JbWhqenJlWXA0?=
 =?utf-8?B?cUtTNVIweERxZ0NLUUhTNWxsN2kvUk16WUtxSnhiZDNOa1l6bjdvWlhNQTll?=
 =?utf-8?B?T2R1NmI4THpkWW9zZC9oNEJ5aVRYOXNBYW1jckNlWWszd1JCeVBKbkdOWlhw?=
 =?utf-8?B?L2tZYmRURklWRklpZno3VUxwSWVIWGc2MlJWdUltenJpR09KK0hLTXkyc1Fu?=
 =?utf-8?B?UjZMcjVRVjg4L0RWemRwQ3F5ay9KcXVyNnlxKzIxNDdNWUVXMjJtNXU1MWx0?=
 =?utf-8?B?eW1lUmF5REF4V2ZNV2VsL29vRUFnWU5yMVNzN3h1K0ZxdndWK2lUc2lSbTlk?=
 =?utf-8?B?ZVpTRVA4cGVIWjFsUlZFN0Z1TStNSTF1c1ZCN1Rrd0lLaXVWUytnd3BVOUxk?=
 =?utf-8?B?NEhPdG8vazFpWTdKNjRhV2RTWTBQWUtVRnU5QnRJQmpkTkxoV2JZVnh5RC9Y?=
 =?utf-8?B?bUFkZzZsa1p2eDZCcXUyUnNaN2dSZUUybzNTTjU4YllJTEx5RURnRWhHYVVn?=
 =?utf-8?B?Q0xkZTQvalAzcHVLeWpjT2hhSDVDam5RM1V3aklLdGJaNjNHdWozWnk3cERU?=
 =?utf-8?B?b09kamNSYmV0aXcyZGZuRDFabENXbWZWTHZLbzBBMXpwSytUTnpHK051R25J?=
 =?utf-8?B?US9RdTQ5SC81a1dldW5iekVFY1IreXVUNENBcTlBTCtDZk11NGNJNnJ4MFhy?=
 =?utf-8?B?cGdod1EremNQaWhZR2NodVFqS3IzbTQ2bjcyRFI2NUFzUTU2amVneGpITnE5?=
 =?utf-8?B?ZjRwK055Qy9jMHlvNWVUc0tORldnL1FGUVVFKzBIUHpPV2hudURVaU9zK0VV?=
 =?utf-8?B?YmpRZDdyQkFGRVZneWh4UGJlaHBTR0Jkb3hXZ1JjVFRDSjlPREJSbTI5MXl1?=
 =?utf-8?B?TldrTzJFUFhMMy9VQTJMSXZtVWZSMnB4Mk83dmo1Tnd0K0JhT1BEaTFWeGJp?=
 =?utf-8?B?U1AyZkdiN3QvVUlMeDRKbUg3dnlNclVVQzJxalNIVERZaGFEcVFER2E5Vm9B?=
 =?utf-8?B?YXpraGJkNHJ0WXZneW14NGNhTEVaL1krMGkzWDAwbU5hZGFnOU8ydDM1aFdU?=
 =?utf-8?B?ZDhXd1Q1b0lBaHlZYzc5SlgzV09BdXRMSnpCaFlheTIzWEdNU2dIZ0VkaU11?=
 =?utf-8?B?RFg3SnFtNmliSHpxQWNSbGkrdmhubCtZWTl1eHVVdzFvOGNkVWpUOXdTNzl6?=
 =?utf-8?B?V29DOVF0SnpJR05JTnU1OFFlNm9iSmVJR0JRd2FZQWtMbG5SbUtMT2E1c0ZF?=
 =?utf-8?B?SlN3V00xd0Y1RGJ0SHdmTjhkakkveG9KcEFTbnRYSTJleUdoQWExUT09?=
X-Exchange-RoutingPolicyChecked: JzXoVQKzoWeDD5HuF3tQKcfH6PGdsaKfsHXN1VIJuVHf66FMcdmdr6lKBgA/W5Ian2wG9931iMmdysLd+i7SP+QlKs5VDzjXBCCe4/Cp1jBuqHXOfndt6Vz68LZEKut7qr1nSF793Qs5eGKMXkHJ8B3Cr3krBKw0cW4v2bE94ElB3A37NlecOvLn16H0BEi71CAzmYMx7kQWyeJA2h1vGcbzhFeeENiD7EMfmoXESc0cAccMaiYgpHUl3ptS8yHhxbF9Q+5bsrjVaqt4NM2CpDuJE0LzO9UrBsAozhMBRw7+1Crej2XvC5+w2i4DH8ma4uaOp9zTKOfED1dZFNOIBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e6aa9044-f899-4cb7-05e0-08deacd7256a
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 07:55:18.1827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9U2TI4ykEAvxzPhchL4ksU+uMz2g24nvSiGrUtQ3HoCsuGtb75sw5AKQgTIBxhV8nCb4poQqG83HkY9BSPvUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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


W dniu 7.05.2026 o 11:09, Maciej Patelczyk pisze:
> On 28/01/2026 12:39, Jan Maslak wrote:
>

Not sure why the subject jest revived after 3 months. Anyway please 
restrain before merging this patch, see below.


>> Replace the incorrect use of r1.4 (wrong inline field) with explicit 
>> dim.x
>> passed as an argument, then computing tgid.y * dim.x + tgid.x via mul 
>> + add.
>>
>> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
>> ---
>>   tests/intel/xe_eudebug_online.c                   | 5 +++--
>>   tests/intel/xe_eudebug_online.c.gen.iga64_codes.c | 7 ++++---
>>   2 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_eudebug_online.c 
>> b/tests/intel/xe_eudebug_online.c
>> index 084bdeb77..9f736af58 100644
>> --- a/tests/intel/xe_eudebug_online.c
>> +++ b/tests/intel/xe_eudebug_online.c
>> @@ -267,12 +267,13 @@ static struct gpgpu_shader *get_shader(struct 
>> online_debug_data *data)
>>       mov (1) r30.4<1>:ud 0x3f:ud
>>       mov (1) r30.7<1>:ud 0x3:ud // 4 bytes
>>       // calculate thread id: r20.0 = dim.x * tgid.y + tgid.x
>> -    mad (1) r20.0<1>:ud r0.1<0;0>:ud r0.6<0;0>:ud r1.4<0>:ud
>> +    mul (1) r20.0<1>:ud r0.6<0;1,0>:ud ARG(1):ud
>> +    add (1) r20.0<1>:ud r20.0<0;1,0>:ud r0.1<0;1,0>:ud
>
> Hm,
>
> mad src0 src1 src2
>
> does the src0 * src1 + src3, right?

No, it does: dst= src0 + src1*src2, see bspec.

>
> dim.x is r1.4, tgid.y r0.6 and tgid.x is r0.1
>
> so it should be mad r1.4 r0.6 r0.1
>
> Macros for those fields should preferably be used.

  IIRC the shader is correct, the only missing thing was passing DIM_X 
via inline fields, and it was fixed already.

Macros are hard to use due to baroque syntax of asm.


Regards

Andrzej


>
>
> Thanks for the catch!
>
> Maciej
>
>
>>       // page-fault only for arbitrary thread
>>       cmp (1) (eq)f0.0 null<1>:ud r20.0<0;1,0>:ud ARG(0):ud
>>   (f0.0)    send.ugm (1) r31 r30 null 0x0 0x2128403 // 
>> load_block2d.ugm.d32t.a64.uc.uc
>>   #endif
>> -            )", data->pf_thread_number);
>> +            )", data->pf_thread_number, data->w_dim.x);
>>             gpgpu_shader__label(shader, 0);
>>           gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>> diff --git a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c 
>> b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
>> index 3bd5b0c5f..2fe6bb7d8 100644
>> --- a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
>> +++ b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
>> @@ -3,7 +3,7 @@
>>     #include "gpgpu_shader.h"
>>   -#define MD5_SUM_IGA64_ASMS f0897ea23eff7ea77569eca6ddd16161
>> +#define MD5_SUM_IGA64_ASMS 7ab1b0da138a90599e4086c2c40269c9
>>     struct iga64_template const iga64_code_store_sr0_0[] = {
>>       { .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
>> @@ -24,13 +24,14 @@ struct iga64_template const 
>> iga64_code_store_sr0_0[] = {
>>   };
>>     struct iga64_template const iga64_code_pagefault_one_of_many[] = {
>> -    { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> +    { .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
>>           0x000c0061, 0x1e054330, 0x00000000, 0x00000000,
>>           0x00000061, 0x1e054330, 0x00000123, 0x45678000,
>>           0x00000061, 0x1e254220, 0x00000000, 0x0000003f,
>>           0x00000061, 0x1e454220, 0x00000000, 0x0000003f,
>>           0x00000061, 0x1e754220, 0x00000000, 0x00000003,
>> -        0x0000005b, 0x14040220, 0x02020014, 0x01440064,
>> +        0x00000041, 0x14058220, 0x02000064, 0xc0ded001,
>> +        0x00001940, 0x14050220, 0x02001404, 0x00000014,
>>           0x00001970, 0x00018220, 0x12001404, 0xc0ded000,
>>           0x04032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
>>           0x80000001, 0x00010000, 0x20000000, 0x00000000,
