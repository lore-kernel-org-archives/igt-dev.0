Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76451D3A66D
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 16:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB66810E25E;
	Tue, 29 Oct 2024 16:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P3neb6qO";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B409210E25E
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 16:01:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wtu3TtedfKNQw+8Wue/5pzXVa/mO6DSXeIGrVFigDHqhwdu6y9lzP7rfIoum56o7dFomU2qMufBW7Gwhdm1I/KE5E65Q3AgXjvFO0AFaAJJpOGKU/9/WKsOzWO0yFWsnGl8LV20/xsA8k4Eu/Ye3kFQv4bDv7AvTqA2t01esey/75cNjKQ1+mdsGsTUEILaAU41/UdlDVxFjw8lafb7A5C6YiOsgOh5xAFf89LfksrHEN6kkdvY8V3rbRGkGJhr24/c/Xi7kNNeVnU2UYSgWQM59N5lmSU7O+YvHX+jrjBRQljVZ3uAh1vpXTXD34nFzBa+unNyJY+4w5VJrn6ARzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shaYJRz4cI+UzjNIKUUmalXyfmh7VcflZvlYw9lq7mg=;
 b=uhLTxN61X93j45rK5Guna30nMqbNRypWhIMUAlKT0wZ33Rxz2uOFYYky0pMtSLxEZTfrOGulxj+yjP1SXQljViLaXaFPltPB3Ik0UHUfziNNLPN+x1/y9F+IBQo7nycMulYS3qxd/wFB5RpWLu7z2snIoH9ZWKeUL/KTwVQhAm3eWfUgLgA6CPnJQ1tiAHm934zgc7Q8kFg/HGJ9GZitDW36UUH6QKkCTG6DnksnpfuNQM0uFOeAk9vEfi8FSnn3gGFCy/IY0UsTV1Dr1rhZypSBrvUzrWP9puD8Pl0BnEb4EAaodXgk3qZyKVaXizQudow3z//H9NfCINTQVv/hPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shaYJRz4cI+UzjNIKUUmalXyfmh7VcflZvlYw9lq7mg=;
 b=P3neb6qOpiHHMqi5f5hhFQqiHboe2roE0e9X6hanekjWVxPFo+K6Ijbto1A3hwua6FnpAgwivqZh8VEsjkmRL7oDAg6zmrMKVcQIoAxDscAj1p5t1M6Pjhbmw77qYqy7T6bL5IVa2nFj46NqWO5gcmemxs16vmXAdWR7Gfrpd4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by CH2PR12MB4328.namprd12.prod.outlook.com (2603:10b6:610:a6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.19; Tue, 29 Oct
 2024 16:01:16 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%4]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 16:01:16 +0000
Message-ID: <5aa4d805-a6a1-4f06-a68d-4754286c882b@amd.com>
Date: Tue, 29 Oct 2024 10:01:11 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] tools/amd_hdmi_compliance: Additional functionalities
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, mark.broadworth@amd.com, sunpeng.li@amd.com
References: <20241024210345.511501-1-alex.hung@amd.com>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20241024210345.511501-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0012.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::25) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|CH2PR12MB4328:EE_
X-MS-Office365-Filtering-Correlation-Id: 4920e615-e9d4-4eae-b424-08dcf832eb39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVRRMGl3K1RjL0FGSFVPSFRoVytBb1RoeXlLNkNCL1puYlM4bUloRWtBeEZG?=
 =?utf-8?B?MUpORkxJQlhHakQ2TU5paVkyV1ZvcGcwa1FsS3VIZi9LNkZFQUp1TFA4eGJS?=
 =?utf-8?B?NnY4U251ekpRSHJycW82QXduckgwa3RBN1RnVC9XMXlXdk9TYjlNZER1cTNv?=
 =?utf-8?B?Vm9EWFIyQW4wTUdsNEtvdkd0UzQ4UDc4QzhOejN0T0gxN3c0TVJXcTNXV1Jk?=
 =?utf-8?B?MHBscHZJaXlKSzZXYnZzTVpJVUE0MXE1bXp4ejVSQlBidEhBaktMOGNNbkts?=
 =?utf-8?B?MkNGZTROT1VWVXA0ekZJNW5aQXNwVUZmdys1UmJmek8wNmJJUE5OVm9qMWtR?=
 =?utf-8?B?S0hhQXNGMUVZelhHT1hEdVhEOUcxWEF0N1o1TXNKQ3liSHlTby8waDYyZXZu?=
 =?utf-8?B?NHhsK0tPUmZPQnlnNXRQT3R2OXJvOFNlTkVMOEtpQ1hsL3ZoemdPUHVYYXlp?=
 =?utf-8?B?MHI4bWNKeTNob1ZsYlZLTjZEWGYwbTh6VTFtSmYrUzdEeUVRRkg5RDAvY2s4?=
 =?utf-8?B?RFN4V2wrdEhleWdqRzdVY3RMNkFpcmNtWm9HMEtiRWRVY3dVNElvcU1jMDFC?=
 =?utf-8?B?MFREeHZTODNnaUUzak04THE4UW96ZmRXM0Jnbkxvcm9IVDNSVXZwOWdCRkFz?=
 =?utf-8?B?K09iQ3JmMytqVnVNbVZqRkRGR3hZQmlaS1Y1emFTYzdjek9mbFhUVm5IMHJa?=
 =?utf-8?B?TDc5UTY4OEtoRUZKYmVrdlJtVzFxRE5QOEJzSDZtUWpHZU9yZGpxTnA0TkpO?=
 =?utf-8?B?dHU0SmhnVHAxVVNzVkZCanB4aG5WcGZqZzJPVVhSSzdiSlZuRHdsVExBbTJ3?=
 =?utf-8?B?dXBvREo2YmJrZmV1NmtqZzNGRlVVMUlXOUxsY09sTEJNSGUwVUVGNFVDZm5w?=
 =?utf-8?B?NVY3NVgybUpXMDlNZktoSUdYdXR1NlMydnE1NUF1SHdIbGRFTGx4Q0piWEIy?=
 =?utf-8?B?cjhoTW9tc3IrVlBWWU1wVkFwQmhCZWtDVU9KeTRudXRQWVpWbHhmSzd5eDJh?=
 =?utf-8?B?SGJlTVJjNHVYRXRoejVLckJwV1BZaisyMXB6OHBFOGlJOXNzQkJQcFJkaERF?=
 =?utf-8?B?QWJiUGRuY1R1VlBDSjMvcDN5ZjdCVkQraFBSNng2cWR1NWhEdXZ4MlBjL00v?=
 =?utf-8?B?b1Ywc3ROa2xDK1JyMHNVLzZzSG9FOUNMUWNEYTFtYTVpMSt4UWtmdWd1RVd3?=
 =?utf-8?B?VGJpYUJ5YkVVd2hLMkZwZXlaWCsrOGloQVd3bktOK2ZQWkVxSGtodzE2UWk2?=
 =?utf-8?B?MklHRnlENUxLdW1xeVRxRGdqYWpHU2FTc1RMdis4ZUloYW9udzhaRlBJWllw?=
 =?utf-8?B?RktIZEpYU01BeTZ4OVN5SnZwYTVWQTVXKytvcy94QTB2eVNTd0dWVE9zZzZI?=
 =?utf-8?B?TUFGT0dMUFF6YjVHMG14d0hBYmorTzRrR05nMDR3R3dUZFh5MnRmL09RR2RW?=
 =?utf-8?B?UFpRdktZdGQ4bElYbThHR1RTbm9lY0FYSG1ZcWk4dHNUNjdYS05lNlVnZjND?=
 =?utf-8?B?NnJjZ2wvbmxRY3hXenl5bXpFOVZvRWo1WEY1T1ZRbXVVNEFvSE9ZUTJRUXho?=
 =?utf-8?B?UzFSb2pDd3QyaklLMjhWZWdHYVdyeGxXTHhFQnNDSDRBakExT2doY1hlVGVG?=
 =?utf-8?B?eU9pUmd1WHlja20wRVhKTCtwMGxNdW9tNWJ3NDZlMVJTS0dzNGNVSnNqaUxa?=
 =?utf-8?B?L2xHcnlqbWRHcjVDYXk2VWNFdVJWV3owZGlqVFVvUTZiUVdBMm1HaEFQY2sw?=
 =?utf-8?Q?jv3eWaM1pWxeZKPVoys0fDRNS0lihLyOAXn2WbX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTNHcHc1WjJYNHNZL3dKT29UU2VVVDR6dy96c1NsMmtlVjd6cU5xL2svOXQ4?=
 =?utf-8?B?azhQVFBkT1FGSnJZaXhlMXFzcmZvNzlRNWo1eFBmS2dhVEprYlU4NDdKeTRO?=
 =?utf-8?B?dlZZTkdWWlBuYXNKVFQ2MXB3d1g1Z1RuU29XaG1MUFVRMEV3SUhFN2U2UGJI?=
 =?utf-8?B?MWNKYkFEWmxBQkNTMHZ4alc0RFlTTEtXMmRkTE5ab2dkUGgvNnJTUmdIYk55?=
 =?utf-8?B?UThLZFUzc2hLa3RUV3k0cXFiRUQ5cmVNQlhHRXlXR01LdU4vTyt4NGdSRmZM?=
 =?utf-8?B?ZE5wZ01RTk5xOHlkUkVBQVJKNmFQaEJBejVZbjV4S3lBWjF5Y1FuMG1sZGRL?=
 =?utf-8?B?Yk9RTXNhSVE0UDBqNjVRaHExakNZWUdvbEY3QndRMTRTSXQ2K3Btd2lKeFZp?=
 =?utf-8?B?dUJ4L2swWm1sOTNibXVMM1lrUTNUY3BjKzFvUE82VEZ0OFZIRmg0TUVuVmRJ?=
 =?utf-8?B?T0pZUkFVbG41NXBGK205WE1lRWZKTE5kTjFhSkgzdGZOOHNQNm56UndFQlZp?=
 =?utf-8?B?cHlvOWRROUlVNURTQ0NQVCtWTVJNUjJvUXlBWWhZcjYxRU9TQmc0cUphQ3FB?=
 =?utf-8?B?MnZRM0FyZVl3OXg5aHhKL1Y3angyZ2dqWnF3b0hIVS9FMjBqemY1a0hBOUY0?=
 =?utf-8?B?MTdkaDduY2o1ZG9aSFYzUWJyQW5PTkFpQUs5dStLTW85N1dLZVk3TW1qK1Uz?=
 =?utf-8?B?aHlqUGxha05oMTRUdWVsaXlqUDV5TjBiNUNkL3pFUXI0U3B2OFBoZmo3a0ZT?=
 =?utf-8?B?Z2Nwa1RHRnRKUUJQRkxpbUszbEVqZGZ1QmdzSDBqTWtRblk4WnpDN1hjSVlV?=
 =?utf-8?B?SEcxeEJxVzNVeUxNS3doUGluaGJBdHVtWEEzVXY5c2drWHF2SXBoZVZWYzFO?=
 =?utf-8?B?N1JBM2ZnUGRxa3I2YnZGVTNOVjZsTzFkT3ZrSm9rYnI5TmpBWnd2eG9DVkRl?=
 =?utf-8?B?NDh2bHlHQytZT3Z4eG9xaEE0THhiQzNLYlVsM2Q5V0p5b2xCWXo4bmg3NW9Y?=
 =?utf-8?B?YUtYSXUwblNxa3RSRnlSdGdzbFAxckxDZ0NnUmk5TUZ1ZXRncU9QS2tVTjhS?=
 =?utf-8?B?L0FvNmYwZFRxRWhnWWVPSTh0OGs0RmxYazVIMitYZFZuenlRZkErUU5Nc1Zv?=
 =?utf-8?B?alhwMHhIRkZ6bDgvcFJ0TzlVa1pTa0p2ZGU5SEFIZnV3RXZ1WExQSHZEOHZ1?=
 =?utf-8?B?bk1Jc0puTTgrbkhYVlNid3hnL3R2ZXFlMXdCaGw1bHdwUStPWXp3VmlKaDc1?=
 =?utf-8?B?VVQwVlNVM3dpOWtmeE96amFCbDErTDh2OFFuL2F6Sm5XSTZ1V3R0WndwU05R?=
 =?utf-8?B?Wm1GN1hSaVdSNDdmUVRIRmNHR0E0MVlqMEhFRGpKenU2UVlkdDlIZlBiekMw?=
 =?utf-8?B?c0JwQUxISzBLMjF2RVdQZzc5TXdBTjhkN2UvNXdlZEt4L2ZsZ2hzbDNLL3Fr?=
 =?utf-8?B?RTcvU0JUQmlwenhSRlRjTW80Y3pEcU9ZZzR2S1BaNHVBNXlacjIvWVpsdUJu?=
 =?utf-8?B?ZFRpeERYalUveVlMTnNINVBXZHdXQWhEc29RZWFEbThqNEhBYXkvVmE2UGkv?=
 =?utf-8?B?RTA4b3VjZmpuZlFqbnlLbklZWmVXVVRWbjdzVVVFWnhKVDRYRnE3M3VDbEtF?=
 =?utf-8?B?SU1rb0V2bjhYRHB0OFc5cEhFL0IxWFpqRHNOZnFpc3FlU2xMYldOSldQOFhr?=
 =?utf-8?B?c1dRT2xzSkJqWDZ1TnBhTWE3elNSTk9qQitvenZVMFJzZ0ovcnYvZDBGemlF?=
 =?utf-8?B?N3dNb0hZTHVoL254aXBXQW9MNTNiTGVqenFTajNRM09YODVFbGhyYnBuWHVj?=
 =?utf-8?B?M2FHRldSdDMzTXRTZWNkZ0J0cjQxOGwrT1hHRDVkekMwZWNUbHR3MWRjeXJR?=
 =?utf-8?B?SzVISTczb3gxWnhTN0FDd1o1U2JsRDhEZlBaNzZMMXdtWmlGdHZtSHJEdEx0?=
 =?utf-8?B?cUFiWGI3Z2FKRVViUUdsZDJudDRQWEp1b2YrN2M2TlJzam5Pdnd2R1JnRFJi?=
 =?utf-8?B?LytHZzE4SFdhRExDcWltUTI5MzhMb1VTcCs0U1VSTTBteHhqVGRiMGdZUWd5?=
 =?utf-8?B?b3duSlhuUHQyNzhIK0YySWpiTlJPRG9lT3U4Q2N4c05TV2JSRFczbE5HT3Np?=
 =?utf-8?Q?ergucjMJAFgqb9e0/K8yJ7HXs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4920e615-e9d4-4eae-b424-08dcf832eb39
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:01:16.2859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lhy6zXZ2PJ8FmyFt3HA/57noOAlpcaycaKAVY2GxPtigdACfjbuP8NcCslN6+3TN8kTawUi8WCLbjmFX8Z8jeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4328
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



On 10/24/24 3:03 PM, Alex Hung wrote:
> From: Wayne Lin <Wayne.Lin@amd.com>
> 
> It needs different timings, pixel format and color depth combination
> to pass CTS under different HDMI versions. As the result, we extend
> this to:
> 
> - Add additional timings and info. Especially aspect ratio which
>    will impact the VIC code.
> - Can specify the connector to display the test pattern.
> - Set connector property "max bpc" to force bpc.
> - Set connector debugfs entry "force_yuv420_output" to enable
>    using yuv420 pixel format.
> 
> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> ---
>   tools/amd_hdmi_compliance.c | 422 ++++++++++++++++++++++++++++++++----
>   1 file changed, 380 insertions(+), 42 deletions(-)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index 1a7592995..633d980bc 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -21,6 +21,8 @@
>    */
>   
>   #include "igt.h"
> +#include "igt_sysfs.h"
> +#include <fcntl.h>
>   
>   /* Common test data */
>   typedef struct data {
> @@ -36,52 +38,328 @@ typedef struct data {
>   
>   /* Video modes indexed by VIC */
>   static drmModeModeInfo test_modes[] = {
> -	[1] = { 25175,
> +	[0] = { 25175,
>   		640, 656, 752, 800, 0,
>   		480, 489, 492, 525, 0,
> -		60, 0xa, 0x40,
> -		"640x480",	/* VIC 1 */
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
> +		0x40, "640x480",	/* VIC 0 */
> +	},
> +	[1] = { 25175,
> +		640, 656, 752, 800, 0,
> +		480, 490, 492, 525, 0,
> +		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
> +		0x40, "640x480",	/* VIC 1 */
> +	},
> +	[2] = { 27000,
> +		720, 736, 798, 858, 0,
> +		480, 489, 495, 525, 0,
> +		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
> +		0x40, "720x480",	/* VIC 2 */
> +	},
> +	[3] = { 27000,
> +		720, 736, 798, 858, 0,
> +		480, 489, 495, 525, 0,
> +		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "720x480",	/* VIC 3 */
> +	},
> +	[4] = { 74250,
> +		1280, 1390, 1430, 1650, 0,
> +		720, 725, 730, 750, 0,
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1280x720",	/* VIC 4 */
> +	},
> +	[16] = { 148500,
> +		1920, 2008, 2052, 2200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1920x1080",	/* VIC 16 */
> +	},
> +	[17] = { 27000,
> +		720, 732, 796, 864, 0,
> +		576, 581, 586, 625, 0,
> +		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
> +		0x40, "720x576",	/* VIC 17 */
> +	},
> +	[18] = { 27000,
> +		720, 732, 796, 864, 0,
> +		576, 581, 586, 625, 0,
> +		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "720x576",	/* VIC 18 */
> +	},
> +	[19] = { 74250,
> +		1280, 1720, 1760, 1980, 0,
> +		720, 725, 730, 750, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1280x720",	/* VIC 19 */
> +	},
> +	[31] = { 148500,
> +		1920, 2448, 2492, 2640, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1920x1080",	/* VIC 31 */
> +	},
> +	[63] = { 297000,
> +		1920, 2008, 2052, 2200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1920x1080",	/* VIC 63 */
> +	},
> +	[64] = { 297000,
> +		1920, 2448, 2492, 2640, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1920x1080",	/* VIC 64 */
> +	},
> +	[65] = { 59400,
> +		1280, 3040, 3080, 3300, 0,
> +		720, 725, 730, 750, 0,
> +		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 65 */
> +	},
> +	[66] = { 74250,
> +		1280, 3700, 3740, 3960, 0,
> +		720, 725, 730, 750, 0,
> +		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 66 */
> +	},
> +	[67] = { 74250,
> +		1280, 3040, 3080, 3300, 0,
> +		720, 725, 730, 750, 0,
> +		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 67 */
> +	},
> +	[68] = { 74250,
> +		1280, 1720, 1760, 1980, 0,
> +		720, 725, 730, 750, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 68 */
> +	},
> +	[69] = { 74250,
> +		1280, 1390, 1430, 1650, 0,
> +		720, 725, 730, 750, 0,
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 69 */
> +	},
> +	[70] = { 148500,
> +		1280, 1720, 1760, 1980, 0,
> +		720, 725, 730, 750, 0,
> +		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 70 */
> +	},
> +	[71] = { 148500,
> +		1280, 1390, 1430, 1650, 0,
> +		720, 725, 730, 750, 0,
> +		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 71 */
> +	},
> +	[72] = { 74250,
> +		1920, 2558, 2602, 2750, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 72 */
> +	},
> +	[73] = { 74250,
> +		1920, 2448, 2492, 2640, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 74 */
> +	},
> +	[74] = { 74250,
> +		1920, 2008, 2052, 2200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 74 */
> +	},
> +	[75] = { 148500,
> +		1920, 2448, 2492, 2640, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 75 */
> +	},
> +	[76] = { 148500,
> +		1920, 2008, 2052, 2200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 76 */
> +	},
> +	[77] = { 297000,
> +		1920, 2448, 2492, 2640, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 77 */
> +	},
> +	[78] = { 297000,
> +		1920, 2008, 2052, 2200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 78 */
> +	},
> +	[79] = { 59400,
> +		1680, 3040, 3080, 3300, 0,
> +		720, 725, 730, 750, 0,
> +		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 79 */
> +	},
> +	[80] = { 59400,
> +		1680, 2908, 2948, 3168, 0,
> +		720, 725, 730, 750, 0,
> +		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 80 */
> +	},
> +	[81] = { 59400,
> +		1680, 2380, 2420, 2640, 0,
> +		720, 725, 730, 750, 0,
> +		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 81 */
> +	},
> +	[82] = { 82500,
> +		1680, 1940, 1980, 2200, 0,
> +		720, 725, 730, 750, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 82 */
> +	},
> +	[83] = { 99000,
> +		1680, 1940, 1980, 2200, 0,
> +		720, 725, 730, 750, 0,
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 83 */
> +	},
> +	[84] = { 165000,
> +		1680, 1740, 1780, 2000, 0,
> +		720, 725, 730, 825, 0,
> +		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 84 */
> +	},
> +	[85] = { 198000,
> +		1680, 1740, 1780, 2000, 0,
> +		720, 725, 730, 825, 0,
> +		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 85 */
> +	},
> +	[86] = { 99000,
> +		2560, 3558, 3602, 3750, 0,
> +		1080, 1084, 1089, 1100, 0,
> +		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 86 */
> +	},
> +	[87] = { 90000,
> +		2560, 3008, 3052, 3200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 87 */
> +	},
> +	[88] = { 118800,
> +		2560, 3328, 3372, 3520, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 88 */
> +	},
> +	[89] = { 185625,
> +		2560, 3108, 3152, 3300, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 89 */
> +	},
> +	[90] = { 198000,
> +		2560, 2808, 2852, 3000, 0,
> +		1080, 1084, 1089, 1100, 0,
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 90 */
> +	},
> +	[93] = { 297000,
> +		3840, 5116, 5204, 5500, 0,
> +		2160, 2168, 2178, 2250, 0,
> +		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "4096x2160",	/* VIC 93 */
> +	},
> +	[94] = { 297000,
> +		3840, 4896, 4984, 5280, 0,
> +		2160, 2168, 2178, 2250, 0,
> +		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "3840x2160",	/* VIC 94 */
> +	},
> +	[95] = { 297000,
> +		3840, 4016, 4104, 4400, 0,
> +		2160, 2168, 2178, 2250, 0,
> +		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "3840x2160",	/* VIC 95 */
>   	},
>   	[96] = { 594000,
>   		 3840, 4896, 4984, 5280, 0,
>   		 2160, 2168, 2178, 2250, 0,
> -		 50, 0x5|DRM_MODE_FLAG_PIC_AR_16_9, 0x40,
> -		 "3840x2160",	/* VIC 96 */
> +		 50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		 0x40, "3840x2160",	/* VIC 96 */
>   	},
>   	[97] = { 594000,
>   		 3840, 4016, 4104, 4400, 0,
>   		 2160, 2168, 2178, 2250, 0,
> -		 60, 0x5|DRM_MODE_FLAG_PIC_AR_16_9, 0x40,
> -		 "3840x2160",	/* VIC 97 */
> +		 60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		 0x40, "3840x2160",	/* VIC 97 */
> +	},
> +	[98] = { 297000,
> +		 4096, 5116, 5204, 5500, 0,
> +		 2160, 2168, 2178, 2250, 0,
> +		 24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		 0x40, "4096x2160",	/* VIC 98 */
> +	},
> +	[99] = { 297000,
> +		 4096, 5064, 5152, 5280, 0,
> +		 2160, 2168, 2178, 2250, 0,
> +		 25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		 0x40, "4096x2160",	/* VIC 99 */
> +	},
> +	[100] = { 297000,
> +		 4096, 4184, 4272, 4400, 0,
> +		 2160, 2168, 2178, 2250, 0,
> +		 30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		 0x40, "4096x2160",	/* VIC 100 */
>   	},
>   	[101] = { 594000,
>   		  4096, 5064, 5152, 5280, 0,
>   		  2160, 2168, 2178, 2250, 0,
> -		  50, 0x5|DRM_MODE_FLAG_PIC_AR_256_135, 0x40,
> -		  "4096x2160",	/* VIC 101 */
> +		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		  0x40, "4096x2160",	/* VIC 101 */
>   	},
>   	[102] = { 594000,
>   		  4096, 4184, 4272, 4400, 0,
>   		  2160, 2168, 2178, 2250, 0,
> -		  60, 0x5|DRM_MODE_FLAG_PIC_AR_256_135, 0x40,
> -		  "4096x2160",	/* VIC 102 */
> +		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		  0x40, "4096x2160",	/* VIC 102 */
> +	},
> +	[103] = { 297000,
> +		  3840, 5116, 5204, 5500, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "4096x2160",	/* VIC 103 */
> +	},
> +	[104] = { 297000,
> +		  3840, 4896, 4984, 5280, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "3840x2160",	/* VIC 104 */
> +	},
> +	[105] = { 297000,
> +		  3840, 4016, 4104, 4400, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "3840x2160",	/* VIC 105 */
>   	},
>   	[106] = { 594000,
>   		  3840, 4896, 4984, 5280, 0,
>   		  2160, 2168, 2178, 2250, 0,
> -		  50, 0x5|DRM_MODE_FLAG_PIC_AR_64_27, 0x40,
> -		  "3840x2160",	/* VIC 106 */
> +		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "3840x2160",	/* VIC 106 */
>   	},
>   	[107] = { 594000,
>   		  3840, 4016, 4104, 4400, 0,
>   		  2160, 2168, 2178, 2250, 0,
> -		  60, 0x5|DRM_MODE_FLAG_PIC_AR_64_27, 0x40,
> -		  "3840x2160",	/* VIC 107 */
> +		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "3840x2160",	/* VIC 107 */
>   	},
>   };
>   
>   /* Common test setup. */
> -static void test_init(data_t *data)
> +static void test_init(data_t *data, int conn_id)
>   {
>   	igt_display_t *display = &data->display;
>   
> @@ -90,19 +368,22 @@ static void test_init(data_t *data)
>   
>   	igt_display_reset(display);
>   
> -	/* find a connected HDMI output */
> +	/* find a connected output */
>   	data->output = NULL;
>   	for (int i=0; i < data->display.n_outputs; ++i) {
> -		drmModeConnector *connector = data->display.outputs[i].config.connector;
> -		if (connector->connection == DRM_MODE_CONNECTED &&
> -				(connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> -				 (data->use_virtual_connector &&
> -				  connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL))) {
> +		drmModeConnector *conn = data->display.outputs[i].config.connector;
> +
> +		if ((data->use_virtual_connector &&
> +		     conn->connector_type == DRM_MODE_CONNECTOR_VIRTUAL) ||
> +		    (conn->connector_type == DRM_MODE_CONNECTOR_HDMIA &&
> +		     conn->connection == DRM_MODE_CONNECTED &&
> +		     (conn_id == 0 || conn->connector_id == conn_id))) {
>   			data->output = &data->display.outputs[i];
> +			break;
>   		}
>   	}
>   
> -	igt_require(data->output);
> +	igt_require_f(data->output, "No valid connectors found\n");
>   
>   	data->primary =
>   		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> @@ -123,22 +404,57 @@ static void wait_for_keypress(void)
>   		;
>   }
>   
> -static void test_vic_mode(data_t *data, int vic)
> +/* Write 0 or 1 to debugfs entry "force_yuv420_output" of connector */
> +static void set_force_yuv420(data_t *data, int force, int conn_id)
> +{
> +	int fd, res;
> +
> +	test_init(data, conn_id);
> +
> +	igt_info("Setting force_yuv420_output to %d on connector id %d\n",
> +		 force ? 1 : 0, data->output->config.connector->connector_id);
> +
> +	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +
> +	res = igt_sysfs_write(fd, "force_yuv420_output", force ? "1" : "0", 2);
> +	igt_require(res > 0);
> +
> +	close(fd);
> +	test_fini(data);
> +}
> +
> +/* Set "max bpc" property of connector */
> +static void set_max_bpc(data_t *data, int max_bpc, int conn_id)
> +{
> +	igt_display_t *display = &data->display;
> +
> +	test_init(data, conn_id);
> +
> +	igt_info("Setting max bpc to %d on connector id %d\n",
> +		 max_bpc, data->output->config.connector->connector_id);
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, max_bpc);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	test_fini(data);
> +}
> +
> +/* Override video mode with specified VIC. */
> +static void test_vic_mode(data_t *data, int vic, int conn_id)
>   {
>   	igt_display_t *display = &data->display;
>   	drmModeModeInfo *mode;
>   	igt_fb_t afb;
>   
> -	test_init(data);
> +	test_init(data, conn_id);
>   
>   	mode = &test_modes[vic];
>   
> +	igt_info("Setting mode %s on connector id %d\n",
> +		 mode->name, data->output->config.connector->connector_id);
>   	igt_output_override_mode(data->output, mode);
> -
>   	igt_create_pattern_fb(data->fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888, 0, &afb);
> -
>   	igt_plane_set_fb(data->primary, &afb);
> -
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
>   	igt_info("Press [Enter] to finish\n");
> @@ -147,20 +463,27 @@ static void test_vic_mode(data_t *data, int vic)
>   	test_fini(data);
>   }
>   
> -const char *optstr = "hvt:";
> +const char *optstr = "hvt:i:b:y:";
>   static void usage(const char *name)
>   {
> -	igt_info("Usage: %s [options]\n", name);
> -	igt_info("-h      Show help\n");
> -	igt_info("-t vic  Select video mode based on VIC\n");
> -	igt_info("-v      Test on 'Virtual' connector as well, for debugging.\n");
> +	igt_info("Usage: %s options\n", name);
> +	igt_info("-h		Show help\n");
> +	igt_info("-t vic	Select video mode based on VIC\n");
> +	igt_info("-v		Test on 'Virtual' connector as well, for debugging.\n");
> +	igt_info("-i conn_id	Use connector by ID\n");
> +	igt_info("-b max_bpc	Set \"max bpc\" connector property\n");
> +	igt_info("-y 0|1	Write 0 or 1 to connector's debugfs force_yuv420_output\n");
> +	igt_info("NOTE: if -i is not specified, first connected HDMI connector will be used for -t, -b and -y\n");
>   }
>   
>   int main(int argc, char **argv)
>   {
>   	data_t data;
>   	int c;
> -	int vic = 1; /* default to VIC 1 (640x480) */
> +	int vic = 0;
> +	int conn_id = 0;
> +	int max_bpc = 0;
> +	int force_yuv_420 = -1;
>   
>   	memset(&data, 0, sizeof(data));
>   
> @@ -169,9 +492,18 @@ int main(int argc, char **argv)
>   		case 't':
>   			vic = atoi(optarg);
>   			break;
> +		case 'i':
> +			conn_id = atoi(optarg);
> +			break;
>   		case 'v':
>   			data.use_virtual_connector = true;
>   			break;
> +		case 'b':
> +			max_bpc = atoi(optarg);
> +			break;
> +		case 'y':
> +			force_yuv_420 = atoi(optarg);
> +			break;
>   		default:
>   		case 'h':
>   			usage(argv[0]);
> @@ -179,13 +511,6 @@ int main(int argc, char **argv)
>   		}
>   	}
>   
> -	if (vic < 1 ||
> -		vic > ARRAY_SIZE(test_modes) ||
> -		!test_modes[vic].name[0]) {
> -		igt_warn("VIC %d is not supported\n", vic);
> -		exit(EXIT_FAILURE);
> -	}
> -
>   	data.fd = drm_open_driver_master(DRIVER_ANY);
>   	kmstest_set_vt_graphics_mode();
>   
> @@ -193,7 +518,20 @@ int main(int argc, char **argv)
>   	igt_require(data.display.is_atomic);
>   	igt_display_require_output(&data.display);
>   
> -	test_vic_mode(&data, vic);
> +	if (force_yuv_420 >= 0)
> +		set_force_yuv420(&data, force_yuv_420, conn_id);
> +
> +	if (max_bpc)
> +		set_max_bpc(&data, max_bpc, conn_id);
> +
> +	if (vic) {
> +		if (vic > ARRAY_SIZE(test_modes) ||
> +		!test_modes[vic].name[0]) {

I think it would be more readable if this check were in the same line. 
Also, you can drop all braces in these conditions.

With those changes:

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

> +			igt_warn("VIC %d is not supported\n", vic);
> +		} else {
> +			test_vic_mode(&data, vic, conn_id);
> +		}
> +	}



>   
>   	igt_display_fini(&data.display);
>   }

