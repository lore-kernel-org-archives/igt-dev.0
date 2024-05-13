Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605A4C25B78
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 22:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32EF10E823;
	Mon, 13 May 2024 22:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dA71H8RD";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D4910E823
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 22:06:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFA4E1C3UFN5UlXIzljChNJrUtbDNBp5Ly/5JcfVxgsW79KwPXiXL8TmUMKkDFxfe2i/H5dHXUWp13ksF8Y4fh0xqyTaEX/LOpcgZbLuV7QcN6FfctjuXUt5se4dXpRERSV/v8WL9nUwPtjDypOAAYVcWSJBK6N9Afx6UEeAuzYQ/SKyfKL+duRemAT2DoEPFKz2AtObSOTX9U78rb7e618OC0wY/7dXUODGTYHjT5w9HgfYD0RYEh2pA7g8N65+nqDl5cNDfeDmBKGyImAPgoe0VsJWAJckz5xbWZoHqgompLdY6HNLLbZZNvcUYUWEgO1axIBwNroWEPwapgtJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcrA4T2KkKVX6hXhHWQLGD+bvvlYLS3Vg1tc7pssLrE=;
 b=IxPGAh/aqXE4xtT6pOJnC2o6ZyINxgIK5kx9TO8u8OQT/xL7J3mNAp+VrYZ4ApWBbBTR8Mx5gJSA0i8tEyhTxY6Nv1UQWzeg/nMHyC/liSp5c7DoLxeyHSP9QxikYVyw9CA5KlCJwou5Z2696QVjUtF0fsniwR5eNAUFo9CC2dqPmhJKbP8dUkfxCXs9ffDgjH/F9+Lat3EZbubbp0QZALt3ZRHpTTEpzskk3pCJzGIuPQFzTkCH/el9OPPo0uQbLfUs6BQzyuY1DCmXyFc9ylcSKFvkxU/nJ5XBcAyYFP12CY8su7OmcqTD6u2qPqYaT0gvV+/h22W0539hk35HQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcrA4T2KkKVX6hXhHWQLGD+bvvlYLS3Vg1tc7pssLrE=;
 b=dA71H8RDeifPhhIDY6EtE7xlk2PB4CrY+OZWVasysWVUxmfYH24lqsNE5JnHa3Isl4b9wRq2aqxLhrtoecT5F0YOufATxtFf5Xal1mPEksaNK7TWIXRW6GvG4MI2ksTXpnoISL78+bWf0XmPghmS86wGyBQSB7nqKnsE0wJs/Vo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:314::18)
 by MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 22:06:41 +0000
Received: from SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::71c5:ea8:a3c7:4c77]) by SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::71c5:ea8:a3c7:4c77%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 22:06:40 +0000
Message-ID: <07e5ac71-1be0-4ad9-bab1-e403db1eb59d@amd.com>
Date: Mon, 13 May 2024 16:06:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_writeback: refresh to expose writeback output
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, igt-dev@lists.freedesktop.org, 
 harry.wentland@amd.com, hersenxs.wu@amd.com
References: <20240513213041.583437-1-alex.hung@amd.com>
 <3b525e79-8387-9cbf-7e96-8092ffc757a8@quicinc.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <3b525e79-8387-9cbf-7e96-8092ffc757a8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:303:dd::8) To SA3PR12MB8802.namprd12.prod.outlook.com
 (2603:10b6:806:314::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8802:EE_|MW3PR12MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f4d452-9b57-4496-ce23-08dc7398f75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzlycHR6NDZqRFNwN2RmSnFSYTVSeGd1akY5QlRJV0lxQUExaC8xTC9vQ2Vl?=
 =?utf-8?B?QkpYYi9lSFdlUWQ4ZGpPRE01TnYxR3FicWtBeGpORURpNkoyZUtUblQrUjJu?=
 =?utf-8?B?a0N5VnhoeVhqR0l2REF2SCtaejNnVFlERlhBOVhsS0pqTUIrYTFjN0UyL096?=
 =?utf-8?B?WCtUbFh0cSsvTVpiT1QrWmtVRkVxRVZ0UlZXY3BaVjV5SWw2amN0R2xCTU9G?=
 =?utf-8?B?Qk5PcnFzaFk2VVAveGxGdFd3RGY0RFJ6KzJVUUQ5U2NtU1FwZFRoUFUyZ2lG?=
 =?utf-8?B?N00yajJQZ3k1N2NvVllQNnVZb0c0eWw4VnFYTDJucXZsTXovanRxY1ZhTUk2?=
 =?utf-8?B?SmxxVmkvY3dhTmdiajdMQXdPYk1UKzJ3Y05KdG93cTJWRnhzeFA2VmxvRUFB?=
 =?utf-8?B?VkQyTkdsYnM1b0VrTzVGOGtSZVFNQUVwYTAwU3VyQjQrN0x4eVhRVVFWN1Nk?=
 =?utf-8?B?Y0tuYndIR0xsNVF1NG9kaTg1NENvSkJOeUZSQy9zdEJqTHdmQUM2ZE9uT0ts?=
 =?utf-8?B?RkNJdmwwNUtLLzlyVC83ZjEyYThJUDRFNzQ0VXdLTjFQSVB6bmdjdHBaZkNk?=
 =?utf-8?B?MW9yVk45ZG12QXRWRHNHb01BeDFZZks1ZnBldG9od2RjeUJkVC9YRGZIcXZy?=
 =?utf-8?B?c3gzTEtPbjRkRlUyVFdHUU9rUzltNGlDOERkWGVrNkRLaEtxSGgzYW90QkNo?=
 =?utf-8?B?U3BMWTVhMHVyQXppSGpNd3krK1Jla3YxbklWUWVCcS95a0Z5RmhuQkJWV2c1?=
 =?utf-8?B?aFpMa0RYVDNPREhBYWVoVkZMb2tnNGNWMm8vZEhBQURENXNhYm5tTjBtUitD?=
 =?utf-8?B?T2xIbGtaWmUwN1NqN2luS1RMelo3QWcydlJvcDUyb09rZXhIdzMrblQ2QzNL?=
 =?utf-8?B?cnVoS3R5SE1RZTQvK3dCTm82NFYwMnF4RjV1Szl1aHNlOW95RkZBdFRRNk5p?=
 =?utf-8?B?N1lSeHE1MHFSTHU3dGVQaktXZ1pMakpyZUxvSmoxR3F4WDlHVWNYU1dvaWJP?=
 =?utf-8?B?cDdVaGdXVTFobCt3UFIwc290N2ZTcytlUUFTd2JjUWdBeWhYOVJPaEUyY0xG?=
 =?utf-8?B?NVpWdldlYk5KUlVPVTFTT3hvQnVjNHNsOUNNN29kTkZxTXNON25ETVFmK0Mz?=
 =?utf-8?B?VDh2Z0VBeU5yOWZLNGtJeVg3LzZsK2RkeVUySTBjKzh4S0k4ZWprdnNjVmNl?=
 =?utf-8?B?aDhKVkpYc3Eyc0ZNYnlwSUU0eTg4OGx5UlFEUC8vamRNWk83MWV3VWluSXo4?=
 =?utf-8?B?MlVXWFVQcG9pdTAwbjhSckJtaFhqNC9tdUEyUkpJRGZ5Ti9zcG1oamVkZnF2?=
 =?utf-8?B?WktBcys1L1k4ZFd6QVJqTHhkVmU4aVFRelVaZzMwUzNjK2ZIZndCODBEK0Zz?=
 =?utf-8?B?MkNCQVl1VVdGYkFneXFNM2xhSFBGa2xEUFc1TzBCVFhsYTA0ZGF0eEJpMktI?=
 =?utf-8?B?elp3YlFwaGpkYm5xbmRBZlVkbFlRTnZwV2FqU3J4dmJOVFpLZHNraWhRY1dq?=
 =?utf-8?B?U2krL29EM0ZIbytZYVJ0ZWJFbklyMmVJd1B0K2hFWVMyUURBZVRkVkJySWd1?=
 =?utf-8?B?WS9uSnBHQU5RT0dQNG1LbXRqVlIwU2I2NThPMzRDYlh1UlAyRXN0cGFZU2ZN?=
 =?utf-8?B?aWMvSk81OUtaWFdLN2JkYW9PVFhOTFE0a1hlMDR0NXUwNElhZWh0WmxmbE1j?=
 =?utf-8?B?WXB0TmVuazA4QllDbWcwemFBRzdvUmJ1ckQwWHlRa2ZhUU5Wa1AyMk9RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR12MB8802.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHlnZjJaeDd1aS9IdHlNUCtGVGVOSWt5Mng5c2RzVzFhemEyVVBuOE85V0s2?=
 =?utf-8?B?SGtScjhVcHlGTWxBTGY0WTVZZWRQRnF3dHJnT3hPaEcrNy9ZbEFvMHlpMGJQ?=
 =?utf-8?B?eGkxa0xKOGc5ZnBmSVE3THJMV0RSbTc0NFVxNUJ4SzRCM1lId2VYa0pYNFNI?=
 =?utf-8?B?a01ZMlY4V3B0NFJBeEpvczFjMWdLUS84bE80aXhpWno3YkFhTVFyVU1aanNX?=
 =?utf-8?B?OUE4RlFhbXZuZEVubW05dWt2S2pkbll0QmF0dkNHMFNJMTdDVUhyeGJWWENI?=
 =?utf-8?B?a0tKQ251YUlsdkFjcGU3RUNwQzUvRE1IKzNaY2dXL3RTTW0yUUU0TGlNWEYy?=
 =?utf-8?B?dkQrNnRPRVBYZ2s5L3JVTWxxTFZNRjByR2FBcUx4QVQ2VCtXY3psSGNKTS8r?=
 =?utf-8?B?Z2h0Z1drSVlndlZJRWcyc2d3M242NE1HYXlIbnREQ0RxYUtRd3ZvZFZOdGdq?=
 =?utf-8?B?dHdMVkZOUUNVeElJbWpKYzNNWGdjczhrci9Zc1FmbkJlbWlzNE9LSTZnRm1o?=
 =?utf-8?B?bGk2ajdhUGR6QjM4RjBpUUI0Qm14R2lHR25kWi9nS2lvY2FneWFEQk1IeHJC?=
 =?utf-8?B?amNQVzhYYVZGaSs5c0VpS2dKN2JiVllBdGlpNVBPejh6Z2RoRFk1OGpUN0c4?=
 =?utf-8?B?NTNhb282ajJMMEdvRlZMUGtYOWFiaUozNy9PRVloeUY4YkEwZGMrYjlXYUdW?=
 =?utf-8?B?ZXY3cmhIemRyQ0MzakY2N1U5UVdIdEZDSG9MZmxHYVF5LzZ6OXpid3FuTk1j?=
 =?utf-8?B?V3lWZFdZaDRHNmtYYzRHRlpSMUNXMmdyUGpuUDZsdjhwUzE3RmpPekEvcUpq?=
 =?utf-8?B?SDNJVU9QRVpSeXBZVHlCbHduRElCSEtMakozbEJYWTdNL2x0OEtiRFhiWVpZ?=
 =?utf-8?B?Y0tCR0xhK0xHcE5OK29RMUdLak9mWU5YQVB3ZW5SVmpQTmZ0cU82SzBoTTFj?=
 =?utf-8?B?SnZrbEJIdmFLdjVPMWFyQzVCV0pNWk1ZTGFIQTA2Ty9jTVpVSEZ5MmN3endU?=
 =?utf-8?B?Ym1iajFraEN0RDQ2dWR3NTlMTHVJT1BzT0pEWGJJam12cEFTbkFXNG80TXM0?=
 =?utf-8?B?Vi9FNW9aUzY1KzcrcmdKNzJDSERxNmk5WGtpc0M1SE5DNEJGcnVtMzRsaVJF?=
 =?utf-8?B?MUZHTHNHZUxzZmZsL1hMWjdrRHkva2ZTRXRpVU1uQ2p6Tm1jV1FJTUI5eGd0?=
 =?utf-8?B?Vm9HK3ErcisyWmwrb2dZdTlKbU41TFFnVGNaVnVFaHUzRWRmS0FBNW5jVmZR?=
 =?utf-8?B?STR0NUZBMC9mbFJDR0pJQXZTTGkwRy9uUG9URDNLQmUxVXdUdUVwV3djY2x2?=
 =?utf-8?B?aVlLYklXT0ZESFRkOEwvTjdEOE94VWZkbnlmWWFaZ2d5bU5ydGhkbXBtOWVs?=
 =?utf-8?B?WXJYdUhDdWE0UEo3azRuaXlFZWV6SFM3RkR3dFlWN1dnMGV3dTI0YkZNV3Rw?=
 =?utf-8?B?cmVZckV0Vjdjc0dpMCtEelcwcHUwYk1iMjFGb1RjT29idFhSNHhlVjM2NUxW?=
 =?utf-8?B?eW9scW9STTllcXpDU0crb0NQTURqd3FLdUVYMVVtdEpYZFVubEY3NE52c3h4?=
 =?utf-8?B?MC95WkdzdWh4NXorT3ROQ2VQZTVadGg1Wm82eFZUMnNqKy9LVkQzR3FEUmV4?=
 =?utf-8?B?TFphbkk5SFUzYlZ1TFJ1SXpqUk1HZk1adjdBOWwyejlXTVplRnhEd3JMdHlu?=
 =?utf-8?B?UnRHTE9qYVVWaU93TG1RbWRjdmRGYjRwSFE4a3U0MGphUUNtY2RmUEpCQTIw?=
 =?utf-8?B?bjFpTkdSU0hyZlN5eXplMGFGRGRNZFJ5cCsrcW9Mb3JaSkg2QnZobkR6RU1Q?=
 =?utf-8?B?bFc3em4wSEt3MXdlK0Jocit3QXJ4YmRsSU5Gdng5cStENUtVYmtLOEFyTW1x?=
 =?utf-8?B?RTZVZ1hJcm16L1VLUkYwVVdJNkgrRkhsMS9sQU5KSWpURmdvSHNhdW5lUG1G?=
 =?utf-8?B?YWhjbHcxVnQ1RHp6UzFPelZ2VFVQR1pCSTdpK2kzTUowVUJ6aXI1UkFxemRU?=
 =?utf-8?B?NDJZSjhaZHlJNC9XTUg1YTZ1WlFZbTBmaENTTlJxK2dsa1ZtaldLWHZUSTJr?=
 =?utf-8?B?Sk9XM1ZSQ0hNa3UzdjlnN0JCZGdVREFMNkk4dWh4WklGcHUxYWIzaENndGRx?=
 =?utf-8?Q?8PN05AkqrwN6OjM/wdiaQreoS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f4d452-9b57-4496-ce23-08dc7398f75a
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 22:06:40.3637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSqxvbyyfNL43g2HiUm3fd5g9tlHPYrJ2jUncLuB7Z8io7P4lQCArJGrf4vLTCap3qPys7Kz5TvvHk24lzuSIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4396
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



On 2024-05-13 15:48, Abhinav Kumar wrote:
> 
> 
> On 5/13/2024 2:30 PM, Alex Hung wrote:
>> With dc2d7fb4f978, all kms_writeback subtests are skipped.
>>
>> Refresh the outputs to grab all supported connectors,
>> the writeback output that is just enabled.
>>
> 
> Can you please help to explain how the tests are getting skipped due to 
> setting the client_cap?
> 
> And also why calling igt_display_reset_outputs() is fixing this issue?

Without the igt_display_reset_outputs(), the result is

IGT-Version: 1.28-gbe9b99928 (x86_64) (Linux: 6.7.0-rc5-99-custom x86_64)
Using IGT_SRANDOM=1715637543 for randomisation
Opened device: /dev/dri/card0
Test requirement not met in function __igt_unique____real_main553, file 
../tests/kms_writeback.c:579:
Test requirement: output
Last errno: 95, Operation not supported
Subtest writeback-pixel-formats: SKIP (0.000s)
Subtest writeback-invalid-parameters: SKIP (0.000s)
Subtest writeback-fb-id: SKIP (0.000s)
Subtest writeback-fb-id-XRGB2101010: SKIP (0.000s)
Subtest writeback-check-output: SKIP (0.000s)
Subtest writeback-check-output-XRGB2101010: SKIP (0.000s)


It looks like the below "output = kms_writeback_get_output(&display)" 
will return null as it cannot find any connector type with 
DRM_MODE_CONNECTOR_WRITEBACK.

The igt_display_reset_outputs() is able to re-initialize the output and 
therefore includes the writeback output.

> 
>> Fixes: dc2d7fb4f978 ("lib/igt_kms: move setting 
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback")
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   tests/kms_writeback.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>> index f89b2d62f..4c54f3b89 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -572,9 +572,11 @@ igt_main_args("b:c:f:dl", long_options, help_str, 
>> opt_handler, NULL)
>>           igt_require(display.is_atomic);
>>           ret = drmSetClientCap(display.drm_fd, 
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>> -
> 
> Is this part needed for this patch?

No, but I think they are related and thus grouping them together is 
easier to read.

> 
>>           igt_require_f(!ret, "error setting 
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>> +        /* Refresh the outputs to grab all supported connectors.*/
>> +        igt_display_reset_outputs(&display);
>> +
>>           output = kms_writeback_get_output(&display);
>>           igt_require(output);
