Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A01C25B78
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 22:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95EB10E21C;
	Mon, 13 May 2024 22:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qNWJPhz3";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EE410E5B9
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 22:32:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dof57ee2LIoZ+E1h7SsMVlH3ana3x33oQ+7G5y5WTnavB08Fxj5yuuckcHVo4lHy7A+jaKIk3Rp/o66VzQkxADoHc0zxHMDdkI1KhZyUgvmP6EYB6WYlrH02mvT8hofBf/YH0k++zQCXJkn24UQ47GC2QYCYbEZK+raRL9xShkc6pNf77PT+y9Y4vnvojdR3aquw4bgCJGLqCDJmyD8VzEggXPhhsfWL+CzTD2wOgGFMfamnHqXWHPZWFvcVJByYlC0HcCJiCHDtc18740oTgSzVa7zYH2S+uIJ+rn90YWFE4FKMPBXUTuwRLr6V2Q6Dpmc6thKd6qAnkqXrpuBglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHif41W1mXcIKP+pSB5Bv0P9hKiJjzC0SuDve5cEZQA=;
 b=C1P1ElSOBFXrCehWa/YQaNW7C6Aoj0gbsEhgYijkI7JruBBHaPQL5yjuX+y7RvqecxHL7JQ+y5BdrpVIXYcMMF5lvuklwyATla3aM5zJ21h0iPMLOWfmY7eOMsqL2jnidC+FtDvVHC4FDEaNqW+5bDGg8IiyU+P8pIj6pukkJ3aqs6HV8JuXkW5TDwDtxVD7y5xbENwmRPieKrIyU/ueJo0684qBT5PESKxKKoMOfsiPikl/Oy6SPcAFHQd0B1ATcMdkrGWEZZo/0QEMJWNWQKj9MywwL0cB1S6N+mqpIOfmTPGaapq2Ope/zymf9OHKUKh9jnr3GGaJmzlUu7Mk1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHif41W1mXcIKP+pSB5Bv0P9hKiJjzC0SuDve5cEZQA=;
 b=qNWJPhz3SblkMth8A6K2SZUmAnEyFGcudxKg48t+s8ryS7ehv5xV4SoIC30SC3HUwQ/2VKZslNtqCyXwRwrKAS+4mQ4dNmd7EqwcYZl0tT2k/J9JFTIs+pQeC5qQVqCXe/Ps0wP0pBOusayHM1JPoRGdCvlovEyzjEbUgkmonl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:314::18)
 by DS0PR12MB7536.namprd12.prod.outlook.com (2603:10b6:8:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 22:32:28 +0000
Received: from SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::71c5:ea8:a3c7:4c77]) by SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::71c5:ea8:a3c7:4c77%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 22:32:28 +0000
Message-ID: <31bef15f-b58f-4442-aca6-eb8ff5e924c1@amd.com>
Date: Mon, 13 May 2024 16:32:24 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_writeback: refresh to expose writeback output
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, igt-dev@lists.freedesktop.org, 
 harry.wentland@amd.com, hersenxs.wu@amd.com
References: <20240513213041.583437-1-alex.hung@amd.com>
 <3b525e79-8387-9cbf-7e96-8092ffc757a8@quicinc.com>
 <07e5ac71-1be0-4ad9-bab1-e403db1eb59d@amd.com>
 <d35e42e6-74c6-58cb-dc10-b4be37d2bbcd@quicinc.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <d35e42e6-74c6-58cb-dc10-b4be37d2bbcd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0202.namprd04.prod.outlook.com
 (2603:10b6:303:86::27) To SA3PR12MB8802.namprd12.prod.outlook.com
 (2603:10b6:806:314::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8802:EE_|DS0PR12MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf61ef5-5f4f-4222-a515-08dc739c924e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eENLYnJRdGVHUXNNRUpUN2grOWVhTGpoZWJ3V21tNWg3SVpNZ1dlSUFEMEtZ?=
 =?utf-8?B?K3FxbmhGOFVrakhwQWVieEcrbldjM29UWnJBUTJDOGN5alhid2xGZGZQQzUz?=
 =?utf-8?B?RDRoT1IrNUIydjdSQTJTQWJpUkg0OWxVUks5RHlleDZnTTJxTkNWWnNrOHVW?=
 =?utf-8?B?dHRaL3AwdTM2RHZFRUY3RU9pZXlrRy90VUwxMHVhRkZFTE5GdExrdkJHUHZM?=
 =?utf-8?B?UDhSSTEyV2RhbHltaGlVZThuVERIU0EvZmhGQW5HNWNiTWdBYzdXbkFuQkZF?=
 =?utf-8?B?ejBlMlBqdXNqNXliNisrZVprK3FjTEVCOW05OVlLVVBuQStqcHMwL1F4eHo1?=
 =?utf-8?B?R0ZPcTFUdVl5SVUwOXAxY3RWNkgzbUVZOWRKY1FFTlJNZEIrUGcwVzR2ZGpu?=
 =?utf-8?B?M2RGbWRsMTBJY3kyaTdJTEtWTXdBUXJYY0ZMQkJUSDAvSHdOUEh4cm9NcDgy?=
 =?utf-8?B?eGs3Q1Q4S3grRHUyNHhhKytsQ3I1bVNFY3R4UjNaa2tNejBNOHRmVTlMTnBU?=
 =?utf-8?B?MXdWajhxRndrczRReFNXY3FrZ3RXNGNBbTI3TEliMGl4dXBaalRDeml6WUlW?=
 =?utf-8?B?OG44Ulh1SkhCdlBwaXZFNmZqeGpiam5MSkg4Rm5XRnMvM1NZWmtsU0wvUnJ0?=
 =?utf-8?B?THVVZERMSGdQd3NHM0UrZkZlbGZmV1FpYmM3bHNuRnkzZ0FDRUpsUVFnUTBq?=
 =?utf-8?B?TUFhY3FMTldscW5kV2FLQjY3enFnOWZWUElCUkVXVEpBcDA3dHBVUnJ3OXdR?=
 =?utf-8?B?cENTdEVZQkl4MytMb3hpbjluRFZmQUl0SThuOUN3eHIydXZzeGdaN3RQYThv?=
 =?utf-8?B?VXFVVlRDL2VLbUdQaHRhNlk5QU1mN3JBbGpoK1g3eHJYeGttNzlwTmlQR2lx?=
 =?utf-8?B?b2cwYWFDdDl1MFZVeWVFQTdWQXU5ZnBJSnpPeWN3KzdkTUd0Yi9MSU9uWVdk?=
 =?utf-8?B?K09seFBBSWFHT0VHN2d1cFFMM1VSMm1ic0JyK0w1UVlNOWcvNHl3NHJFZUdm?=
 =?utf-8?B?SWZ5ajl6QU5KaXRMT1Ezb2trUk0xRXR4YTVwU2xCWEUxR0Fyb1dIcW90VjQ4?=
 =?utf-8?B?RlVYcmcvRnVaNXVJOG04MithM2pNY2lMdkJ4WFBOOFdQbUgveHdGVDUyVGp4?=
 =?utf-8?B?OHg4S1VOUDl2VndJakh3dTF3TlRXR2xpdVJ0NzB5WVROaVF4Uis1d1FzeFo1?=
 =?utf-8?B?eWJQQ1lRWVpXK3lvdkVpY0JmMlk5VXR1ZkF2NnU4SzhMM0Q3SW9YeDltSHBM?=
 =?utf-8?B?UHVqUlVGSUxGQmVmNE1xMTIwWFZ2VHMwQ0RtZUdwRVQ4T3cveHpwREh3MjFP?=
 =?utf-8?B?eDd5blN4akowNS9raDNzYk5yRFNRS0tSc1NyKzd3NC9seGxmTXkxMTNaTHI5?=
 =?utf-8?B?VU54NnlRa0ZQNkFEbU5HWDEwRTlkQk9lbmF3SExZeHY1MUxqUEp3c2Q0d2xY?=
 =?utf-8?B?czM4QlNyZm5mZnFadE5HYmExdHZhbGNrOWJOWUlGc2Zqc255Z3dIK25iM1Vn?=
 =?utf-8?B?bThFVnZISjRvYktQWWF4UzZHTVFQRUlXVUxUQWVyQWlnUkh1RFhvSUtjM2lG?=
 =?utf-8?B?ZUZaeVhkOFZESDZUdjdxYkpMY3VMbTVMd0NLaGxQWGhGcUhEYzRnVlNyZFU4?=
 =?utf-8?B?VjVmWWluQTJSNzF3aWFkZHZOQndkT25FbzZiMEZCeEdxekFjQVpsUElKNTlk?=
 =?utf-8?B?Q2pWcS9aWEtFTmIzTWNGU2tlK1F0SGZvWlpQdjJHMHJLRkpCWStPZnZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR12MB8802.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cStXaVdoQkVtZTNtSVR4cFNyeWFFWDU5UVB3aSt3VG1xWDhzZTl0TVdyYWNH?=
 =?utf-8?B?dDhVbEZRN0Y3SU5GQ0tyUFZndlI2VndIai9ZZmpKNU5uQlg0Unp6QzNMNGh4?=
 =?utf-8?B?Nkl4eEtPdytubTBjbythQ0FwMWkxbTVtRnorKzZpR3czSHlSM0ZhZXRIdGxI?=
 =?utf-8?B?cjdBNFN6VG1pSlJkWkJDL2s2Qnk4aGcweE8vbGZLQU1ZK2tXcnJRZEdKMDBt?=
 =?utf-8?B?TFpyeDJiNWRYNU1TSnRSUjRGTE1sbEcyL0hlQ2ZSMlVEQzhSUWlHMUthNDhG?=
 =?utf-8?B?dFhFRm9nWWdLazNrNG42d1AzVWJQbjFzcDFZZWtoMDZmdCtiZDcyQW1LUFlO?=
 =?utf-8?B?Vmx1MW9JVkVCSkp2OVVocjljdWRqSjluMXVneTFNZDg5b3J1OU1ZUFp6ZERP?=
 =?utf-8?B?ZGhnZVF5MEN3YTkzQThCSHAxN0Q2Z1kzbU9PQlEzS0xCdnFodjhHMERxa09J?=
 =?utf-8?B?UmZvUy83YVJrS1JPTVVGRjNPRTZSSVd3c21QbERyeHJUY1hEQmk5SmJOdVhQ?=
 =?utf-8?B?SDNWb2xldEhTN2RRazlIZ2NQaldDcFhNVjdpUm8rWVZwRG51M0dSc1luWTl4?=
 =?utf-8?B?aFVRTDlqM0xtK0NjNlJTQU42Z1lWb05EMjFlWG1MbWMvQys2MkRTQWNrUE1U?=
 =?utf-8?B?Z0RKZHZoM1FMNFlzY3ZOL201SzY2SldyNGRvenQwalpUZnptOVJHbGdzcmlh?=
 =?utf-8?B?TjFoNzJkUzA3RGNsU2hQb0FpYTZlRVBsWGZYTkFXV1hHbGNzYmlKeHBRVVgx?=
 =?utf-8?B?a0gyNGx0Y0ZQbWRNRkFhL01JcHBzZVpiOXJzdE1KUzhHK25oTi9OTC9TUzZZ?=
 =?utf-8?B?eER5QkVSZ0krNjUvd2xLWUttWHdicC9tOW5qc3lTVjFaMzR4VUhuT0NEaTVH?=
 =?utf-8?B?QWlsZVVZYUwzdlBvUm9md1dDSmZWMGpscUdFcHRyOGtyU1FxU0E1NlJ4YWRa?=
 =?utf-8?B?Rjh4aEdtVGhDdUZJQnZtT1pUcG1PbVNTbnlkdWRQTWg5R1dhMFlLbjVhWUQ1?=
 =?utf-8?B?TlQrc29QRUpNeFdxK0FCZEJIK0pTV2w4QTRXZFFRSzRlaUxVUTlaUEZ0aXVX?=
 =?utf-8?B?WXJnWTRMbkRFaDR3MU5wcXN2MjhUUUFpL2xzZXFaUUNMTUk2RHQrVWQ5bHZB?=
 =?utf-8?B?TVBHWWw2d3J2MVhsbDd5TkFwWUI0R1ppZ1RiYVlWcWFrdFhYVVBsMElpY0Vi?=
 =?utf-8?B?d1IxNkVkeDF1SHNhTzNPa1ZIb3V4dmYrUjFSTFhaeCtsR3g1WVE4S0JCdnEw?=
 =?utf-8?B?Zk5ra25QRWo4Z29DZXJjZTVBVi9Ta1FVVG1JSUhJNXViU0lCQjFtZTE3Ny9p?=
 =?utf-8?B?VURGbmRPak1DaGFrclFtbGpGS0VBVmtSNm9QcHZINVFKQnJqSE5iRTVObGcw?=
 =?utf-8?B?c3lkNFAxRUk0cFdERVFxeTdOSkorVy9XNElsSTd5ZUdqc01uY2FCTytyN0FE?=
 =?utf-8?B?NkZyV0NZcEZyZWMxQWE2YWREK1JhQnBYMGxUOWI4cXpXZ3pUUXo5dDJLbmsr?=
 =?utf-8?B?eGk1a2xLTVBQODk5aGtSOExmWjNMTDVHUnNaeUxvdUorWjkyZy8xYnY2ZnlM?=
 =?utf-8?B?dHNxcS8zd08wcE0xQnpod0N5Y2VLSGZRQnUrR3c4NElydWhLaE41dEEzNlpM?=
 =?utf-8?B?aFFDMXUxc1l3YjlaZHI3MDZMVmZrTjg0V1N4MDE5Unh2aGhXd0pLN0lTelZC?=
 =?utf-8?B?RGhBaFpJRHFOREE4K2owYmx6akk5b1pxWnM1ZWc0dEF2Z0dSUE5wdGY0ODQ1?=
 =?utf-8?B?MjJnamd0VUlSdlBzbzNtUkpoRTA2ekVoMWFpMG1LODM5a3owcCtLTWJRTUpq?=
 =?utf-8?B?M2pxd1pZRCtEMGI2bDFXd3ZXaWZOSkN2Yms4Uzdoa0dQQjlxcHB0UVNaQTNC?=
 =?utf-8?B?VWtHUk43WWk4NklKdVpqdHdGL1htT28zelFqL3FJODlpc08yN3pKeUVDcnFO?=
 =?utf-8?B?WGx5RWRDRTVPOTJyenBaK3dIUU1IQUsyYTZVdEhSQ09YVDZlSURxWHE1K2FN?=
 =?utf-8?B?ekhpVXJqankreWF3VU96SzhhMk9LZThvbTl2U1JVaFN1YjF6WmN4b1d1VnZr?=
 =?utf-8?B?a04xcnR3SmcvWkxpMlF3TXlNU3JRbjZVS29ESlZVWGd5dEIvbWxOamlYcW5l?=
 =?utf-8?Q?767aQrmSDgt1KgONQOWHTR3sn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf61ef5-5f4f-4222-a515-08dc739c924e
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 22:32:28.7265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGOto0mx5OSpplojeV9By11o8MoMWyK7xRdrrpAMpZK6BiJ4bMbe+/zOxqDgv01ac1tzPC46H1pxXdbknqKHkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7536
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



On 2024-05-13 16:20, Abhinav Kumar wrote:
> 
> 
> On 5/13/2024 3:06 PM, Alex Hung wrote:
>>
>>
>> On 2024-05-13 15:48, Abhinav Kumar wrote:
>>>
>>>
>>> On 5/13/2024 2:30 PM, Alex Hung wrote:
>>>> With dc2d7fb4f978, all kms_writeback subtests are skipped.
>>>>
>>>> Refresh the outputs to grab all supported connectors,
>>>> the writeback output that is just enabled.
>>>>
>>>
>>> Can you please help to explain how the tests are getting skipped due 
>>> to setting the client_cap?
>>>
>>> And also why calling igt_display_reset_outputs() is fixing this issue?
>>
>> Without the igt_display_reset_outputs(), the result is
>>
>> IGT-Version: 1.28-gbe9b99928 (x86_64) (Linux: 6.7.0-rc5-99-custom x86_64)
>> Using IGT_SRANDOM=1715637543 for randomisation
>> Opened device: /dev/dri/card0
>> Test requirement not met in function __igt_unique____real_main553, 
>> file ../tests/kms_writeback.c:579:
>> Test requirement: output
>> Last errno: 95, Operation not supported
>> Subtest writeback-pixel-formats: SKIP (0.000s)
>> Subtest writeback-invalid-parameters: SKIP (0.000s)
>> Subtest writeback-fb-id: SKIP (0.000s)
>> Subtest writeback-fb-id-XRGB2101010: SKIP (0.000s)
>> Subtest writeback-check-output: SKIP (0.000s)
>> Subtest writeback-check-output-XRGB2101010: SKIP (0.000s)
>>
>>
>> It looks like the below "output = kms_writeback_get_output(&display)" 
>> will return null as it cannot find any connector type with 
>> DRM_MODE_CONNECTOR_WRITEBACK.
>>
>> The igt_display_reset_outputs() is able to re-initialize the output 
>> and therefore includes the writeback output.
>>
> 
> Thanks for the details, I understand the issue now.
> 
> But rather than calling igt_display_reset_outputs(), I think better way 
> will be to set the cap before calling igt_display_require()
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index f89b2d62fcc9..6ecab46e440b 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -567,14 +567,13 @@ igt_main_args("b:c:f:dl", long_options, help_str, 
> opt_handler, NULL)
> 
>                  kmstest_set_vt_graphics_mode();
> 
> +               ret = drmSetClientCap(display.drm_fd, 
> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> +               igt_require_f(!ret, "error setting 
> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
> +
>                  igt_display_require(&display, display.drm_fd);
> 
> Let me know if that works for you.
> 

This works if DRM_CLIENT_CAP_ATOMIC is also set as below:

Is this preferred?

--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -567,14 +567,18 @@ igt_main_args("b:c:f:dl", long_options, help_str, 
opt_handler, NULL)

                 kmstest_set_vt_graphics_mode();

-               igt_display_require(&display, display.drm_fd);
-
-               igt_require(display.is_atomic);
+               if (drmSetClientCap(display.drm_fd, 
DRM_CLIENT_CAP_ATOMIC, 1) == 0)
+                       display.is_atomic = 1;

                 ret = drmSetClientCap(display.drm_fd, 
DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);

                 igt_require_f(!ret, "error setting 
DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");

+               igt_display_require(&display, display.drm_fd);
+
+               igt_require(display.is_atomic);
+
+




>>>
>>>> Fixes: dc2d7fb4f978 ("lib/igt_kms: move setting 
>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback")
>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>> ---
>>>>   tests/kms_writeback.c | 4 +++-
>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>>>> index f89b2d62f..4c54f3b89 100644
>>>> --- a/tests/kms_writeback.c
>>>> +++ b/tests/kms_writeback.c
>>>> @@ -572,9 +572,11 @@ igt_main_args("b:c:f:dl", long_options, 
>>>> help_str, opt_handler, NULL)
>>>>           igt_require(display.is_atomic);
>>>>           ret = drmSetClientCap(display.drm_fd, 
>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>>>> -
>>>
>>> Is this part needed for this patch?
>>
>> No, but I think they are related and thus grouping them together is 
>> easier to read.
>>
>>>
>>>>           igt_require_f(!ret, "error setting 
>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>>> +        /* Refresh the outputs to grab all supported connectors.*/
>>>> +        igt_display_reset_outputs(&display);
>>>> +
>>>>           output = kms_writeback_get_output(&display);
>>>>           igt_require(output);
