Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29859C2BA18
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 03:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B36910E913;
	Fri, 21 Jun 2024 03:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wEyG9FxJ";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380F510E913
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 03:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNYNfkufAnP/8BBD/CQjpAByTzpNVoBNIkLvvYpPqjdFJruY3jHmmDEyM2g5o7stBDtflj+c9qrOtpEFHdSWorTvujWHMElNt2Qzra9AgUSUEsAWDOuJuaKMItLIa6kdjQ2dorQXTdhzADcnEvzRVMAsQGzFm7xR4tg43Q6J9LpnA6wQSy7dkw6+zJEJ9zy2O3g0xuxWV9EH2JWNlJC4B4QBkSVFaRbEkURih9uPZzt9Vt6ZaKsgz0rCtOzvWRTKYS78IEz0G5aB4c4XVFAGEb+brstcEME1If7MPo4lPRzwpT8u3UKJn81BqYfHQ4o8Q8H/s5waCOUFdRGLPz2jaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+OUZbUxxr49OmGL9tYyBefh1Ngwf2iTj+SDApkA4SQ=;
 b=c2czcIg0rKNHdV+kSfzj6SI5ocm3m5tHNjour0H5qrQf02G0Cognb826lsMl0RO/I9LUZ1J4XGmSOgWf9tjA/vKYMej87ELO4VpcccbMYiWTI7KX3LV4JlQ/LAQPK4/JXGDV9lBmR5GYIQvIbnv/hI0qUMymmrySgthhIsMEYB7O5UYf9jvp7GO3ozU0GG7RD8JlkRwKNpfBwntSePL78DP6mo/JRe0kC7aahCUDoZUeRl6VWhlTAYWl/C4MZOcUqV4XURuSV1Gxk6SrWAPyTHpXp4dPz73WmGogD2BRuNK1VKpruaG0UsEkSXakkP3uJNYkGc9G+RDM4s4PkUcB0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+OUZbUxxr49OmGL9tYyBefh1Ngwf2iTj+SDApkA4SQ=;
 b=wEyG9FxJmBVK92bQVJ6gJglja02kN9dSfuPZWxSkXm9v05w+qB6ln6FyDVJS9OOK0KDGGDYSvCF3J5DJQlQu1rio46Ac/IPk1Ri6idFtiwxh4AhXNw9bWdNlPZF1Xy2c7b6P9EKRqyKWKOfkxyFFF2HbFi/3ycuS5brafp8EtYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6401.namprd12.prod.outlook.com (2603:10b6:208:3b1::8)
 by MW4PR12MB7168.namprd12.prod.outlook.com (2603:10b6:303:22d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 03:05:25 +0000
Received: from BL3PR12MB6401.namprd12.prod.outlook.com
 ([fe80::8c97:7b76:6800:ae9e]) by BL3PR12MB6401.namprd12.prod.outlook.com
 ([fe80::8c97:7b76:6800:ae9e%4]) with mapi id 15.20.7677.030; Fri, 21 Jun 2024
 03:05:24 +0000
Message-ID: <ce33fe83-afb0-4e6a-9330-9904e5a742b5@amd.com>
Date: Thu, 20 Jun 2024 23:05:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3 V2] lib/amdgpu: add gfx12 family id
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240621024958.2293940-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240621024958.2293940-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0010.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::25) To BL3PR12MB6401.namprd12.prod.outlook.com
 (2603:10b6:208:3b1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6401:EE_|MW4PR12MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b416c6-9e6f-4a77-9e20-08dc919efed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1drT0RWSHFxRk52amdSWFlCcVFjL0xybzFiMWgxQVc1eGU2aUNxNlhWQkNs?=
 =?utf-8?B?YTZmbGNickZDS2FTNDBEemZ4VU9YNGxSZ0tMeG9yc3lBanlMY1JiTWdidVdu?=
 =?utf-8?B?UzdkVVExWG5Jc0F3aWxxZStCaWhhM3FTMW50c1B5NzRIZE5jUUdtSjJOTTFX?=
 =?utf-8?B?RDh3YmpiZHlJWFRFNWU5SFdzdGxjWnpiY3UxTGFOU2FudU9pU0F1WHVoM2I3?=
 =?utf-8?B?NE1NZ3hHY3ltNVhrNXk1ZE93c01jenNITkJGWW1XMUZ0c0c5QUdqNG9GNWNK?=
 =?utf-8?B?OUphbG1VSUJ0SEkyK3kyM1pCczFKMXl6cDFrR1kvbUFvcVRQRlE2NGMxdjhO?=
 =?utf-8?B?WHBIRlFWL2NXNGRWemFZZVRxSHRzMUhKWGdCbmxLb08vQU81SnVGeUh1elgx?=
 =?utf-8?B?bXNrZExrL012Nk9uR0FRbGtMZmRiUkRwL25LeE1EZTlrVDFsNmllY2h2QlRo?=
 =?utf-8?B?a3BucXRBdjhwc2NwaVFVa3JSYi9oWlgwVDdtNjkzQWFCbHptR0tJNU1OV2dy?=
 =?utf-8?B?VEk1dDd4U2doeUR3cFFkaFg0YWdZUmFtTGdiUDI0S1Znb2VteVUyckxxWHdl?=
 =?utf-8?B?c1ZUeEl4eFhsNCt0aXVFRTRhbTk2VlNLdFRXRTRQajdYbUlSdmttZlFrRXY3?=
 =?utf-8?B?aDNOVTdVSkhYR1FEY2liMUNnQUxTWkFocURwWElVeFlGYmRkcWZZckJnQVdl?=
 =?utf-8?B?eGdCYmFwTkFpQy9KT3J6c1RQME5lcVB5Zjk5Z1hSajhsbTRFdkxVcHU0QkdD?=
 =?utf-8?B?VXhMVGloNUtjTkpXdnB0NWkyUVk3aHcrV0syQmtSV2FVdGFHcDdlVlcvdnpH?=
 =?utf-8?B?elJ6Y2FRbTROcFVlT2FpaDlhaU9iR3FsME5BQmxYRXlKUXRGZWV6WXpLdTdn?=
 =?utf-8?B?U29XMmpMVUtBbW9lTWFyZnplMmxYaFp4WW5yYnR3MUptOFdDa0ZRT2tvK0lx?=
 =?utf-8?B?NUlnc3BsTUx4N2Z6STQ1TDNscU14VEJTWnNQeFpnRks0ZTJ0bHhoZDQrTHVU?=
 =?utf-8?B?eTdhMHZGaHpEZDRZak55ek9QMm0rZnBOeldvbEhsTzlhdS9hU0g2cEVLM2tv?=
 =?utf-8?B?R2FYSVM5OVpwQW1oQjNoTkxQaGpGQ2ZxQk01cjdTVHN0OEtIbCtoQ0VQUDcv?=
 =?utf-8?B?Z0NCdVFkRkJ4SDd3WnFHMm9WSWxVeWFMZlY3bjBraXg2aXNOMjVHR1hXQm5z?=
 =?utf-8?B?Wms5aGMxZlczNjJrVjA3MWw0QVFjV2lJM3J2aGxqOU93L3JxMkJMbVJKMzZu?=
 =?utf-8?B?dU9jbEVBMnlkVCt0bkp5VnlHQ1pBc1E0SjFHUGNjR3NPMFR3R2xqRUVWQVA2?=
 =?utf-8?B?WGRCamRBeFFDV1QyZGVBN3pzT05yZWRHUnVvbktLYklBU0o4WXg0c2JPQlVH?=
 =?utf-8?B?RWJjWTFWNEZzSXZCMzlHOXBoQ3FuWWlrRkIzQkN2ZjlXdEJkS2pWRG40Nysz?=
 =?utf-8?B?aXJOWGZMdXVYSW8vZ0xmOFJvdUREazdxZTVQY2FOSWNiZ0krLzlra25kL3FX?=
 =?utf-8?B?QjVHTVJBY0RHQ2tlN1Z1N1Z6WWViNzd4Z05lYUhnOFJENGNJZzNGQ0F5aTha?=
 =?utf-8?B?WVQwY0k3ZVFKTlAzU2JYbnB5U0RMOFgvSWJUT0lXZVFkUE8rTkVITnpXNjV5?=
 =?utf-8?B?ZjVZTU1wTGpyUTFtVEVucEhTOXRZRWFETCtrczNPSGtlTUVVSGRlaWFEcG0w?=
 =?utf-8?B?TWZPSWhxRjJCQTh4Y2lOa2JtRHk0RTVEYmRabW9PeWpMaHpocjl2REFVK09M?=
 =?utf-8?Q?wS7k52VAiH70akY/80=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzBYUFR1YnFkWnd3YUhTdE1icWNXdWZ0Qzg0UjVkN0Uya2NET3o2bnJRMHJm?=
 =?utf-8?B?cm5KcUVUZmtjNFZWN0Urb3hpcktEeWtxZmplblhHaFRZKzVJcjM1UDlTZFh2?=
 =?utf-8?B?clBtZ0lxYWxLSnAyaTdzN0U1SG5COUdnbkR3NWg1MnZsZkRDY2laejIzbGdq?=
 =?utf-8?B?YUpNa0kzWmxNdk4yTHQ5NGdJUytUMlNZZmR3dzFCRjFBcEFDenRra1d4VEJp?=
 =?utf-8?B?eTJZVDd0WkpQRkYxa3lwV09JSEkxQ1RaU3NjaGRJc1FsOFBRL09GdmhSZ0Uy?=
 =?utf-8?B?eWZ4RVJ4NDFnNWgzQ3lmdU1wYllESE5zWGQzdWNRaWFwQ0cxejZLckFkWUht?=
 =?utf-8?B?U3lMVGYzeEh2a3ZPVGp3QnRtMjVMRGFFY0oyMnJRNGEwWTQyNTAvL0VINzl3?=
 =?utf-8?B?RWdXenJRSGowUEZwcW9jWithb3FlZjFwWkpKc2lzSk4vVGFNYTFtenFJRE5U?=
 =?utf-8?B?aVMzSk5yTngyYkRCUzd5Y1JpMC9hSmZweFVIMnh1eG1lZWR0QWY1dHBYRm5n?=
 =?utf-8?B?TEFObkY2ZDA5MEl3dUZhaXR5T2tTK1dRQ3J0aFJ0SDhoUkZhSFF4NHVWRVZx?=
 =?utf-8?B?Vjk3LzRPT3hhalBEN1EwbDlaclJtdFFWOHpLV1ZMamFBdFg2YVg0ZnVJZWNz?=
 =?utf-8?B?T21DWXlhTURBenZjVUJqVU9zRGFRWjVqTEdmamlaY0NWa3RYOWdTTy9vYmM3?=
 =?utf-8?B?OU45NHZESTloN3Bqc3B0cnRRbzAreFRGS3p1L29JMHZPMVV2T3MwalVFUDZy?=
 =?utf-8?B?bnpkWS9sUjFxNCtiM2FpY2ZlNHFiUmVaNVNoSkNvK01Ud08ycHlPZ2M4T0Fk?=
 =?utf-8?B?RVFFcW9oKzhTV0FLUkdnWTl1N0hqQWpkSFNjRFdjMFVybmJsNFZ4UFNHRlhP?=
 =?utf-8?B?K0NrUWFaKzdLbFF2ZFZ3SUw0dWdVaWhXYkNRYUhJRU5DdWZVdjl1a0thMkZF?=
 =?utf-8?B?RDdObmVKNTY5NXd1WE1iWFJSbllSQXc3ZDNWZFRaYlQwaVk0U2o2RW0vdnRk?=
 =?utf-8?B?L1dmcEJpYkFNbWFkc2FVOENleUFub0pRRUpQcVNNdlFpU3hDVThoLytvd0Ev?=
 =?utf-8?B?VmZwNDVMeGVoQ2grZWZqV3FNYklrTnRoQVdSb1UvUS9hemlqWW5pMkxNK1hu?=
 =?utf-8?B?YTJKWSs2NW5HSjFHdDROYW9JTkdSallFajNDL0NjNytubzRORExXZm0rbjJD?=
 =?utf-8?B?R1dmTk4veE9OcUtOblczNDd6dVJEL1NhZisvOUY0RUJsejVUbWJacnZ0M1BP?=
 =?utf-8?B?eE5YaGFJTFdzTjRteG5uWnFGVFlBYkFPNTlyUm9uQ0s2ek9pcklvV0traWFk?=
 =?utf-8?B?YlVIYy8xTHNVaHFpZW0yZ0NlTmpMczhhMmluejY1TUJJT2Iyd092TU92M3VB?=
 =?utf-8?B?MDBqZHRmVzZWWGJSL2dQQVZpbWV5dWVtUktIeE9OZlF5YWJnVGpMNXVjUm5z?=
 =?utf-8?B?TFBvenpDQTVCbEZsYWlZbG5DMks3aThvbE96NnZmbldTajFXUFY1dTJCRisy?=
 =?utf-8?B?MlljU2Njc2pVdUtVYk5pTE1RZHYzQ00rbnNZcDAyV3NrNnNmUXpIVTF4eXli?=
 =?utf-8?B?SkxPVHNWODBPdGRqY2dyYngxclRESGFKZVQzZ0ViQzl6TFVqQjNydjNqQnNE?=
 =?utf-8?B?MGhTaUVEN1V2bmFGbVkvVGJIS05pcUxEbWFKanlBUWpKRnhjVm11dGN2MURj?=
 =?utf-8?B?NzZpSGhUVExMU2RKREY5VmxCaS9RczcvVXZtK1NRaXpRek9ybGtVS0JKQ3Ja?=
 =?utf-8?B?MWZGMEpoT2xPenRrY0dwWmE1UzN1Z3hGTFNRUlE3R200c0VRMVdPZEt5a0pt?=
 =?utf-8?B?aWN2RlZXWTFGMzlaZzZycmY2ZENoOFdRNW94TTlHQytiek9Qa1BqSE1XKzRO?=
 =?utf-8?B?bi9DcUpRc0w0dWdiZlgyQ2VNUUJRazg5ZTdvOStLaTNrcGY2S0tSUTd5UXdY?=
 =?utf-8?B?RExxZk9MVU1EOTBKL3B1S1Q0VHFvS1hYSG9tdFkvdnpWRXVKbU1ObEZKREZh?=
 =?utf-8?B?OEdZMWxUNFlUc3dlRHVsNkZNU1NqbjE5RkptdXc0dkpReWlJc3luelNGOVV1?=
 =?utf-8?B?NjBDM01lcXB1OU14d2lUc0pYVm1ZaDFGQTBPK2ZTWGk2N05yajJSVTgzZVFz?=
 =?utf-8?Q?2snQqDuPWg5I68FgnID7nwFab?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b416c6-9e6f-4a77-9e20-08dc919efed6
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 03:05:24.7484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRWrJ6r9o7n/GPINVE0fsuwcmqmur1/WUtxENPFOiDSRXImceyZdnklczuupHvbZ3eqDNPgzIQqlr/W5v1W//Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7168
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

Looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-06-20 22:49, Jesse Zhang wrote:
> To support gfx12 testing, add its family ID.
> V2: using a unique subject (Kamil)
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_family.h       | 1 +
>  lib/amdgpu/amd_ip_blocks.c    | 3 +++
>  lib/amdgpu/amdgpu_asic_addr.h | 3 +++
>  3 files changed, 7 insertions(+)
>
> diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
> index bce2c6c2e..4a5731dbf 100644
> --- a/lib/amdgpu/amd_family.h
> +++ b/lib/amdgpu/amd_family.h
> @@ -106,6 +106,7 @@ enum radeon_family {
>  	CHIP_GFX1103_R2,
>  	CHIP_GFX1150,
>  	CHIP_GFX1151,
> +	CHIP_GFX1200,
>  	CHIP_LAST,
>  };
>  
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 2ee94105c..ff7e55525 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -695,6 +695,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>  		identify_chip(GFX1150);
>  		identify_chip(GFX1151);
>  		break;
> +	case FAMILY_GFX1200:
> +		identify_chip(GFX1200);
> +		break;
>  	}
>  	if (!info->name) {
>  		igt_info("amdgpu: unknown (family_id, chip_external_rev): (%u, %u)\n",
> diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
> index cbe02871e..0ecb0b803 100644
> --- a/lib/amdgpu/amdgpu_asic_addr.h
> +++ b/lib/amdgpu/amdgpu_asic_addr.h
> @@ -31,6 +31,7 @@
>  #define FAMILY_GFX1036 0x95
>  #define FAMILY_GFX1150 0x96
>  #define FAMILY_GFX1037 0x97
> +#define FAMILY_GFX1200 0x98
>  
>  // AMDGPU_FAMILY_IS(familyId, familyName)
>  #define FAMILY_IS(f, fn)     (f == FAMILY_##fn)
> @@ -108,6 +109,7 @@
>  #define AMDGPU_GFX1103_R2_RANGE  0x80, 0xFF //# 128 <= x < max
>  #define AMDGPU_GFX1150_RANGE     0x01, 0xc0 //# 01 <= x < c0
>  #define AMDGPU_GFX1151_RANGE     0xc1, 0xFF //# c1 <= x < 255
> +#define AMDGPU_GFX1200_RANGE     0x01, 0xFF //# 01 <= x < 255
>  
>  #define AMDGPU_EXPAND_FIX(x) x
>  #define AMDGPU_RANGE_HELPER(val, min, max) ((val >= min) && (val < max))
> @@ -173,5 +175,6 @@
>  #define ASICREV_IS_GFX1103_R2(r)       ASICREV_IS(r, GFX1103_R2)
>  #define ASICREV_IS_GFX1150(r)          ASICREV_IS(r, GFX1150)
>  #define ASICREV_IS_GFX1151(r)          ASICREV_IS(r, GFX1151)
> +#define ASICREV_IS_GFX1200(r)          ASICREV_IS(r, GFX1200)
>  
>  #endif // _AMDGPU_ASIC_ADDR_H
