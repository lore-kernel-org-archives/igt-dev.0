Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F3BCAC59A
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 17:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC1610EA5A;
	Fri, 19 Sep 2025 17:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jfmVooFp";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013031.outbound.protection.outlook.com
 [40.107.201.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D8A10EA5A
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 17:05:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntynK0lrAdRxHVHNO2pl986uOXJzdm5QpDnb+7nOADTGU67KumYrkfaFGF1Y0og7sUwK30dE6YFWSW+WXVh4RfoWmeeXk74KUzsR4IqrmdhjhbZimcW997zAqS6aznbQ3bCyYEIEgMiOxU4jsHWiBlnAcg5Uii8Qb9o/x4ee+lZBz2nM98QMWEyqdJfD4BfNmS+V95xRz7QGykOzRJro6NYF4Tn92GIVna2RiqvXJZI7SfRjA9skJ0STZF4QubBuhsvqUbEFuGmV+Hwy7xSfQBfn5HHW1ue8wHBc9d9+R213UWQ3pQjLWTlgHbMhTWqf5RSAtzIsSk7PzAKvfWUEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwyyJjGRr9Azs0TEepSY3xuSbDuro+rPXU5mQ/+LJ70=;
 b=fxra8hP5YHkkeoqKKwOOWDmskcYGV3qA97qP4kLoRuFaoS2PRB+GDRK3zH/Z4B4oCcQxXecIKwQPNvF2iWIF3GL2N3CbOx7KzhtWtfEMat5by1MVg+oMejJXn8QDMRENjF7qF8XZaeiPcrUgqyJsUAvGrwo8u7vtMFE2Zao5h1EFZl4mDVn15kvjqQfckNh+5JPa+z8Lu++zNE6RzgJ+OVUeo8t4Ik8vPDBR+yVQEluWVfqvrzahXeRqdOq+zP9U3JSnCFg1jXEcIgho6lfFh5uJDpkfmv8w3sJsSiz/wIKig4P2t3KeEH4O/F6Q/THuXlOlXCTinZN4JSbc9FT5rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwyyJjGRr9Azs0TEepSY3xuSbDuro+rPXU5mQ/+LJ70=;
 b=jfmVooFp4eJUMY4huvA3z8X4nioLJ4S72OkjZPN6k57iUQu1SgFe3A9VqB+lMoSKA+u+vp0upqfWt0Vpcz8Q1TyawK/tFftPVou6QcnYXerhVxh2w5awCKodcwlCldd9mnYytHpffMCp4NEhq/aGsUODHUEY6kL/nXei1tc4fRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH3PR12MB7546.namprd12.prod.outlook.com (2603:10b6:610:149::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 17:05:27 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 17:05:25 +0000
Message-ID: <e0cd282b-4e73-4957-b04b-89b062f98924@amd.com>
Date: Fri, 19 Sep 2025 11:05:23 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 09/30] tests/kms_colorop: Add kms_colorop tests
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-10-alex.hung@amd.com>
 <64fc50a8e0285f9b5599d33d792c33554f605ddc.camel@collabora.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <64fc50a8e0285f9b5599d33d792c33554f605ddc.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::31) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH3PR12MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc21662-f4e4-466a-f2b9-08ddf79eb9fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2EwNVpKcXpuRHArdW1Scm9SeFNPYlRjeFNucUdUTHF4blZ6RWN1Lzd5MzJu?=
 =?utf-8?B?YStZQTUwY2dvdldjZnNZbkxYQ01lVGk4K1hZTDI4djAzRWNTNHNDQ0N5RFEv?=
 =?utf-8?B?bERWSWlaMVp3STRGdjVqbWhmcy9JL1U4Zzd3TzI1eVVDWHdEeW1xdGVTRGVH?=
 =?utf-8?B?ZzVkTmdHZDJaRWNGM0ZmWHNtb1VUNlFYWFpDMG90RUNqdkdJZ0ljUm0yY2FC?=
 =?utf-8?B?bjI2dVF6bk9vMjRQQklEY0pKZWpYTVRHWXQxWTlQaUNiQU5WZVliV2V3Q0I4?=
 =?utf-8?B?Q0NLRWNtaG9IZlQ0RThQRGNGM1lyMFZqZ0FKcU5nZm1ERVBDVVhZU0xWMXpZ?=
 =?utf-8?B?YWpkeG1NNTQzTWlPem5ITi9YN1FhVUl0c3oybzlPdCtYbzVJeUVUUDlZOFFo?=
 =?utf-8?B?R2J5dFdqT1Z3NzBFUkhsUWR6RTB3Q1BiYStUcGJaNkhjZU9lMjZEbzd4TTVM?=
 =?utf-8?B?UHlFazE4U3lRSmx2OVBuZk51WXE5a0ZSRmFIOGR1bVdpSFliTHZhQmN4ZGVH?=
 =?utf-8?B?WnMzYnZVS0xKZEtZTktDNG1SdUNKeHJPSHZVV2dxMkRTSVdLa0pKQ0R0c1dt?=
 =?utf-8?B?VzI4TU5Bd3BqVWZ4Yy9ZUGNPeHhIV0JCeWhmZ1ZiMjJwQ1N4cHRjc3JsdHpw?=
 =?utf-8?B?cEZmY3hYKzRCZmg3d0pDQytiQmJiSTNVakRMR3ZHR2M5dTV1UHBWV2o4aXJj?=
 =?utf-8?B?ZWVGdS93Y0NWV1RjejY4N3ErVmhuZnUyZkozZDdBZEVVQ3FQa0FVeUI0SzVq?=
 =?utf-8?B?am51OWxYZDhOckZPakN2SFhSWDR4S3Fwb05iSTZpT0xBbGlJN2lLNHdSOW9z?=
 =?utf-8?B?Y2IvUGxMc0lERFhkL0c4c1B6Y0kxc2phNEV5dHNQeUlaOEI2NlVxZHAvWVBM?=
 =?utf-8?B?UjczWTlJcEJCYXgyVXpscG1BODA0d2hLNkRoM2hra0RHSXJYVG1xVE81ZmF0?=
 =?utf-8?B?SFpTSDdxemNFNkFobVpqcG9DTGpnQVlDblFsMjN0dnNQdVBETzYzaGY4Rktp?=
 =?utf-8?B?MXJGaWtIdWVUSmtIMktlSWRPMDcwSHBhVUZKa0ZMdjh3TkNTTm9tTmNidDMv?=
 =?utf-8?B?NnI3WFNZdFZRRlZFaE1Za2tCT1FWaFAvY0pGalpjT2E4WU9ML1JWUHhGNXpL?=
 =?utf-8?B?blpFNXdZdlFrZWpHNUI3djA5N0oxRVdHYWdhb3dwZmprR1lub05YSkRreXpz?=
 =?utf-8?B?akJhT1hud3YvTk8wNjhTdk1TOFJPL0dWbEh3Ulp1Z0tmTEhiS1hocngydFBP?=
 =?utf-8?B?L09zUXpVSlZVYWl3bW81WFNGZzhRbExrYWd2am41NlJpL0ZoVDZ6OFFNZzhL?=
 =?utf-8?B?UU5NNXg1RFV4S0Y1SlN1V0ZmcERDYTJXY01GUEU0bjdjT01SQWRmU0VNRGRL?=
 =?utf-8?B?ZytYM1BYczJRUHlNbHhBdFdnUWhaNXhvZlN1TFdTeE5VQU5HelZJVnZra0FP?=
 =?utf-8?B?cjBsYkUwN1ludkRLK3JIdlNhZ1k4VXUyQlVNVWpsd0dWaHlLeU1MUFlXRUc2?=
 =?utf-8?B?cTluSmFQT1NSM0g0S3htSWMyaS8yRXhpRkZ3VFRNb0tXbGZZK2Y5alVhWUs0?=
 =?utf-8?B?MEk0OC80Wnc3WkpkbXRFR3luOGxhbkRjcWUvaWFRNGVRN09sazJUN0N0MERn?=
 =?utf-8?B?dTBRclJrUXdmS0FlNDdobkUzTEN6d3dqWFYzdDRNTmZrU0VhZ0YzbzB1UGd5?=
 =?utf-8?B?bVRTV0kvUUdrTTdaRldqcEw2b2pMc0RPTGY1VmdmV3cvWlhuQUtCUkU3anA2?=
 =?utf-8?B?Zk9FdmlaR3ZpQWY2dFNmY0VPbjVIbDQ2cjAvYWYrNjRXMjJ1c0JqbGJLVGlH?=
 =?utf-8?B?bjllVHo3Yjl0RVhNajBuWEt5d0VyY2krQ0NVZzVMSFlaTWc2SktKWHhvYU1s?=
 =?utf-8?B?UGVpWkpmUmJ1L3piRDBSSkZjQU1aODQ2K1lXNW9VUXYza0wzdlBIK09IdFZw?=
 =?utf-8?Q?N1qZvayLy58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm1icFVYaDhNdDFDTmVFSGI4c3RUeGV3T0dKRU5NcFlEdm8yUGJaNG5wTUt6?=
 =?utf-8?B?RjMyVjBaeEUwSE5acHZ1UnBvbWl2UFhPQ0lOeTRLOEZqaUFvZ0tNTmpIdHFH?=
 =?utf-8?B?ZE1zbVZkTit3djgrK2JIMGlVeVJzL3d4VmJTMkJnRlNEUUk0eGt0cUFtUTM4?=
 =?utf-8?B?QXc1MVAwN3dDK3BuWTMyTk8zSmhyelZ6QnZ4M2FsenI3akxsdmQyTW1pdC9H?=
 =?utf-8?B?aDVxdEdTbzIwSnlNNHZOQkhmWGl5QkRtMFJoQ09pNENza2ZRYXFjeXhIUU1u?=
 =?utf-8?B?TzBjb0RLRURiaXZteW5HbDh1elhrZ3hJdys5eU81SmcxRTRyRE9DV1N3OVlW?=
 =?utf-8?B?TndOUnpNNUdSN0FnL1FPTkZZQ1Vxckg4RGZwSThmK3VydXNZT0lITUtHYzI3?=
 =?utf-8?B?cE5VNzdKUmpwRVc0anQ1cUEzYjAyRzhiTUY4YmI1bjgzbERqRnFock5xV0pR?=
 =?utf-8?B?Z3hJRnlCRW5sajhCZEs1Z1ViRWpyUGUxc3BLSnhxK0hCcCtrMkhFdTF4YVNX?=
 =?utf-8?B?V1Qrd2hzOWt5cm1QeTlocTBWNHVJNFBINUt2ZC9Bb3d5NGljSlV0OVFzWW80?=
 =?utf-8?B?anpJQTBZcDJTN1ZUYmFtSlpkSVZQcksrZkhmK0tVR1dUMXlVTXNuRCt0M2Yy?=
 =?utf-8?B?ZDJ3L1ZSVmtJOUh0VGZyVnVIQndha0lNanZoUGtCcjdKREg5MlF6RURNdXhB?=
 =?utf-8?B?VmNuOVdxa203WUM0MWZ4RkdNajRJRGltS0UyUEllYkxMT05ERWRmTWtxTWJX?=
 =?utf-8?B?bFhwSHlaclVZTWhRZWdlZyswZXBIMkhUeXV4N241T0p4UmhOUnBhYkxPV2dp?=
 =?utf-8?B?K3lYMmZoRURCUkRwR1pRWHoyY3BFbDByczZyamRTc1lseWlRdUNybW94b3dI?=
 =?utf-8?B?Vll2WlFLWmFKWlp1enBwcnRxVkUvUFdhVTd0SjZRd253UEZqV0g2UW9XV2hJ?=
 =?utf-8?B?eGVsMXVjZDRJVjgrWDlKbVQ2R2JZd1V6Ky9mN0o2TUM3SnpnR08vaGJCeU5w?=
 =?utf-8?B?QlEyNy9handtR1ZIdzRKSDdLYndNK05Xc0dMSE45WlZrWm5KeWZQb1RCVWht?=
 =?utf-8?B?Y2RKS3FWWHdIeFBqSHN3dUpaRE1ybHpJN3VNUDkwMWlQQkYrVk9TSlpON1V5?=
 =?utf-8?B?anlGZHBtWEIyVGlMaE44VkVJOTE5cTVsZ3ZCU2J3MGRYVVZrRC9TOHJzLzhy?=
 =?utf-8?B?c085YTJieEZPOUpPamhRTEJxSG9JVWtqU2FOaWtEL2FBeXNSZjcwbk5VbXpl?=
 =?utf-8?B?UXY0NHMzV2ZEQ2QrbFVra3NQd0lhSGkrdmUranZvT2FzK3RGVVRmNHlRbTBR?=
 =?utf-8?B?YW14a2s3TXdjNkl0SWdMUHZYT0puVVpvRmxGUG1QMFVjQklFRDJKek92REJU?=
 =?utf-8?B?UDVNM2E1YS9vYXJDQWt2QVBNdGZoajRzOWhnQTl1RWp6MjNvSlRnMGVudEVC?=
 =?utf-8?B?aFZ5Z2x2bFhZeTdkcm9kWnUzYW12STJnNzZNK0U4UE9KVUtHdnY2d0VFYUhk?=
 =?utf-8?B?NkpPVUpad2s5NXR1bGVCcitjZU5JdXBCMmRHK0tOSklDcFVvU2pXbmsxVlov?=
 =?utf-8?B?eGtIaENKVExsamFvclhhdWNGV3l5QXQvQnladC9zM2lxVEtycW51ZmtTbkN4?=
 =?utf-8?B?NXpLcWhoM3p2Tndibk85S3dvbkI2KzI3cnNLUGdCcFZaRWxHN2paSllCbGE0?=
 =?utf-8?B?UHZ4b01qR2ZNSkVaREYyYWdzMllPMjQ3M3RydVA4SXYyblFSNk1VZFJGTWZC?=
 =?utf-8?B?N1NRemdhQjZlMUpudGR1NUdPVEo0WDdSN1FQekRydElQS3p6S0tjVHF4cjVY?=
 =?utf-8?B?c00xTlF1V244RlZTSWRUZWxEVndoY05kWGNWK2hIVjdSbHB4S0ozeTVMUS9h?=
 =?utf-8?B?VzBEZE9xTXJsNHBBbW5wK1BRV0Nna0JPaHREU1dZS2NUUkNXVzRySHVHZ1gr?=
 =?utf-8?B?VUc1SWlUU3JSVkRBR0dOd0Nhc3FsbXVTS0dQbzBoV2RXR0NETmJERXF1UzQr?=
 =?utf-8?B?aytPTXFzMCtiUHFaOWZDV1hpb0x5Qk1ERjBIaldzYklWYzZWT1EwYnBndzJI?=
 =?utf-8?B?OVhLczhWQ3ZrenZmUVcwTnhIV1paZ0NRVlJCeDFrdlM2ZlVSL3dKSWRTd1BB?=
 =?utf-8?Q?4mumIsLC+eIo57TgMGjF+Xgxz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc21662-f4e4-466a-f2b9-08ddf79eb9fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 17:05:25.6590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cG6vua8b/ccsyxBbiRaZ9YtWBN/8StvNAhXYC3jk+qKrSPFJcBR2vBbdURXM1RJE6YesTzx3GZtuAfbnOvaO7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7546
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



On 9/17/25 15:20, Nícolas F. R. A. Prado wrote:
> On Thu, 2025-08-14 at 22:06 -0600, Alex Hung wrote:
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> This tests the color pipeline API, exposed via the
>> COLOR PIPELINE plane property and drm_colorop objects.
>>
>> We introduce tests for:
>>   - sRGB EOTF
>>   - sRGB Inverse EOTF
>>   - sRGB EOTF + sRGB Inverse EOTF
>>
>> The last one is the holy grail of LUT testing. It tests that
>> after applying an EOTF, followed by its inverse EOTF we arrive
>> back at the original value. We can use this to test for
>> precision loss in the pipeline.
>>
>> All tests are tested via writeback. All transforms are done in
>> SW (in floating point) and at the end the SW transformed buffer
>> is compared with the KMS writeback output buffer. The two should
>> match within a bracket of acceptable deviations. Since these
>> deviations might look different for different KMS drivers we'll
>> do this check on a driver-specific basis.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   tests/kms_colorop.c | 508
>> ++++++++++++++++++++++++++++++++++++++++++++
>>   tests/kms_colorop.h |  88 ++++++++
>>   tests/meson.build   |   1 +
>>   3 files changed, 597 insertions(+)
>>   create mode 100644 tests/kms_colorop.c
>>   create mode 100644 tests/kms_colorop.h
>>
>>
> [..]
>> +igt_main
>> +{
>> +
>> +	struct {
>> +		kms_colorop_t *colorops[MAX_COLOROPS];
>> +		const char *name;
>> +	} tests[] = {
>> +		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
>> +		{ { &kms_colorop_srgb_inv_eotf, NULL },
>> "srgb_inv_eotf" },
>> +		{ { &kms_colorop_srgb_eotf,
>> &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" }
>> +	};
>> +
>> +	igt_display_t display;
>> +	int i, ret;
>> +
>> +	igt_fixture {
>> +		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> +
>> +		if (drmSetClientCap(display.drm_fd,
>> DRM_CLIENT_CAP_ATOMIC, 1) == 0)
>> +			display.is_atomic = 1;
>> +
>> +		ret = drmSetClientCap(display.drm_fd,
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>> +
>> +		igt_require_f(!ret, "error setting
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>> +
>> +		igt_display_require(&display, display.drm_fd);
>> +
>> +		kmstest_set_vt_graphics_mode();
>> +
>> +		igt_display_require(&display, display.drm_fd);
>> +
>> +		igt_require(display.is_atomic);
>> +
>> +	}
>> +
>> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
>> +		igt_describe("Check color ops on a plane");
>> +		igt_subtest_f("plane-%s", tests[i].name)
>> +			colorop_plane_test(&display,
>> tests[i].colorops);
>> +	}
>> +
>> +	igt_describe("Tests getting and setting COLOR_PIPELINE
>> property on plane");
> 
> igt_describe() should precede an igt_subtest/igt_subtest_group not a
> fixture. In this case looks like this is a description for the entire
> binary though, so IGT_TEST_DESCRIPTION() should be used instead.
> 
Thanks. The igt_describe is not needed and will be removed.

>> +	igt_fixture {
>> +		igt_display_fini(&display);
>> +	}
>> +}
> 

