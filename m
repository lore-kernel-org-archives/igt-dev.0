Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92186CD5BAF
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 16:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F6F10E1E1;
	Thu, 21 May 2026 16:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cIFrIe8D";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BB410E1E1
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 16:52:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeOLpJJjl2k2B9ae5bY4VENuaUy4KP5ZvM/Cg1n+sRXawBu7YuPyMg5kRya5iMzBaBAbbZ+HJV5oXYMalH3nE8bd0q3pVcDFaxXEeTyxz/i21nvObHK3r8LiZdTZnkQDkP5yeOF8O5151AlVn9AFTH+jTy3Xjl1texhYryFel/+AzsQabXMYaglyrFQRB9gPe/j9ABwKgGZghesb+MR66R6hqj2ReNbUh/thpFB5mjnBBaHuoNddGrn6Rb07CurhvH9Gm2RCAdsSZANu801uINUGHVLat0la2cLVAjnx23CtliE8d9WGrhtVsiZMie5SGfZwHDZrbGohZYm/vxcckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0tbT4D6y0DvpVbeFI6FRYX90Vc31gAZjQiACF4Xjqk=;
 b=aqgXAemRozjMEm8JnARQvxuguF48YsVyYdsSuqD0Nc3mZ+uNbwx2KVbipvbwEk+drvN1RBCMKL//fAXbi0eFdtJ/PDNRKcrKVgTEPALwn5d1ncLbaYZIhgUkEdTzkLCQWQ4sHh+z8i0FfDg7b0+aWjjPXR3BxFM2Ax3BEOM/mfPXJcfrRcYZnTA+/C5UBTBSQaIZPFmtInpqgsqWJXIqCuODFpS59MT+aGqJJJvnB74JsjYBBavbwlieniLAXjnTTY5L+SyJtgU4jHzRldF9VQOITtYSW9Sg9DLf5ijDVsjExpQmvGFENIOddwInnEPW898SK7wZD0YmJHLoQEaGhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0tbT4D6y0DvpVbeFI6FRYX90Vc31gAZjQiACF4Xjqk=;
 b=cIFrIe8DZ8awefyWuEEpI04INcm7/RErD9durzfybjO3h7fU8uUnByzY4J8+sxnNVWsHelAtDvJ9rgNtpWkVTHVZCM0IgIX9B3XM1LUBlKYgtLyqGqoc1tnn9ItcOXLaOtINsdlhKnt2TuYRVTYSdJ7QvFNUXwVlCGerK32tiZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY5PR12MB6178.namprd12.prod.outlook.com (2603:10b6:930:25::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 16:52:12 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 16:52:12 +0000
Content-Type: multipart/alternative;
 boundary="------------59eYnutsybZfHCrL2NPY0mGS"
Message-ID: <2d9b2896-ca25-4a35-b0a4-af9308383147@amd.com>
Date: Thu, 21 May 2026 10:52:10 -0600
User-Agent: Mozilla Thunderbird
From: Alex Hung <alex.hung@amd.com>
Subject: Re: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata probe in test_hdr
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Broadworth, Mark" <Mark.Broadworth@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>
References: <20260519150022.3964921-1-alex.hung@amd.com>
 <a01a54c7-674c-4c5a-84d9-966d51e5cc3f@intel.com>
Content-Language: en-US
In-Reply-To: <a01a54c7-674c-4c5a-84d9-966d51e5cc3f@intel.com>
X-ClientProxiedBy: MW4PR04CA0331.namprd04.prod.outlook.com
 (2603:10b6:303:8a::6) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY5PR12MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: 312cab7b-93cf-4a6b-2d6b-08deb7594dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|3023799007|4143699003|11063799006|56012099003|18002099003|8096899003|22082099003;
X-Microsoft-Antispam-Message-Info: db4DI0rLqGZ/rg70l10QcQd8sZtsmMkFdSG7EfChguMHUQ6OvQ7OL5ln0MnV33AD7tqG/xwrGFdV/SBrS4CoJrHwuN/eOjhcLGZFFmnB45/9rHyeJPVIY411DrYj7vJKrJlf8ZC5OCtHQyiPQubl6tGLjZMGwXzixQfvUNpFjdAEWfZ6jzQvdwx3BlOcKOJs2M3Q1BSNGiIWKdLlYSQbpJkTlyfqm18pJDzBHIDt2vn9ivANCQrTLpcCQbZ0Q3wlEKBNN5O91vNPoRartbzstsGhBrnDCiHqkf+aLnZRVTXud7RII7iG94/9tdN4DAv4qorGn+FIpe2QgRn82T2YGGxm2At18fSlFga1LC9OTuUpfTPcFFNoFTs4DMkeQjOiwKaM3B20FUiIlYbwpRS1FEO3Yyt52xrnvhftSwuBvFn3tn1YNvb3S6LVf5bnFHMUzZm8/wApISaURzqIHjKi4kjKdumpxF27FzLnVvaXRTvxkjHl6amABIwnas86pUy1W0oRe6huoadeFMCwlMfTAeXMqXqQ1ZLReJmZn0+HjRRd7HsWPf7QjyXHISe5eI3lPjOT3MziBz4Bo6xsnGVpICE6C+nktbxnAzcOtZUy9S3BlnG+diUtdkJt0AbZhechSrFdbX2eHjpTRWmb0+xElA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(3023799007)(4143699003)(11063799006)(56012099003)(18002099003)(8096899003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3g4MGFrYVFKd1BRU25UMHFYWFo0K2dKWnYzdUc1NG1PaGJhTzNaeUNtSHJo?=
 =?utf-8?B?WTJHVFZGbURrU3VPM2d6Rk1vV1JiRThML0FUQTdFR29BZ2twV21aNzFqckpy?=
 =?utf-8?B?VkZ3MW1UY2VvMFl2S3ZTOGwxd3Y5dVR5RDVTZi96akVtNW1oQWVvRDg0bEhi?=
 =?utf-8?B?QzQ4U2JYQ1ZMM3cvZVpnakwxQVd1bEFaNUUzMEtaaTA0N0dmTzBtbWRTSkNU?=
 =?utf-8?B?VUoxdytacUNjVUtHbUpXNXRpbkxOa3d5R1NkNlpId0xwdG5EQmtLaVRZRkJD?=
 =?utf-8?B?VmNQaEFnWkYyRnRsTTZhUVBJdURkZXE2dzJSUThrRVY3M0xmK3JER2xqMG9w?=
 =?utf-8?B?ZUhwSjk3bzY2UTkvQ0pQYWJUTkIzeHFkSitlaHZIcUlmSkZ4aVphcS9NU0o1?=
 =?utf-8?B?Z1ZibENlUy9rekZ5SXQvZ3FDREJVaHVtWW9EWG4vS016eDAranV5S2QzNm9W?=
 =?utf-8?B?NERKZEtTWG5CNnFqTlhKQWRSQVZQSGxPcXpQa2diSHdiMTR3amJkaGZpck5M?=
 =?utf-8?B?NFkxRy8wb0JBQk1zazNyWjAwTUlGeTVDYUFqYnNRNVRFendVczIzY2t2a3hx?=
 =?utf-8?B?V0NuamVVbEhMVysxQjdUV0xuelZsdTZsSUZKMmk0Zkk5QWkrSXlNdTM4WXBY?=
 =?utf-8?B?THY1ejlnVW9nU0ZraE5STUQ2WHBiTkIxQWJHUjNlYktDaFBmWEpmdGUwb2sx?=
 =?utf-8?B?ZFNRWU01RThvakl2S3NLMkZsWnc2eTV5RnZlSVBCNGdoL2dKN0tnV1NnUlp2?=
 =?utf-8?B?bnVpWDE3dWd0OUxEWmJNWDQxOGtBeEtsY1RtKzRoUFh1MnNsQ25Yb3JOV0tN?=
 =?utf-8?B?RWJObTFSRGpGMmF3RGNuR2srR0VmczdEb01qTktsbWhSR2dmZGRpeU8va0pk?=
 =?utf-8?B?SmNmMVNkcU1mcUVQNG1BZVFMcWkxbDVvUndBZmtoUGlKWXJtV1ZaMmNLQ0pT?=
 =?utf-8?B?dEdmZkJ5QW1SUUZFZFp0ZHoxdzd5bkh2S2lJUExTZEhSMmgvWjhtWTdBdUVN?=
 =?utf-8?B?a3hMWk1FZnNiK2g0NUF3V3RycUpTd3dKMGEyMVhDYTBvUTdjaTZZOFNmYXJY?=
 =?utf-8?B?ZENrY1JOejQvWjZLZE5RMExzbFd2TDJ5RksxWVQ1MURxcGUrUXBlUDQ1T1A4?=
 =?utf-8?B?MktpWFZmN1RPSlAyclE2Mk0ydUlIRDBCNXpKTHJZaWZsTG9DYmlERG5icVhE?=
 =?utf-8?B?alVVSk4yRmYyM3VDR1V3aTVWeWU2cGg4ZFU3dUhiM0ozTWN3WHErQVY0TlM4?=
 =?utf-8?B?ZDZUa3NLS2oydVM4L0ZzRVBHdUwyWVorajdYTXV1YlNGYkF6bU83bUR6TnlS?=
 =?utf-8?B?ZEFkYmNWNkpmWFc0QU9qbnpZZjJtVjYwTGN5SWluSFFTQlFSckVRVU9ZREJy?=
 =?utf-8?B?S2tpRWN4QXljOEJBYVVLaTNidlkzQ2Ivc0FneEhvOU1ISmRHTm14blI4eWNO?=
 =?utf-8?B?eVVBeWk0cEVGb3NmdDhONFZBSHQ3L1liMDd0Sld1Q21ocmI4THZXMzl5a0Jx?=
 =?utf-8?B?YmZHS1pZaG85WnlEcFNYdzRYUnNhVmtYRnQwcVhRTktJMk1RNHJTVkRWUmhG?=
 =?utf-8?B?QVJrTnlHK2VaZUVNMEI4Sy85RVcrdXJMQXJ3RS9yMmtGdTRiaG1jYWZwREsr?=
 =?utf-8?B?eTBXT0t1WWNseGxsSlo0bXd5OGVlRUZrS0UzMTMrU0lLNWpab3B5aWh0S1FP?=
 =?utf-8?B?MlRTdXRNcXRSa2pZUmNqSW1Na3QwVVpvUUhxR1hxS3ZFcFczOGo2YmFCSGhv?=
 =?utf-8?B?ci9YaW82R1NFT3RGRnZjQ2J5QTZvR0lFdjQ5YmZSWVBoRlMvbXNTYXl5eEly?=
 =?utf-8?B?U2xUMEZ6U0pLYXVtR0dCMXJwM0V0aDUzQ3VrelFQNGU2VlM1aDlGa3NBUVJj?=
 =?utf-8?B?N0gvd0lnRjV1aWdlcm9ZQm9PaDZ4dUhGU3Y1cCtxcmp1SVVpM0Yvb2RCUUp2?=
 =?utf-8?B?c2dhYzN1Tk1NSEdNbTRrQXJFNDRKbExJVkpYMkNiSG1qVGo4eUVkZFB2b3Rw?=
 =?utf-8?B?aXV3TjBGdGNCcUIxYmFPTmh0bUkzOE1SaXJzcHlFbFk0STBoWTJhUGQxQVVI?=
 =?utf-8?B?aGh4MHZ5R2hDR0g3UHhoRmZ1dUtvcTFlVEdJdnpiNHdhcnVCd25raFlDa0w1?=
 =?utf-8?B?WEM3eU5lenF0dTAwOGdlRWhEMGxsL0VKQTFvaHpSTEdaancrMmc3WFlZeXJW?=
 =?utf-8?B?ZDFwR2NnUEJTZEtRS3hKRXBUU096cnlucVRQWkpxK3R4VDcyenVzTzZGb0pC?=
 =?utf-8?B?eUdaWkFBN1c0bHB0eElENW5XYlgzMjNlR0hJVUJFNmJ6TFVrejhmRUxLajNq?=
 =?utf-8?B?SC9lNDdYa3Bnanh1MEpwUzBLdXJrRkF0REVsWVRaRTQ2ajdkZk9Idz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 312cab7b-93cf-4a6b-2d6b-08deb7594dc2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 16:52:11.9965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRpcvQ0TFUWov78VUhdeCuQ0ibLjZOMZiTa2tGOqNnsCROhEvgY8p+2boEJK99+U6ERZOk42SvxcARz4w3YeVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6178
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

--------------59eYnutsybZfHCrL2NPY0mGS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


Most of regressions aren't related kms_hdr, but one of possible 
regression is with kms_hdr on 
https://patchwork.freedesktop.org/series/166879/


   igt@kms_hdr@brightness-with-hdr@pipe-a-dp-3-xrgb2101010:

   shard-dg2: NOTRUN -> SKIP +1 other test skip


Is this NOTRUN -> SKIP a concern? I do not have DG2 to verify it.


------------------------------------------------------------------------
*From:* Sharma, Swati2 <swati2.sharma@intel.com>
*Sent:* 20 May 2026 15:07
*To:* Hung, Alex <Alex.Hung@amd.com>; igt-dev@lists.freedesktop.org 
<igt-dev@lists.freedesktop.org>
*Cc:* Broadworth, Mark <Mark.Broadworth@amd.com>; Prosyak, Vitaly 
<Vitaly.Prosyak@amd.com>; kamil.konieczny@linux.intel.com 
<kamil.konieczny@linux.intel.com>; jani.nikula@intel.com 
<jani.nikula@intel.com>
*Subject:* Re: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata probe in 
test_hdr
Hi Alex

On 19-05-2026 08:30 pm, Alex Hung wrote:
 > Fix the HDR metadata probe that failed with EINVAL because it
 > attempted to commit metadata without a scanout buffer present.
 > Create a minimal framebuffer and use DRM_MODE_ATOMIC_TEST_ONLY to
 > validate the commit without modifying hardware state. The
 > framebuffer is freed immediately after and the display state is
 > reset, so the actual subtest starts from the same clean slate as
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
 > before.
 >
 > Assisted-by: Copilot:Claude-Opus-4.6
 > Signed-off-by: Alex Hung <alex.hung@amd.com>
 > ---
 >   tests/kms_hdr.c | 31 ++++++++++++++++++++++---------
 >   1 file changed, 22 insertions(+), 9 deletions(-)
 >
 > diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
 > index d50f87787..d21f1b3f8 100644
 > --- a/tests/kms_hdr.c
 > +++ b/tests/kms_hdr.c
 > @@ -571,16 +571,33 @@ static void test_hdr(data_t *data, uint32_t flags)
>                                                             "non-internal panel.\n",
>                                                             igt_output_name(output));
 >
 > -                                     /* Signal HDR requirement via 
metadata */
 > +                                     /* Signal HDR requirement via 
metadata.
 > +                                      * A framebuffer must be 
present for the driver to accept
 > +                                      * a metadata commit. Use 
TEST_ONLY so hardware state is
 > +                                      * unchanged.
 > +                                      */
 > + igt_create_fb(data->fd,
 > + data->w, data->h,
 > + hdr_test_formats[i],
 > + DRM_FORMAT_MOD_LINEAR,
 > + &data->afb);
 > + igt_plane_set_fb(data->primary, &data->afb);
 > + igt_plane_set_size(data->primary, data->w, data->h);
 > + igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 > igt_hdr_fill_st2084(&hdr);
 > igt_hdr_set_metadata(data->output, &hdr);
 > - igt_require_f(!igt_display_try_commit2(display,
 > - display->is_atomic ?
 > - COMMIT_ATOMIC :
 > - COMMIT_LEGACY),
 > + igt_require_f(!igt_display_try_commit_atomic(display,
 > + DRM_MODE_ATOMIC_TEST_ONLY |
 > + DRM_MODE_ATOMIC_ALLOW_MODESET,
 > + NULL),
 > "%s: Couldn't set HDR metadata\n",
 > igt_output_name(output));
 >
 > +                                     /* Reset IGT display state; 
hardware was not changed. */
 > + igt_hdr_set_metadata(data->output, NULL);
 > + igt_plane_set_fb(data->primary, NULL);
 > + igt_remove_fb(data->fd, &data->afb);
 > +
 > igt_require_f(!is_intel_device(data->fd) ||
 > igt_max_bpc_constraint(display, crtc, output, 10),
 > "%s: No suitable mode found to use 10 bpc.\n",
 > @@ -591,10 +608,6 @@ static void test_hdr(data_t *data, uint32_t flags)
 >                                        else
 >                                                flags &= ~TEST_NEEDS_DSC;
 >
 > - igt_hdr_set_metadata(data->output, NULL);
 > - igt_display_commit2(display, display->is_atomic ?
 > - COMMIT_ATOMIC : COMMIT_LEGACY);
 > -
 >                                        if (flags & (TEST_NONE | 
TEST_DPMS | TEST_SUSPEND |
 > TEST_INVALID_HDR | TEST_BRIGHTNESS))
 > test_static_toggle(data,
 > --
 > 2.43.0
 >
--------------59eYnutsybZfHCrL2NPY0mGS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
  </head>
  <body dir="ltr">
    Hi,<br>
    <p><br>
    </p>
    <p>Most of regressions aren't related kms_hdr, but one of possible
      regression is with kms_hdr on
      <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/166879/">https://patchwork.freedesktop.org/series/166879/</a></p>
    <p><br>
    </p>
    &nbsp; igt@kms_hdr@brightness-with-hdr@pipe-a-dp-3-xrgb2101010:<br>
    <p>&nbsp; shard-dg2: NOTRUN -&gt; SKIP +1 other test skip</p>
    <p><br>
    </p>
    <p>Is this NOTRUN -&gt; SKIP a concern? I do not have DG2 to verify
      it.</p>
    <p><br>
    </p>
    <hr style="display:inline-block;width:98%" tabindex="-1">
    <div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" style="font-size:11pt" color="#000000"><b>From:</b> Sharma,
        Swati2 <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a><br>
        <b>Sent:</b> 20 May 2026 15:07<br>
        <b>To:</b> Hung, Alex <a class="moz-txt-link-rfc2396E" href="mailto:Alex.Hung@amd.com">&lt;Alex.Hung@amd.com&gt;</a>;
        <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:igt-dev@lists.freedesktop.org">&lt;igt-dev@lists.freedesktop.org&gt;</a><br>
        <b>Cc:</b> Broadworth, Mark <a class="moz-txt-link-rfc2396E" href="mailto:Mark.Broadworth@amd.com">&lt;Mark.Broadworth@amd.com&gt;</a>;
        Prosyak, Vitaly <a class="moz-txt-link-rfc2396E" href="mailto:Vitaly.Prosyak@amd.com">&lt;Vitaly.Prosyak@amd.com&gt;</a>;
        <a class="moz-txt-link-abbreviated" href="mailto:kamil.konieczny@linux.intel.com">kamil.konieczny@linux.intel.com</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:jani.nikula@intel.com">jani.nikula@intel.com</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@intel.com">&lt;jani.nikula@intel.com&gt;</a><br>
        <b>Subject:</b> Re: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR
        metadata probe in test_hdr</font>
      <div>&nbsp;</div>
    </div>
    <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
          <div class="PlainText">Hi Alex<br>
            <br>
            On 19-05-2026 08:30 pm, Alex Hung wrote:<br>
            &gt; Fix the HDR metadata probe that failed with EINVAL
            because it<br>
            &gt; attempted to commit metadata without a scanout buffer
            present.<br>
            &gt; Create a minimal framebuffer and use
            DRM_MODE_ATOMIC_TEST_ONLY to<br>
            &gt; validate the commit without modifying hardware state.
            The<br>
            &gt; framebuffer is freed immediately after and the display
            state is<br>
            &gt; reset, so the actual subtest starts from the same clean
            slate as<br>
            Patch LGTM<br>
            <br>
            Reviewed-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a><br>
            &gt; before.<br>
            &gt;<br>
            &gt; Assisted-by: <a class="moz-txt-link-freetext" href="Copilot:Claude-Opus-4.6">Copilot:Claude-Opus-4.6</a><br>
            &gt; Signed-off-by: Alex Hung <a class="moz-txt-link-rfc2396E" href="mailto:alex.hung@amd.com">&lt;alex.hung@amd.com&gt;</a><br>
            &gt; ---<br>
            &gt;&nbsp;&nbsp; tests/kms_hdr.c | 31 ++++++++++++++++++++++---------<br>
            &gt;&nbsp;&nbsp; 1 file changed, 22 insertions(+), 9 deletions(-)<br>
            &gt;<br>
            &gt; diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c<br>
            &gt; index d50f87787..d21f1b3f8 100644<br>
            &gt; --- a/tests/kms_hdr.c<br>
            &gt; +++ b/tests/kms_hdr.c<br>
            &gt; @@ -571,16 +571,33 @@ static void test_hdr(data_t
            *data, uint32_t flags)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &quot;non-internal panel.\n&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_output_name(output));<br>
            &gt;<br>
            &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Signal HDR
            requirement via metadata */<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Signal HDR
            requirement via metadata.<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * A framebuffer
            must be present for the driver to accept<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * a metadata
            commit. Use TEST_ONLY so hardware state is<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * unchanged.<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_create_fb(data-&gt;fd,<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            data-&gt;w, data-&gt;h,<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            hdr_test_formats[i],<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            DRM_FORMAT_MOD_LINEAR,<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &amp;data-&gt;afb);<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_plane_set_fb(data-&gt;primary, &amp;data-&gt;afb);<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_plane_set_size(data-&gt;primary, data-&gt;w,
            data-&gt;h);<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_output_set_prop_value(data-&gt;output,
            IGT_CONNECTOR_MAX_BPC, 10);<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_hdr_fill_st2084(&amp;hdr);<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_hdr_set_metadata(data-&gt;output, &amp;hdr);<br>
            &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_require_f(!igt_display_try_commit2(display,<br>
            &gt;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            display-&gt;is_atomic ?<br>
            &gt;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            COMMIT_ATOMIC :<br>
            &gt;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            COMMIT_LEGACY),<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_require_f(!igt_display_try_commit_atomic(display,<br>
            &gt;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            DRM_MODE_ATOMIC_TEST_ONLY |<br>
            &gt;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            DRM_MODE_ATOMIC_ALLOW_MODESET,<br>
            &gt;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            NULL),<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &quot;%s: Couldn't set HDR metadata\n&quot;,<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_output_name(output));<br>
            &gt;<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Reset IGT
            display state; hardware was not changed. */<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_hdr_set_metadata(data-&gt;output, NULL);<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_plane_set_fb(data-&gt;primary, NULL);<br>
            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_remove_fb(data-&gt;fd, &amp;data-&gt;afb);<br>
            &gt; +<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_require_f(!is_intel_device(data-&gt;fd) ||<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_max_bpc_constraint(display, crtc, output, 10),<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &quot;%s: No suitable mode found to use 10 bpc.\n&quot;,<br>
            &gt; @@ -591,10 +608,6 @@ static void test_hdr(data_t *data,
            uint32_t flags)<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags
            &amp;= ~TEST_NEEDS_DSC;<br>
            &gt;<br>
            &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_hdr_set_metadata(data-&gt;output, NULL);<br>
            &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_display_commit2(display, display-&gt;is_atomic ?<br>
            &gt;
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            COMMIT_ATOMIC : COMMIT_LEGACY);<br>
            &gt; -<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp;
            (TEST_NONE | TEST_DPMS | TEST_SUSPEND |<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            TEST_INVALID_HDR | TEST_BRIGHTNESS))<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            test_static_toggle(data,<br>
            &gt; --<br>
            &gt; 2.43.0<br>
            &gt;<br>
          </div>
        </span></font></div>
  </body>
</html>

--------------59eYnutsybZfHCrL2NPY0mGS--
