Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0A2C52D7F
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 00:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B677210E56C;
	Fri, 16 Aug 2024 00:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RAhk+f24";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3C110E56C
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2024 00:57:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kP80USQdcWkuYV5e9f06i1Ez5EfdfRt7TPMnHsCv0ZpyrVZ+XpJCR4WRrsLyj+RPI53h5V0FEhcpCgoD1GYij/u99Hu3E7x6H0c0gQ+L2nLAro9vTRO8FZaNT2nHqMvQDRHpDKhCXoQkUxtXFagdaaV8xx2DU+4k1lMc97wWzCww8D0vtELarhkv1bCdqkpRa+y7ilwGk18pLksmy3rmN3Jvt2HdwfoLqNOH1uR0aHNsNL7pF9mW+bOWjB5X3ejC13WWdiss0JlNSvFfPLcQD2C2lGqcBC5LPgROKJ+kHlEuJJX5+jP1hiaOLynmRVrfQ/lb/Sx3VvL45GdzxGRyig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFDjS2SEEKf5juDgOPrlhwrlxG2LVQ29czbd7fHeGGM=;
 b=boHSOzZaKh9E4xrwM0Yimjk64nTsx3zr/iXFpzTltAI0TBVevks74RzC39/5HEEa+CpQPvBJmSgbqMGLped8W2R4R6P7oNJxpMGB1IsCdcOqaT6xbhHH1fzylG6segjmdYgNI94NCigxRXrIgI5c9x00iVTilq+r9xLEOMdiJ0DBoxodjOBL6LmxvGvxhQ+R8K24r6tDFqKLnV/hm7ha+KetI0kCMfyc6+T4S3pSmGvKIq3HQU4ZoC4/Rrfv4y43JVWufzNi5J9+JbfQT1QttdlrPGHFYkxO8AGQeCg36sHEF5aAIC7ChmBcVeRmF4dSfcVXC1Vd3g9laO69CXBl4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFDjS2SEEKf5juDgOPrlhwrlxG2LVQ29czbd7fHeGGM=;
 b=RAhk+f24ZwVpfGMKptjRnmJcKYFF/mh8mbAjAIKPVM4ZnXsuTK+6H7qfS1X5kbDxPjmJ5/aQMdNNwyYZ1T8xGsikTl/iqLkIQ3SZFPFgAntMXQHU3AovnQCQ9wO51rGnsGvTWlg2BIndm/pC3Fuq5gz20NeeJX0bLxZkcIEOK8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SA3PR12MB8811.namprd12.prod.outlook.com (2603:10b6:806:312::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 00:57:25 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 00:57:25 +0000
Content-Type: multipart/alternative;
 boundary="------------aRsTHKRVn3iO8sKLLvalGhDu"
Message-ID: <9b4a3d64-61c4-4e92-95db-1261d31f2a22@amd.com>
Date: Thu, 15 Aug 2024 20:57:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: add timeout for queue reset
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240814101140.3165345-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240814101140.3165345-1-jesse.zhang@amd.com>
X-ClientProxiedBy: YQBPR0101CA0317.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::11) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SA3PR12MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: da049dce-17e0-4e4d-d397-08dcbd8e64a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXdOSW1MKzFuc2JMMUdjbjBFTUFyRmpWOWM5U3ZPN3ZadWFMNW51a2YwSkdr?=
 =?utf-8?B?THV5TUdYSFlkM0tEdnN6SUlHR3I2bklaYURFQ0Q0UXZHc25CNk1TNkFtNTF5?=
 =?utf-8?B?MFVET0FBMS8vd1liRmdkWEc2Nk94Q09xVUhWWUVNSFhIOUdpWjAvNE1kL2ow?=
 =?utf-8?B?d2Fxd05mRHBmQ2VMSmVMOGxvb3VQN2tVak10d2xrSlhqNGY3MGZkR0NMWVpk?=
 =?utf-8?B?UDgzTmZ6ckM4WlByQ1dST1kraUJjWElhUi9veWxHdnlsOVJzZzE1dnRXdng0?=
 =?utf-8?B?U05tZ2kyQVVWK0I5L2VkVWRQdWdGVW10cUZiUUVvVXdFUWhJelZndFR3VXNr?=
 =?utf-8?B?SGFjR0hrYjloNS8zTE5ld0p1cXdjREJaOXhBZ0ZoemxzWkNlN2lTejVUcXJI?=
 =?utf-8?B?cFdjMUYzN2RvdWxvNUIvck5OQ2h4WGVlTkNxYW1pL1FOSHhLVjNMQzRwUXN0?=
 =?utf-8?B?YktIZ3RTMkdaY0R2d28xcUpwWHZiRHFsU2FmaDlObExTamY1U01rTmJ1SnQ5?=
 =?utf-8?B?QTBBUjhlOWFYOGVJWUlZUEtweGwvZFdkekRqTVBXQUExNmV2NDZaYjk2TjlO?=
 =?utf-8?B?a0d1YmJjSmUyTVRMMFV5dW82UTJycUdnU2pCejJTM3JHMUFqbVVRaGxVM1M1?=
 =?utf-8?B?YzhlODU1Rk5mMnR0YXBZeXZYaHVoWmxoSTdEK0R0V0h0a0N0SkhlUjRhcnZW?=
 =?utf-8?B?bWZyRVQzUmJtbTJhaTBHK2Y2ZWZDKzJlU09hY1gyVzNkN0F5ZE5tY3N3ekE1?=
 =?utf-8?B?VlFzajJMN0VrbTUvTGkweGdkdnBjeGNqcVBkdXNyclAzelF6YjhzRGRCdlN1?=
 =?utf-8?B?L1ZtOUFQQlhWcU5lejB1SjAxVzJ6eXVjZ1I4aXNqU0Qwa1c5RTRTMmROaVln?=
 =?utf-8?B?NTZNY0RJZHJOOGE1STRWSSs5NjFHUGlkZkZycUducjhKM2hwRmJlSHpkMmZp?=
 =?utf-8?B?Zzlma0czdjlmem5tZXZ4TjZRSGVwNkFyTjUwcWlHQVl1aklXNlRKSC9vaDY0?=
 =?utf-8?B?NzYvQkJJa0QyOGJpeHg5WHNib1RtbDFTcVF0ejEzcmtpSG5ZUEg3SlBwUVZS?=
 =?utf-8?B?c29BL2QwYXRwRzMxaVVZb05BNzg5eUVqTWdUMWJRajdsZmZ2MERQRllZWG1w?=
 =?utf-8?B?Z0lCakRqNSsvTWhwOVE5R3hNeXRSQjFJVWJERTRpTzhCTWRCcGhzNDdPTi9G?=
 =?utf-8?B?Sk5BY1EycmJ6aGtaajR4SjdoWk4yTCs2WUtGSHAxZTk2MDBRN2VJVzlHOHNB?=
 =?utf-8?B?OU9SWVBRVTZWSEt2cjZtWmZFUVVzYUFXWUc4N1N3cjRnSGczNHU3M0FtT2Zn?=
 =?utf-8?B?bHY3MmNDL3B2QmpwcHIrdDBvdUIzVXBWZXl5M0dkOU5iakJIdGZZYzhKZTU4?=
 =?utf-8?B?Q3NKV1luVTJEQm1zc0RZU0Q4Tm9leklYQzFPTHNkYzRtQUREenByM2ovMkh5?=
 =?utf-8?B?UnJVT2Q5TnpqYU5hTTVYY25Ib1FCVVhsSExBazloenYvYWRUakEySzRSSEhq?=
 =?utf-8?B?dHNCMGkyckxwNjBpRXM0NnA4YnAxeFhUeG04WGRjemgydExveVRBN0dhcnY2?=
 =?utf-8?B?a1NHamVIdXVhWWFWZGRzcTA2ZzNJT3VwWHFSN1JFSEpvaStWamhLUGYvTWNh?=
 =?utf-8?B?MlpOaXNXeXM1bEVxN3Z5Ymk3MS9VSmZoYU93SWJtdkpVb1NBYS91N0JSMnV6?=
 =?utf-8?B?R3R4VEErLzl6UEZoMXZ4V0J4dERTQ0prSHR0cHkwWG16aFk4Sm9kcWRzNDUw?=
 =?utf-8?B?QzZNaHFFcnYrdWpaV2oybDMvd3ZCeks4YmJTL0dtcUxTR2YxS3RCNzZoZzJW?=
 =?utf-8?B?MEJRNnBvUWxaSFBSd1ZUUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjB4UkVKOW9qaWJiTHpKaHR1L1ozakFIZU4vdGdBTkIxL0U0VittY0ViYWxG?=
 =?utf-8?B?T3JYY3R5d1VRVXhsL2lPTVVIemtWWnRaMHFva25DVVBUODRIcDBvdU5vRGpo?=
 =?utf-8?B?TzJ3VFlGTFFxVEpJcUZiSE5FVEVPZUtCRVJjVktPRlhJaWJybFhWWFBIL2Zr?=
 =?utf-8?B?aEZvdk52cVNUdlBhWjlreFlGUTdWNFhaS2FFNDZMVjVHdDkxVWc5clNtb2Vm?=
 =?utf-8?B?cXNCNFV3VXhnZFpkc0ZmeHJGMzJFQlZ6MnlmNmtQVXFiZXI2ZSsxU1ZwQUJi?=
 =?utf-8?B?TE1CamxQT3R0THBSRTR6MDJaSHIxSWNBQnJNbFJpVVJxN0FQT3Z4bEIrTmFn?=
 =?utf-8?B?dFgzL2pKK1ViRnRRRXFPMnFkOXRxMndnVXlveDFxZVBZWGtNUnpTUlJuR0ZV?=
 =?utf-8?B?VlpJOFVUdFJEL1QrdStnQ0pPMlQ1dkN4YkEyZjBJeTBnTjFWM1gvbUFUSC9P?=
 =?utf-8?B?S29kbGJPWGNteGJFRWs5cHZDeWdCL3FpcWpnYnZESndub1lBUjd4djFqajdt?=
 =?utf-8?B?UHVubGUvMkZKNXdLTlhlNGdxYzJTLzdlQ3FraDlKYlh5clVwajllelZyaWk2?=
 =?utf-8?B?YnBVdWtaOUVUSEtvejNvZXdOS0tVeEgrNktnTGt3Yk4rUHlsM1ZiS2xPNU00?=
 =?utf-8?B?QW1LV0d1bDlCVGJZME9ZdlQva1dCOHhpYkFKblI5aTlzd0RYZkJZSG5QR1M5?=
 =?utf-8?B?amFOU3ZIL1NZVjNCY0FLM0FzbnY1Znc0V2lHWm05bnJlMjQ5SzR4b2dsUmpR?=
 =?utf-8?B?eGlvWnNzRHRoUnBzWnRnU0NoMloxdVZNL3N2UzR0d2tyNnhXejFqTnRDdWwr?=
 =?utf-8?B?THJyUmdNbE1aeml5RXBNV05UaS9xMnI0dGtjUGVVbjRQTUc5VWJ0L1VJWDh0?=
 =?utf-8?B?SUp1QTQxbVp0NUJ5U3llN0djMWpNa0ZLaUV4ak9qQkcydFBESGhYNG1qNmpj?=
 =?utf-8?B?NHpQbzBWY29ZQUFQaCszb1AySmVtcUp1Yk1jejJwTUUzQmNmRVRKeEhpWStF?=
 =?utf-8?B?VGN1SnFMY0FjUmRqS0Q4MHI5Z1FOV3QxbWpMaDN6aU9xZ3dGemc5SUNjUWVx?=
 =?utf-8?B?SXJYRkJjMnptUktFTUYvVVFzS0Y4TGw1TXRBZjdMMjA1UFlrZVdMVEt1NndD?=
 =?utf-8?B?OElDNk1FcTNiaHBueXcwbWIyZlZ1a1ZWcmF1c0hUOHlTSWQrcGdzby9JZnpF?=
 =?utf-8?B?SGZZSnpmanBjcjBZOGtiN2k5MnNHZ3ZNL1o5OFpXbkxyRUlJN1ZoN0pPN0Zk?=
 =?utf-8?B?YWF1aXAxVmFnYllsQVhWZmxRNS84ZUt5ZkY2OUg2WXNmME11Y2V5dnRYWnRx?=
 =?utf-8?B?NHNlNmU3Q01RYVVzc1owN0liSzBuTzdMaWFidjRpbHNNUjFqdWRrVTF6TkIz?=
 =?utf-8?B?WFVDK3FmNjdzd253Y1JuVWdjVTVwSXFRVkhXQUR0eXlRNGlVOVhUT0Jjb01B?=
 =?utf-8?B?OGRxRmpod1JtUkJUQ0tVbTRjS3hLQUZ1OHF2VmZBdmQ3THdRTFdDR09iMnNn?=
 =?utf-8?B?ZXJDQlZtUjA2aGVpVnRzcFNrUzdaaktZQ0JpQmx5N2ppZjFDZFpXZUw5TzBS?=
 =?utf-8?B?eXNzK2hzejU1K0R4OTRsNGlrdUQwcDNBN09Ha2NkUWwremhlZ3BrYksyeDNp?=
 =?utf-8?B?VWdDZkE3NzkvMkhkOUdlK1hGSUl6M1haUjViRzVQcis3cmtDWWFpRzNWNFZl?=
 =?utf-8?B?dGpjVVM3eEpYWERrMW5WblJOMkwrY1ArV2U3UXR5VzJDQjErSWZ3NXZFeG1h?=
 =?utf-8?B?SVltYzNWVDVyWmI1UWZsQ21YL3dzNGN3K2JTQjByQXJCdzFrRWgycXFNM213?=
 =?utf-8?B?U2I5VkFVU1BKWWVucDFtclZGdU9oUEtFZGgvbkprZ3A3dDNQTjFtRE5tVVgx?=
 =?utf-8?B?TXZac1VMZm9xcFFVOWVvMVVWOWZXeUVUM1lqMmo1SmFuZ3NzdVZQbm8xWk1U?=
 =?utf-8?B?V29MLzFpcGFDMDRFb2xLRzF4R2Qva3ZlK0ovWlN6L3dBU1EyZE5JVHAxVVJJ?=
 =?utf-8?B?d0cxZk81THY3cHo0WVpPNzR6d1RFY0Y0OURxT2F3U3pjQXR4V1gySVFRZTI3?=
 =?utf-8?B?RVllUG9aWmpjd2hyakIyNDhoZ3pPRWt0dmJxd3gvdHkzam5WUlRrdzZITGVJ?=
 =?utf-8?Q?fbAYCoV+T7WZnGKjWMQPpzydi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da049dce-17e0-4e4d-d397-08dcbd8e64a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 00:57:25.3603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeNGuQC9KoOvYEeipxWIA0e6/bMx5S7PBRiwOSVghSMDXHzCvRwc7nKZoaZvpylqvcAm7sbm1vGw4f4jSJPTGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8811
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

--------------aRsTHKRVn3iO8sKLLvalGhDu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The change looks good to me.

Please do some tiny modifications below.
It is related to explicitly having a code block for timeout avoid checking:

if (sh_mem->reset_flags == 0)

This prevents a potential race condition between processes.
Since a timeout implies that we do not need to check the flags, this check can be safely omitted.

Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com


On 2024-08-14 06:11, Jesse.zhang@amd.com wrote:
> 1.If the test case cannot trigger any reset on some ASIC,
> It should be considered a failure.
>
> 2. Fix code style
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  tests/amdgpu/amd_queue_reset.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index 6819892e0..249676407 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -30,6 +30,7 @@
>  #define SHARED_CHILD_DESCRIPTOR 3
>  
>  #define SHARED_MEM_NAME  "/queue_reset_shm"
> +#define TEST_TIMEOUT 100 //100 seconds
>  
>  enum  process_type {
>  	PROCESS_UNKNOWN,
> @@ -49,6 +50,7 @@ enum error_code_bits {
>  };
>  
>  enum reset_code_bits {
> +	NO_RESET_SET_BIT,
>  	QUEUE_RESET_SET_BIT,
>  	GPU_RESET_BEGIN_SET_BIT,
>  	GPU_RESET_END_SUCCESS_SET_BIT,

Change to

ALL_RESET_BITS = 0x1f,

Since we have now 5 states after you added NO_RESET_SET_BIT

> @@ -307,6 +309,7 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
>  	sync_point_enter(sh_mem);
>  	wait_for_complete_iteration(sh_mem);
>  	sync_point_exit(sh_mem);
> +	igt_assert_neq(sh_mem->reset_flags, 1U << NO_RESET_SET_BIT);
>  }
>  
>  static int
> @@ -473,6 +476,9 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
>  	int state_machine = 0;
>  	int error_code;
>  	unsigned int flags;
> +	int64_t cnt = 0;
> +	time_t start, end;
> +	double elapsed = 0;
>  
>  	after_reset_state = after_reset_hangs = 0;
>  	init_flags = in_process_flags = 0;
> @@ -487,7 +493,8 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
>  		error_code = 0;
>  		flags = 0;
>  		set_reset_state(sh_mem, false, ALL_RESET_BITS);
> -		while (1) {
Please, keep while(1)
> +		time(&start);
> +		while (elapsed < TEST_TIMEOUT) {
>  			if (state_machine == 0) {
>  				amdgpu_cs_query_reset_state2(arr_context[test_counter], &init_flags);
>  
> @@ -533,7 +540,15 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
>  					break;
>  				}
>  			}
> +			cnt++;
> +			if (cnt % 1000000 == 0) {
> +				time(&end);
> +				elapsed = difftime(end, start);

                                               if ( elapsed >= TEST_TIMEOUT) {

				   set_reset_state(sh_mem, true, NO_RESET_SET_BIT);
				   break;		

                                               }                                               

> +			}
>  		}
> +		elapsed = 0;
remove 2 lines below:
> +		if (sh_mem->reset_flags == 0) //remove this
> +			set_reset_state(sh_mem, true, NO_RESET_SET_BIT);

>  		sync_point_exit(sh_mem);
>  		num_of_tests--;
>  		test_counter++;
> @@ -1000,7 +1015,7 @@ igt_main
>  			igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
>  			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAFIX", it->name) {
>  				if (arr_cap[ip_tests[i]] && get_next_rings(ring_id_good, info, &ring_id_good, &ring_id_bad, i)) {
> -					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name,ring_id_good, ring_id_bad, ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAFIX")
> +					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_good, ring_id_bad, ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAFIX")
>  					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_good, ring_id_bad);
>  				}
>  			}
--------------aRsTHKRVn3iO8sKLLvalGhDu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    The change looks good to me.<br>
    <br>
    Please do some tiny modifications below.<br>
    It is related to explicitly having a code block for timeout avoid
    checking:<br>
    <br>
    if (sh_mem-&gt;reset_flags == 0)<br>
    <br>
    This prevents a potential race condition between processes.<br>
    Since a timeout implies that we do not need to check the flags, this
    check can be safely omitted.<br>
    <br>
    Reviewed-by: Vitaly Prosyak <a class="moz-txt-link-abbreviated" href="mailto:vitaly.prosyak@amd.com">vitaly.prosyak@amd.com</a>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2024-08-14 06:11,
      <a class="moz-txt-link-abbreviated" href="mailto:Jesse.zhang@amd.com">Jesse.zhang@amd.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240814101140.3165345-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">1.If the test case cannot trigger any reset on some ASIC,
It should be considered a failure.

2. Fix code style

Signed-off-by: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:jesse.zhang@amd.com">&lt;jesse.zhang@amd.com&gt;</a>
---
 tests/amdgpu/amd_queue_reset.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 6819892e0..249676407 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -30,6 +30,7 @@
 #define SHARED_CHILD_DESCRIPTOR 3
 
 #define SHARED_MEM_NAME  &quot;/queue_reset_shm&quot;
+#define TEST_TIMEOUT 100 //100 seconds
 
 enum  process_type {
 	PROCESS_UNKNOWN,
@@ -49,6 +50,7 @@ enum error_code_bits {
 };
 
 enum reset_code_bits {
+	NO_RESET_SET_BIT,
 	QUEUE_RESET_SET_BIT,
 	GPU_RESET_BEGIN_SET_BIT,
 	GPU_RESET_END_SUCCESS_SET_BIT,</pre>
    </blockquote>
    <p>Change to <br>
    </p>
    <p>ALL_RESET_BITS = 0x1f,</p>
    <p>Since we have now 5 states after you added <span style="white-space: pre-wrap">NO_RESET_SET_BIT</span></p>
    <blockquote type="cite" cite="mid:20240814101140.3165345-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
@@ -307,6 +309,7 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
 	sync_point_enter(sh_mem);
 	wait_for_complete_iteration(sh_mem);
 	sync_point_exit(sh_mem);
+	igt_assert_neq(sh_mem-&gt;reset_flags, 1U &lt;&lt; NO_RESET_SET_BIT);
 }
 
 static int
@@ -473,6 +476,9 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 	int state_machine = 0;
 	int error_code;
 	unsigned int flags;
+	int64_t cnt = 0;
+	time_t start, end;
+	double elapsed = 0;
 
 	after_reset_state = after_reset_hangs = 0;
 	init_flags = in_process_flags = 0;
@@ -487,7 +493,8 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 		error_code = 0;
 		flags = 0;
 		set_reset_state(sh_mem, false, ALL_RESET_BITS);
-		while (1) {</pre>
    </blockquote>
    Please, keep while(1)<br>
    <blockquote type="cite" cite="mid:20240814101140.3165345-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
+		time(&amp;start);
+		while (elapsed &lt; TEST_TIMEOUT) {
 			if (state_machine == 0) {
 				amdgpu_cs_query_reset_state2(arr_context[test_counter], &amp;init_flags);
 
@@ -533,7 +540,15 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 					break;
 				}
 			}
+			cnt++;
+			if (cnt % 1000000 == 0) {
+				time(&amp;end);
+				elapsed = difftime(end, start);</pre>
    </blockquote>
    <p>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; if ( <span style="white-space: pre-wrap">elapsed &gt;= TEST_TIMEOUT</span>) {</p>
    <pre class="moz-quote-pre" wrap="">				   set_reset_state(sh_mem, true, NO_RESET_SET_BIT);
				   break;		
</pre>
    <p></p>
    <p>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; }&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:20240814101140.3165345-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">+			}
 		}
+		elapsed = 0;</pre>
    </blockquote>
    remove 2 lines below:<br>
    <blockquote type="cite" cite="mid:20240814101140.3165345-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
+		if (sh_mem-&gt;reset_flags == 0) //remove this
+			set_reset_state(sh_mem, true, NO_RESET_SET_BIT);</pre>
    </blockquote>
    <br>
    <blockquote type="cite" cite="mid:20240814101140.3165345-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
 		sync_point_exit(sh_mem);
 		num_of_tests--;
 		test_counter++;
@@ -1000,7 +1015,7 @@ igt_main
 			igt_describe(&quot;Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes&quot;);
 			igt_subtest_with_dynamic_f(&quot;amdgpu-%s-%s&quot;, ip_tests[i] == AMD_IP_COMPUTE ? &quot;COMPUTE&quot;:&quot;GRAFIX&quot;, it-&gt;name) {
 				if (arr_cap[ip_tests[i]] &amp;&amp; get_next_rings(ring_id_good, info, &amp;ring_id_good, &amp;ring_id_bad, i)) {
-					igt_dynamic_f(&quot;amdgpu-%s-ring-good-%d-bad-%d-%s&quot;, it-&gt;name,ring_id_good, ring_id_bad, ip_tests[i] == AMD_IP_COMPUTE ? &quot;COMPUTE&quot;:&quot;GRAFIX&quot;)
+					igt_dynamic_f(&quot;amdgpu-%s-ring-good-%d-bad-%d-%s&quot;, it-&gt;name, ring_id_good, ring_id_bad, ip_tests[i] == AMD_IP_COMPUTE ? &quot;COMPUTE&quot;:&quot;GRAFIX&quot;)
 					set_next_test_to_run(sh_mem, it-&gt;test, ip_background, ip_tests[i], ring_id_good, ring_id_bad);
 				}
 			}
</pre>
    </blockquote>
  </body>
</html>

--------------aRsTHKRVn3iO8sKLLvalGhDu--
