Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7A1CD342F
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 22:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E00010F5F5;
	Fri,  8 May 2026 22:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qObtncy0";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012059.outbound.protection.outlook.com [52.101.53.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6839310F5F5
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 22:01:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8NOm6LWS46FODM2HOMD05fHenvaOUXCGMMtizUqn1V5SzXKKLDtkGm+lFMGOiQQ8qK4C7Fpe/CLVv9DIjZJcbJIGZ5/NobNTrAeDqY8/uLaWTCZb9foZ2WGVv1gAYgXEKvYcBH83E5ua5ZTSCwBu4a2uA12aIo6eZiiiEJazuBcLV9eyZsxyBnGusSSJFLGnNGwuKiXhTBf2gcd2LuBbW0LVps+s+AWRbQOpUiPC+Hs+EUOdxFBAChgaT9jrS/oz74ax9Ig3wWDRV5aq5yr3XwtT24hMuN6K0VGhkreGLhm6K0eJ2v2X1DnDgvn/st9gNcsT/cm+PnaFpa118UYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5e5i+RBEOUV8McPGywa7ccyrsAjfZoW/9yB4MdJ4Cf4=;
 b=qbY+b7Ll66Ql8Wr1S3efO/yHOaOjsuVYvsP+AUXayDeBy5ntePK5CbF0kU/oAbLPOxynrhwpVznfStiPlKfjMNW+OtZ2S86uGjAvO8rgwsNooio5tgZwtMiEpRDXowEBMUkRK+Zpm0ylRFLL0gJKYxndxMdl0PTj0WdiZi0yg5dNap32NunnMSlGI6Wl+CpDqWF2jq+fo0OrwY06c2c2YSaSfp58YmOcKWgWDgHdnUiJrLLGToxOTpMB68cwfYQGlTsyf58Dkf7fdxhM1y2JNmUb2dOCliw9eaYz81w6qjRYdE0RcR77wcS8hbZoZ8mywUPlCgkQXtBf9KkipqDm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e5i+RBEOUV8McPGywa7ccyrsAjfZoW/9yB4MdJ4Cf4=;
 b=qObtncy0luUwaVrLJ8wGfd6V2Vaf4167XbYCPt8V+G1vAMdmgyq4jLZ8CcvxHJ1oY6PTJHp25JCtGZV36Lvr/n4sRXgAv4k/ZdrYNTGAIxPC1+GAV7NwsABL5zSninLmINWnZbo+Z7SV0oSpWWll8aFkFVAPz6Hb6+yn//e7wio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MW4PR12MB6950.namprd12.prod.outlook.com (2603:10b6:303:207::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 22:01:00 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%7]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 22:01:00 +0000
Message-ID: <ced6dde2-16de-46e2-85bc-c63c0d55ecfd@amd.com>
Date: Fri, 8 May 2026 16:00:58 -0600
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/kms?=
 =?UTF-8?Q?=5Fhdr=3A_Add_visual_HDR_verification_subtests?=
To: igt-dev@lists.freedesktop.org
References: <20260507211330.2640022-1-alex.hung@amd.com>
 <177825768440.52561.2123108248780564976@5ab824fced77>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <177825768440.52561.2123108248780564976@5ab824fced77>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:303:b4::22) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MW4PR12MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffa708e-1b08-4834-cd2e-08dead4d4a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|3023799003|22082099003|56012099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: fuFmXQVQ0E20XpzSO9T7oY4Ckqd9HQaFtzC7GyUlpBY8D68sxQ9tv01PhXNi7O51Fwt4KQi4PXfHVe/9h2MtvyPlxLTABsaM+U37637neMWVrU+ftJHVPYD2tHUXJDi/LFunnzDGLdbU3Dj/ZLhMvXIP/kJx8kmU7ZNEJIMBbEM3PhFMtatdEe4NSLKC9s/LqBGd6NxzIzRgEvlg/Vh5qEaVL9M60I3jpCn8yAiayTpIpDvZesTyCB858L4q4sdFlqj+Jg300eBevrAloIE7nrNLUBC6bPwQ/Jp+wvD9ZnpaN5FSbXSUJUbOI9+/bYLH+kQBEkkWDBYn4FACeBHGrkXxIiIdnNVTPdouvHtLKb6faLjb7xy6ouYenccFiPYdibdLVpOa9g3siAXzPR4bCgzAs7YuMHBLlhMXgHrq8sOEkaeXoTCl5MPM9nW2Il0cHbcl9WdyD45WiXrfBJzK3tCH1+ho4PdlkjegMN0en0hJb/rfCh0iHSpqIJxxRsf8pO0Rptu+9gTWmdmAgVs/UMtKLiwyxK73H0/eRl4f3eZdcZBfexzlLKpl9dcDRoTOezx0MBVfCD3bbw8BFTU072NJYUhWPvtBSLoMs62rP3T0iTMqNMHCvjLpmF7lOBqKY0DXlw9bWwvwKwLXkTnrDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(3023799003)(22082099003)(56012099003)(13003099007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXpVYnBrMGlvOEdHeGRBVWVPMzhLSlgwRVNud0dLNXBHMGhaMlozbTlOcDJa?=
 =?utf-8?B?TW1VeXlTaThUYU0rMUx4cUJ1bHRoY2o5UmNRaVErb1ZaYVhmNFlxYWdEbnpT?=
 =?utf-8?B?SGZKQ1p1aTNHeHFJcVJKdmJjWWlzbk5PK1cxNHJvUTdsTHdOZ2xPWGpPNnFy?=
 =?utf-8?B?aTJsWmV5N1FrYm0xaGhEWDRnWUJteUF5OXpTelowK2JCbXk1bzY3VEdpUWw0?=
 =?utf-8?B?ZXVkU0RkcHgvTm9PYkRDbGJ0cURjYlFzYUNQVFUraEkvQUFwYmxRYVcyV2ta?=
 =?utf-8?B?VVZXRzRYaDdvSlJmelFudEttZmw2T2RDa0N1Sm85SVQ5YkdtYnRTKzY5STVJ?=
 =?utf-8?B?N2RXTGJWYTB0THFwTUhPK2piRHNRWEpHa0JUYjdIUHZBcEdEekt6RzdjN0NW?=
 =?utf-8?B?QWNpNEVwWWRwZHpyMkh6RXRjMnhxa0xmNndaZjA4QmVsbXBXdjJhRDltandN?=
 =?utf-8?B?ZTJkZTE5WXVvQTVicjAxbXR6TWV0bGYzSExvV0NYbWVpTFhmWXFmcUdqcW5h?=
 =?utf-8?B?SU1LdkVzYzRseDFuRjdQN3U3MktudEVDQzVyTlNLMFBhSnVhQmhIeCtPRHdD?=
 =?utf-8?B?cDJ1TXhLaTA2SE5CMk9wekNIV2IzZzNKaEJDR2xvYlNUdjd4aHkzK3RIK01H?=
 =?utf-8?B?OWd1TG9FN1p2Z2ZjOEpzallGbGJraStYb1owYW52RDc1NjVIdHJKZjNnZnJj?=
 =?utf-8?B?VmxZdTI0eHl1Ymp6dTlLa2JTL3NhVE5wQUFtYkZVem1xV1JqUnVKMTk1Z2hG?=
 =?utf-8?B?eFRNdEh6dkpCeGFlYVBUbGpXNUFjc21JMS9KdHF4NmhnSC81dklzdXo4N1ha?=
 =?utf-8?B?UzZ5dHVFbFlDVjM4N3RaNXpUUERRc0RCS08rUUI1SXlPRkxvQUM5UytvaHNZ?=
 =?utf-8?B?aG9hTjVXa2RiaS9iRHRxejQzWkwwdExNK2tOMktEMCtkUlRMMU5ZVURpSlFo?=
 =?utf-8?B?b2ZGUTd4YzYwUDA5aEV0VDByQjNOMFZqOWtnQmVhOXg1bXhmcnlGM3E1RjJS?=
 =?utf-8?B?S3h5K0hqWnZQWHNuMXVqMVZtajdvelJGWGt4cUdscUg3Y05mS1pxUy9jOHEw?=
 =?utf-8?B?Y0lVUFFGdjN5bEt0cXpnTk8vRmdaMnp3cnZGQngxV3JyeXVDUk9veTRqRm5Q?=
 =?utf-8?B?RENXOTF0dVpsRWpPZFcvd3BBZnNBV3MzVnN6M0kzVHI2aFFIOEJRWDJNODhF?=
 =?utf-8?B?OTRBWnRQN1A1ekNBdmxQK21JRXMzb214YjJJUklTNURxaUVTMERxZkNFWUcw?=
 =?utf-8?B?czd4RnF4T1NuaTdiUVRVRzM4d215MHJtUnpxckhETS83TzhmT2krUnoyQ0Zt?=
 =?utf-8?B?cnE3aUFYOGRjRjFKeEdFdE5HSGY3NVdUUnZBT0c4djU5RmNkQVpBNk5JYm5O?=
 =?utf-8?B?TmJxa0xJSzNiU2g5QW5BNUhwMnNodGVJSTgrWXlBQnFGc2ZMNUNpRGVMcWNi?=
 =?utf-8?B?T01JMVR0NXZEeGNNNzJnTU1lQUx4czk5VDZRejZ2akwrMytNZXFFbmF6RFRF?=
 =?utf-8?B?dzBOdlVsTjk4MnVTNTcybW9TOXRyOFBtbEhxWGNPb2JDLy9xQWtZMTErc0xj?=
 =?utf-8?B?M3RoTUFpV1BSc3cwb0o2TStFUElTYzdYM3Ewc3ZtTFhRQ1cxODltVVNHSVNR?=
 =?utf-8?B?dzVvVUNad21rOHVlY05SZ0NVV1VCb0xhMGpGcHRlN2o3WlJPeXB1RWF1VzFQ?=
 =?utf-8?B?NkZrZ0tjWUY5Tm1aQUlMelp2SE9DK0syZFhCUENBUkQvejIwaWN6cGFvUEVl?=
 =?utf-8?B?emZjVStPNTRRUTMvcy94M3dVcG5LOWpDZUxiMER5bXBYQ3pxTGJOUXNVcTJD?=
 =?utf-8?B?T012bG9pVDFqN2EzZGtLcXV6MXBFeGVwZ0JvU1N0QTdsWGFMdmhYS0RFaEtE?=
 =?utf-8?B?M0ovRVVRVHg3SWM2UjJuNmM3aXhGa1Rvcm5tRmZVWUE3WksvQW1yM2RiYStD?=
 =?utf-8?B?Zkg3aFFJcExkQURRWFVERlFYRmd4MGxoVjNXb3ZqQWRrbE5CTWRENDVtMSs0?=
 =?utf-8?B?Z1ZjcS9QUnJuMzNSeXRXUm8vS2xzWWlUYWJNa1hMRXV1c2VtY3hNTm9NYWtY?=
 =?utf-8?B?S1NJcmwwZWxSWmFsQWpjaGVQeGN3UURPMnh4T3E1cjhqWlE4ek9wUWV5ZkhM?=
 =?utf-8?B?ck9zQnI3Rzl3bkI3bWdUSHNvWnE3eHE3QWZLK3NZdzUrVlc4QTVnVVd3TkVC?=
 =?utf-8?B?S0hnT3NxOW1Rd2tYSVNXYlJnemhsYlZiNkJ6V1J5dVBUYzFvMHAzTmJhMEJD?=
 =?utf-8?B?cElMYW9WbDNEbTl5a0FmaXkwQjBkOEx3azllNS95US93U2t5VGVWRHR1OTFq?=
 =?utf-8?B?dUFtaXhRa1JkTzFGNmh4WlE5TFQxaGhmOVhiUWVkK1B1M1gvQ0RXUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffa708e-1b08-4834-cd2e-08dead4d4a01
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 22:01:00.2090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2ge07ypnyl9cQSWSsqN17jXIZ8YTjpsSiqVB4igaajJJODZ+1D69gpdPtGBAVPD4hYli4LvdypJCSpaeHh/xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6950
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



On 5/8/26 10:28, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_hdr: Add visual HDR verification subtests
> *URL:*	https://patchwork.freedesktop.org/series/166166/ <https:// 
> patchwork.freedesktop.org/series/166166/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/ 
> index.html <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_18447_full -> IGTPW_15131_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_15131_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15131_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/ 
> index.html
> 
> 
>     Participating hosts (10 -> 10)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_15131_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_flip@flip-vs-dpms-on-nop@d-hdmi-a1:
> 
>       o shard-tglu: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-tglu-4/igt@kms_flip@flip-vs-dpms-on-nop@d-
>         hdmi-a1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-tglu-7/igt@kms_flip@flip-vs-dpms-on-nop@d-
>         hdmi-a1.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-suspend:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk8/
>         igt@kms_frontbuffer_tracking@fbchdr-suspend.html>
>   *
> 
>     {igt@kms_hdr@static-swap-smpte2084} (NEW):
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@kms_hdr@static-swap-
>         smpte2084.html> +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-17/igt@kms_hdr@static-swap-
>         smpte2084.html> +1 other test skip
>   *
> 
>     {igt@kms_hdr@static-swap-traditional-sdr} (NEW):
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-4/igt@kms_hdr@static-swap-
>         traditional-sdr.html> +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-1/igt@kms_hdr@static-swap-
>         traditional-sdr.html> +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@kms_hdr@static-swap-traditional-
>         sdr.html>

Hi,

These are new subtests in kms_hdr and is it be safe to ignore the above 
regression?

> 
> 
>     New tests
> 
> New tests have been introduced between CI_DRM_18447_full and 
> IGTPW_15131_full:
> 
> 
>       New IGT tests (2)
> 
>   *
> 
>     igt@kms_hdr@static-swap-smpte2084:
> 
>       o Statuses : 1 pass(s) 6 skip(s)
>       o Exec time: [0.0, 0.32] s
>   *
> 
>     igt@kms_hdr@static-swap-traditional-sdr:
> 
>       o Statuses : 7 skip(s)
>       o Exec time: [0.0, 0.00] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_15131_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@api_intel_bb@blit-reloc-purge-cache:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-
>         cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/8411>)
>   *
> 
>     igt@api_intel_bb@crc32:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-8/igt@api_intel_bb@crc32.html>
>         (i915#6230 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/6230>)
>   *
> 
>     igt@device_reset@cold-reset-bound:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@device_reset@cold-reset-
>         bound.html> (i915#11078 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11078>)
>   *
> 
>     igt@dmabuf@all-tests:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-3/igt@dmabuf@all-tests.html>
>         (i915#15931 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15931>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-8/igt@dmabuf@all-tests.html>
>         (i915#15931 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15931>)
>   *
> 
>     igt@drm_buddy@drm_buddy:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@drm_buddy@drm_buddy.html>
>         (i915#15678 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15678>)
>   *
> 
>     igt@gem_bad_reloc@negative-reloc-lut:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-2/igt@gem_bad_reloc@negative-reloc-
>         lut.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3281>) +8 other tests skip
>   *
> 
>     igt@gem_ccs@block-multicopy-compressed:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@gem_ccs@block-multicopy-
>         compressed.html> (i915#9323 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_ccs@large-ctrl-surf-copy:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-
>         copy.html> (i915#13008 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/13008>)
>   *
> 
>     igt@gem_close_race@multigpu-basic-process:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-3/igt@gem_close_race@multigpu-basic-
>         process.html> (i915#7697 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-3/igt@gem_create@create-ext-cpu-
>         access-sanity-check.html> (i915#6335 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>   *
> 
>     igt@gem_ctx_freq@sysfs@gt0:
> 
>       o shard-dg2: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg2-6/igt@gem_ctx_freq@sysfs@gt0.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/
>         shard-dg2-1/igt@gem_ctx_freq@sysfs@gt0.html> (i915#9561
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561>)
>         +1 other test fail
>   *
> 
>     igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk4/
>         igt@gem_ctx_isolation@preservation-s3@rcs0.html> (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         +1 other test incomplete
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-mixed-process:
> 
>       o shard-snb: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-snb1/igt@gem_ctx_persistence@legacy-
>         engines-mixed-process.html> (i915#1099 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099>) +1 other
>         test skip
>   *
> 
>     igt@gem_exec_balancer@bonded-true-hang:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-8/igt@gem_exec_balancer@bonded-true-
>         hang.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4812>)
>   *
> 
>     igt@gem_exec_balancer@parallel-bb-first:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-3/igt@gem_exec_balancer@parallel-bb-
>         first.html> (i915#4525 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4525>)
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-5/igt@gem_exec_balancer@parallel-
>         keep-in-fence.html> (i915#4525 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/4525>)
>   *
> 
>     igt@gem_exec_big@single:
> 
>       o shard-mtlp: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-mtlp-2/igt@gem_exec_big@single.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         mtlp-8/igt@gem_exec_big@single.html> (i915#15871 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871>)
>   *
> 
>     igt@gem_exec_capture@capture-recoverable:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-4/igt@gem_exec_capture@capture-
>         recoverable.html> (i915#6344 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/6344>)
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@gem_exec_capture@capture-
>         recoverable.html> (i915#6344 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/6344>)
>   *
> 
>     igt@gem_exec_flush@basic-wb-ro-before-default:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-1/igt@gem_exec_flush@basic-wb-ro-
>         before-default.html> (i915#3539 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3539> / i915#4852 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>   *
> 
>     igt@gem_exec_reloc@basic-write-read-active:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-3/igt@gem_exec_reloc@basic-write-read-
>         active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3281>) +11 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-16/igt@gem_exec_reloc@basic-write-
>         read-active.html> (i915#3281 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3281>) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-2/igt@gem_exec_reloc@basic-write-
>         read-active.html> (i915#3281 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3281>) +2 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-write-wc-active:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@gem_exec_reloc@basic-write-wc-
>         active.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#3281 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +2 other
>         tests skip
>   *
> 
>     igt@gem_exec_suspend@basic-s3:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk2/igt@gem_exec_suspend@basic-
>         s3.html> (i915#13196 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/13196> / i915#13356 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>) +1 other
>         test incomplete
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-threaded-none:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-4/igt@gem_fence_thrash@bo-write-
>         verify-threaded-none.html> (i915#4860 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>   *
> 
>     igt@gem_lmem_evict@dontneed-evict-race:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-2/igt@gem_lmem_evict@dontneed-
>         evict-race.html> (i915#4613 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4613> / i915#7582 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-6/igt@gem_lmem_swapping@heavy-
>         verify-multi.html> (i915#4613 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/4613>) +2 other tests skip
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-3/igt@gem_lmem_swapping@heavy-
>         verify-multi.html> (i915#4613 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@gem_lmem_swapping@heavy-
>         verify-random-ccs.html> (i915#4613 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +1 other
>         test skip
>   *
> 
>     igt@gem_lmem_swapping@parallel-random:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-3/igt@gem_lmem_swapping@parallel-
>         random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4613>) +2 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@verify-ccs:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-glk6/igt@gem_lmem_swapping@verify-
>         ccs.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4613>) +7 other tests skip
>   *
> 
>     igt@gem_media_vme:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@gem_media_vme.html>
>         (i915#284 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/284>)
>   *
> 
>     igt@gem_mmap_gtt@basic-write-read:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-4/igt@gem_mmap_gtt@basic-write-
>         read.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4077>) +5 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@cpuset-medium-copy-xy:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-1/igt@gem_mmap_gtt@cpuset-medium-copy-
>         xy.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4077>) +9 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@flink-race:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-17/igt@gem_mmap_gtt@flink-race.html>
>         (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4077>) +2 other tests skip
>   *
> 
>     igt@gem_mmap_wc@read-write:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-6/igt@gem_mmap_wc@read-
>         write.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4083>) +3 other tests skip
>   *
> 
>     igt@gem_mmap_wc@read-write-distinct:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-16/igt@gem_mmap_wc@read-write-
>         distinct.html> (i915#4083 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4083>) +1 other test skip
>   *
> 
>     igt@gem_mmap_wc@write-read-distinct:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-7/igt@gem_mmap_wc@write-read-
>         distinct.html> (i915#4083 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4083>) +3 other tests skip
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-3/igt@gem_partial_pwrite_pread@writes-
>         after-reads-snoop.html> (i915#3282 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +6 other
>         tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-19/
>         igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3282>) +1 other test skip
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-
>         after-reads-uncached.html> (i915#3282 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +6 other
>         tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-2/
>         igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3282>) +3 other tests skip
>   *
> 
>     igt@gem_pread@exhaustion:
> 
>       o shard-glk: NOTRUN -> WARN <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-glk4/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2658>)
>       o shard-snb: NOTRUN -> WARN <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-snb4/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2658>)
>       o shard-tglu: NOTRUN -> WARN <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-6/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2658>)
>   *
> 
>     igt@gem_pwrite@basic-exhaustion:
> 
>       o shard-glk: NOTRUN -> WARN <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-glk5/igt@gem_pwrite@basic-exhaustion.html>
>         (i915#14702 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14702> / i915#2658 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2658>)
>   *
> 
>     igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-12/igt@gem_pxp@protected-raw-src-copy-
>         not-readible.html> (i915#4270 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/4270>)
>   *
> 
>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@gem_pxp@verify-pxp-execution-
>         after-suspend-resume.html> (i915#4270 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +4 other
>         tests skip
>   *
> 
>     igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-1/igt@gem_render_copy@y-tiled-mc-
>         ccs-to-vebox-yf-tiled.html> (i915#8428 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +2 other
>         tests skip
>   *
> 
>     igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@gem_render_copy@yf-tiled-to-
>         vebox-y-tiled.html> (i915#5190 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/5190> / i915#8428 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +5 other
>         tests skip
>   *
> 
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-
>         tiled.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/8411>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-18/igt@gem_set_tiling_vs_blt@tiled-to-
>         tiled.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4079>)
>   *
> 
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@gem_set_tiling_vs_blt@tiled-to-
>         untiled.html> (i915#4079 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4079>) +1 other test skip
>   *
> 
>     igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-
>         to-tiled.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#8411 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-4/
>         igt@gem_set_tiling_vs_blt@untiled-to-tiled.html> (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>         +1 other test skip
>   *
> 
>     igt@gem_softpin@evict-snoop:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-3/igt@gem_softpin@evict-snoop.html>
>         (i915#4885 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4885>)
>   *
> 
>     igt@gem_tiled_partial_pwrite_pread@writes:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/
>         igt@gem_tiled_partial_pwrite_pread@writes.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3282 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3282>) +1 other test skip
>   *
> 
>     igt@gem_unfence_active_buffers:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-7/igt@gem_unfence_active_buffers.html>
>         (i915#4879 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4879>)
>   *
> 
>     igt@gem_userptr_blits@dmabuf-sync:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-glk9/igt@gem_userptr_blits@dmabuf-
>         sync.html> (i915#3323 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3323>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@gem_userptr_blits@dmabuf-
>         sync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3297> / i915#3323 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>   *
> 
>     igt@gem_userptr_blits@dmabuf-unsync:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-5/igt@gem_userptr_blits@dmabuf-
>         unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@gem_userptr_blits@map-fixed-
>         invalidate-overlap.html> (i915#3297 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> /
>         i915#4880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4880>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-19/igt@gem_userptr_blits@map-fixed-
>         invalidate-overlap.html> (i915#3297 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> /
>         i915#4880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4880>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-4/igt@gem_userptr_blits@map-
>         fixed-invalidate-overlap.html> (i915#3297 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@unsync-overlap:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-8/igt@gem_userptr_blits@unsync-
>         overlap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3297>) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-8/igt@gem_userptr_blits@unsync-
>         overlap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@unsync-unmap:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@gem_userptr_blits@unsync-
>         unmap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3297>)
>   *
> 
>     igt@gen3_render_linear_blits:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@gen3_render_linear_blits.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) +3 other tests skip
>   *
> 
>     igt@gen7_exec_parse@basic-offset:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@gen7_exec_parse@basic-
>         offset.html> +11 other tests skip
>   *
> 
>     igt@gen9_exec_parse@allowed-single:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@gen9_exec_parse@allowed-
>         single.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#2527 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +1 other
>         test skip
>   *
> 
>     igt@gen9_exec_parse@batch-zero-length:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-1/igt@gen9_exec_parse@batch-zero-
>         length.html> (i915#2856 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2856>) +2 other tests skip
>   *
> 
>     igt@gen9_exec_parse@bb-start-cmd:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@gen9_exec_parse@bb-start-
>         cmd.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/2527> / i915#2856 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>   *
> 
>     igt@gen9_exec_parse@bb-start-far:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-8/igt@gen9_exec_parse@bb-start-
>         far.html> (i915#2856 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/2856>) +5 other tests skip
>   *
> 
>     igt@gen9_exec_parse@bb-start-out:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-14/igt@gen9_exec_parse@bb-start-
>         out.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/2527>) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-7/igt@gen9_exec_parse@bb-start-
>         out.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/2527> / i915#2856 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +1 other
>         test skip
>   *
> 
>     igt@gen9_exec_parse@valid-registers:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@gen9_exec_parse@valid-
>         registers.html> (i915#2527 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2527>) +5 other tests skip
>   *
> 
>     igt@i915_drm_fdinfo@busy-hang@vcs0:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@i915_drm_fdinfo@busy-
>         hang@vcs0.html> (i915#14073 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14073>) +7 other tests skip
>   *
> 
>     igt@i915_drm_fdinfo@virtual-busy-idle:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@i915_drm_fdinfo@virtual-busy-
>         idle.html> (i915#14118 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14118>) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-18/igt@i915_drm_fdinfo@virtual-busy-
>         idle.html> (i915#14118 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14118>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-5/igt@i915_drm_fdinfo@virtual-
>         busy-idle.html> (i915#14118 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14118>)
>   *
> 
>     igt@i915_module_load@fault-injection@__uc_init:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-3/igt@i915_module_load@fault-
>         injection@__uc_init.html> (i915#15479 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479>) +4 other
>         tests skip
>   *
> 
>     igt@i915_module_load@fault-injection@intel_connector_register:
> 
>       o shard-rkl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-rkl-3/igt@i915_module_load@fault-
>         injection@intel_connector_register.html> (i915#15342 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342>) +1 other
>         test abort
>   *
> 
>     igt@i915_module_load@reload-no-display:
> 
>       o shard-dg2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-dg2-4/
>         igt@i915_module_load@reload-no-display.html> (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13029> / i915#14545 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14545>)
>   *
> 
>     igt@i915_module_load@resize-bar:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@i915_module_load@resize-
>         bar.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544> / i915#6412 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412>)
>   *
> 
>     igt@i915_pm_freq_api@freq-reset-multiple:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@i915_pm_freq_api@freq-
>         reset-multiple.html> (i915#8399 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/8399>) +1 other test skip
>   *
> 
>     igt@i915_pm_freq_api@freq-suspend:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@i915_pm_freq_api@freq-
>         suspend.html> (i915#8399 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8399>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-
>         idle.html> (i915#14498 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14498>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-
>         idle.html> (i915#14498 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14498> / i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>   *
> 
>     igt@i915_pm_rpm@system-suspend-execbuf:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk8/igt@i915_pm_rpm@system-
>         suspend-execbuf.html> (i915#13356 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356> /
>         i915#15172 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15172>)
>   *
> 
>     igt@i915_pm_rps@min-max-config-idle:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-3/igt@i915_pm_rps@min-max-config-
>         idle.html> (i915#11681 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/11681> / i915#6621 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>) +1 other
>         test skip
>   *
> 
>     igt@i915_pm_rps@min-max-config-loaded:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-8/igt@i915_pm_rps@min-max-config-
>         loaded.html> (i915#11681 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11681> / i915#6621 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>   *
> 
>     igt@i915_suspend@forcewake:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk5/
>         igt@i915_suspend@forcewake.html> (i915#4817 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>   *
> 
>     igt@intel_hwmon@hwmon-write:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@intel_hwmon@hwmon-
>         write.html> (i915#7707 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/7707>)
>   *
> 
>     igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_addfb_basic@basic-x-tiled-
>         legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4212>) +1 other test skip
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume:
> 
>       o shard-glk11: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk11/igt@kms_async_flips@async-
>         flip-suspend-resume.html> (i915#12761 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761>) +1 other
>         test incomplete
>   *
> 
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_atomic@plane-primary-
>         overlay-mutable-zpos.html> (i915#9531 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-6/
>         igt@kms_atomic_transition@plane-all-modeset-transition-
>         fencing.html> (i915#1769 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/1769> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>       o shard-glk10: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-glk10/igt@kms_atomic_transition@plane-
>         all-modeset-transition-internal-panels.html> (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>)
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-16/igt@kms_big_fb@4-tiled-64bpp-
>         rotate-180.html> (i915#4538 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4538> / i915#5286 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +1 other
>         test skip
>   *
> 
>     igt@kms_big_fb@4-tiled-addfb:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#5286 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5286>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/5286>)
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-8/igt@kms_big_fb@4-tiled-
>         addfb.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/5286>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-
>         overflow.html> (i915#5286 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5286>) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-
>         stride-64bpp-rotate-180-async-flip.html> (i915#5286 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +4 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@kms_big_fb@linear-max-hw-
>         stride-64bpp-rotate-0-hflip.html> (i915#3828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_big_fb@linear-max-hw-
>         stride-64bpp-rotate-0-hflip.html> (i915#3828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-
>         rotate-90.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#3638 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-8/igt@kms_big_fb@y-tiled-8bpp-
>         rotate-270.html> (i915#4538 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4538> / i915#5190 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) +11 other
>         tests skip
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-8/igt@kms_big_fb@y-tiled-8bpp-
>         rotate-270.html> (i915#3638 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3638>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-4/igt@kms_big_fb@yf-tiled-
>         addfb.html> (i915#6187 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/6187>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-
>         stride-32bpp-rotate-180-hflip-async-flip.html> (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>)
>         +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-19/igt@kms_ccs@bad-aux-stride-4-tiled-
>         mtl-mc-ccs@pipe-a-hdmi-a-4.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +176
>         other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-
>         dg2-rc-ccs@pipe-c-hdmi-a-1.html> (i915#14098 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/6095>) +43 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-
>         tiled-bmg-ccs.html> (i915#12313 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/12313>) +2 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-4/igt@kms_ccs@crc-primary-basic-
>         y-tiled-ccs@pipe-d-edp-1.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +34 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-6/igt@kms_ccs@crc-primary-basic-
>         y-tiled-ccs@pipe-d-hdmi-a-1.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +39 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
> 
>       o shard-glk11: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-glk11/igt@kms_ccs@crc-primary-basic-y-
>         tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html> +40 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-
>         tiled-bmg-ccs.html> (i915#12805 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/12805>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-
>         tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/6095>) +10 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-
>         tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html> (i915#14098 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#6095 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6095>) +5 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-6/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-lnl-ccs.html> (i915#12805 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-7/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-lnl-ccs.html> (i915#12805 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk9/igt@kms_ccs@crc-primary-
>         suspend-y-tiled-ccs.html> (i915#15582 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582>) +2 other
>         tests incomplete
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-
>         tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +8 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-bmg-ccs.html> (i915#12313 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>) +1 other
>         test skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-lnl-ccs.html> (i915#12313 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>) +1 other
>         test skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html> (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/10307> / i915#6095 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6095>) +103 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-
>     hdmi-a-2:
> 
>       o shard-glk10: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-glk10/igt@kms_ccs@crc-sprite-planes-
>         basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html> +102 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-
>         mtl-rc-ccs@pipe-b-hdmi-a-2.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +64 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_ccs@random-ccs-data-y-
>         tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +34 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-
>         tiled-ccs@pipe-d-hdmi-a-1.html> (i915#10307 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> /
>         i915#10434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/10434> / i915#6095 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6095>) +4 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-4/igt@kms_cdclk@mode-transition-
>         all-outputs.html> (i915#3742 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3742>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-
>         d-hdmi-a-3.html> (i915#13781 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/13781>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_audio@hdmi-audio-edid:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-2/igt@kms_chamelium_audio@hdmi-
>         audio-edid.html> (i915#11151 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/11151> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +4 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_edid@hdmi-edid-read:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-
>         read.html> (i915#11151 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/11151> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +9 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-fast:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_chamelium_frames@dp-crc-
>         fast.html> (i915#11151 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/11151> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +11 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-5/igt@kms_chamelium_hpd@common-
>         hpd-after-suspend.html> (i915#11151 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151> /
>         i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/7828>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-after-
>         suspend.html> (i915#11151 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11151> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +1 other
>         test skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-
>         enable-disable-mode.html> (i915#11151 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151> /
>         i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/7828>) +4 other tests skip
>   *
> 
>     igt@kms_color@deep-color:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_color@deep-color.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-5/igt@kms_color@deep-color.html> (i915#12655 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@kms_content_protection@dp-mst-
>         lic-type-0-hdcp14.html> (i915#15330 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-7/igt@kms_content_protection@dp-
>         mst-lic-type-1.html> (i915#15330 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330> /
>         i915#3116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3116> / i915#3299 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3299>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-2/igt@kms_content_protection@dp-
>         mst-lic-type-1.html> (i915#15330 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330> /
>         i915#3299 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3299>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0-hdcp14:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-5/igt@kms_content_protection@dp-
>         mst-type-0-hdcp14.html> (i915#15330 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0-suspend-resume:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_content_protection@dp-mst-
>         type-0-suspend-resume.html> (i915#15330 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>)
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-4/igt@kms_content_protection@lic-
>         type-0.html> (i915#15865 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15865>)
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-7/igt@kms_content_protection@lic-
>         type-1.html> (i915#15865 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15865>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@mei-interface:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_content_protection@mei-
>         interface.html> (i915#15865 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15865>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_cursor_crc@cursor-
>         offscreen-32x10.html> (i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +3 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@kms_cursor_crc@cursor-
>         onscreen-256x85@pipe-a-hdmi-a-2.html> (i915#13566 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>) +1 other
>         test fail
>   *
> 
>     igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-tglu-4/igt@kms_cursor_crc@cursor-
>         random-128x42@pipe-a-hdmi-a-1.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-tglu-3/
>         igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html>
>         (i915#13566 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13566>) +1 other test fail
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-
>         movement-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3555>) +2 other tests skip
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-6/igt@kms_cursor_crc@cursor-
>         rapid-movement-32x10.html> (i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +2 other
>         tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-4/igt@kms_cursor_crc@cursor-
>         rapid-movement-32x10.html> (i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> /
>         i915#8814 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8814>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-
>         movement-512x170.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>) +1 other
>         test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-7/igt@kms_cursor_crc@cursor-
>         rapid-movement-512x512.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-8/igt@kms_cursor_crc@cursor-
>         rapid-movement-512x512.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-
>         movement-512x512.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-
>         movement-512x512.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-1/igt@kms_cursor_crc@cursor-
>         sliding-256x85.html> (i915#8814 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/8814>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-3/igt@kms_cursor_crc@cursor-
>         sliding-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3555>) +3 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-19/igt@kms_cursor_crc@cursor-
>         sliding-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_cursor_crc@cursor-
>         sliding-512x512.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-1/igt@kms_cursor_crc@cursor-
>         sliding-64x21@pipe-a-hdmi-a-2.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-7/
>         igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html>
>         (i915#13566 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13566>) +1 other test fail
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend:
> 
>       o shard-glk10: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk10/igt@kms_cursor_crc@cursor-
>         suspend.html> (i915#12358 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/12358> / i915#14152 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152> /
>         i915#7882 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/7882>)
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> 
>       o shard-glk10: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk10/igt@kms_cursor_crc@cursor-
>         suspend@pipe-a-hdmi-a-1.html> (i915#12358 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358> /
>         i915#14152 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14152>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-
>         flip-before-cursor-varying-size.html> (i915#4103 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> /
>         i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4213>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-
>         flipa-atomic-transitions.html> (i915#13046 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046> /
>         i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/5354>) +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-
>         vs-flipa-atomic-transitions.html> (i915#9809 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>) +2 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>       o shard-glk: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-
>         atomic-transitions.html> (i915#15804 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804>) +1 other
>         test fail
>   *
> 
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_cursor_legacy@modeset-
>         atomic-cursor-hotspot.html> (i915#9067 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-9/igt@kms_cursor_legacy@short-
>         busy-flip-before-cursor-toggle.html> (i915#4103 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>   *
> 
>     igt@kms_cursor_legacy@single-move:
> 
>       o shard-dg1: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg1-14/igt@kms_cursor_legacy@single-
>         move.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-12/igt@kms_cursor_legacy@single-
>         move.html> (i915#4423 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4423>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-1/igt@kms_dirtyfb@drrs-dirtyfb-
>         ioctl.html> (i915#9833 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9833>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-
>         ioctl.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9723>)
>   *
> 
>     igt@kms_dp_link_training@uhbr-mst:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-2/igt@kms_dp_link_training@uhbr-
>         mst.html> (i915#13748 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/13748>)
>   *
> 
>     igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-3/igt@kms_dp_linktrain_fallback@dp-
>         fallback.html> (i915#13707 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/13707>)
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-7/igt@kms_dsc@dsc-fractional-
>         bpp.html> (i915#3840 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3840>) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-2/igt@kms_dsc@dsc-fractional-
>         bpp.html> (i915#3840 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3840> / i915#9688 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_dsc@dsc-fractional-bpp-with-
>         bpc.html> (i915#3840 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-formats:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_dsc@dsc-with-formats.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats-
>         with-bpc.html> (i915#3840 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3840> / i915#9053 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats-
>         with-bpc.html> (i915#3840 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3840> / i915#9053 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-3/igt@kms_fbcon_fbt@psr.html>
>         (i915#3955 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3955>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-on-nop:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-
>         on-nop.html> (i915#9934 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9934>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible@ab-hdmi-a1-hdmi-a2.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-glk9/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-
>         hdmi-a2.html> (i915#13027 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/13027>) +1 other test fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk8/igt@kms_flip@2x-flip-vs-
>         suspend.html> (i915#12314 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/12314> / i915#12745 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745> /
>         i915#4839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4839>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk8/igt@kms_flip@2x-flip-vs-
>         suspend@ac-hdmi-a1-hdmi-a2.html> (i915#12314 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314> /
>         i915#12745 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12745>)
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-2/igt@kms_flip@2x-nonexisting-fb-
>         interruptible.html> (i915#3637 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3637> / i915#9934 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@kms_flip@2x-wf_vblank-ts-
>         check.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9934>) +6 other tests skip
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@kms_flip@2x-wf_vblank-ts-
>         check.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9934>) +5 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-
>         check.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3637> / i915#9934 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +3 other
>         tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-18/igt@kms_flip@2x-wf_vblank-ts-
>         check.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9934>) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-5/igt@kms_flip@2x-wf_vblank-ts-
>         check.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3637> / i915#9934 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip@flip-vs-dpms-on-nop:
> 
>       o shard-tglu: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-tglu-4/igt@kms_flip@flip-vs-dpms-on-nop.html>
>         -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/
>         shard-tglu-7/igt@kms_flip@flip-vs-dpms-on-nop.html> (i915#10826
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826>)
>   *
> 
>     igt@kms_flip@flip-vs-fences-interruptible:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_flip@flip-vs-fences-
>         interruptible.html> (i915#8381 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/8381>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>     upscaling:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-8/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>         upscaling.html> (i915#15643 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15643>) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-4/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-
>         downscaling.html> (i915#15643 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/15643>) +2 other tests skip
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-
>         yftile-to-64bpp-yftile-downscaling.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#15643 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15643>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-2/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
>         downscaling.html> (i915#15643 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/15643>) +3 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>     upscaling:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>         upscaling.html> (i915#15643 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15643>) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-19/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>         upscaling.html> (i915#15643 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15643>) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-
>         downscaling@pipe-a-default-mode.html> (i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> /
>         i915#8810 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8810> / i915#8813 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8813>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-
>         ytile-to-32bpp-ytile-downscaling.html> (i915#15643 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643> /
>         i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/5190>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-
>         ytile-to-32bpp-ytilegen12rcccs-upscaling.html> (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +2 other tests skip
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-mtlp: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-mtlp-5/igt@kms_force_connector_basic@prune-
>         stale-modes.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-mtlp-1/
>         igt@kms_force_connector_basic@prune-stale-modes.html>
>         (i915#15672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15672>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-cur-indfb-draw-blt.html> (i915#15991 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991> /
>         i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/5354>) +29 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-cur-indfb-draw-mmap-wc.html> (i915#15990 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990> /
>         i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8708>) +14 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-15/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-
>         mmap-wc.html> (i915#15990 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15990> / i915#8708 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +3 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-cur-indfb-draw-render.html> (i915#1825 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +34 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-8/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-
>         blt.html> (i915#15991 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15991> / i915#1825 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +14 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-
>         mmap-cpu.html> +75 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/
>         igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-
>         blt.html> (i915#15989 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15989>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-3/
>         igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-
>         pwrite.html> (i915#15989 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15989>) +22 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-2/
>         igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-
>         fullscreen.html> (i915#15989 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/15989>) +25 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>       o shard-glk: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-
>         primscrn-pri-indfb-draw-mmap-gtt.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-glk6/
>         igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-
>         mmap-gtt.html> +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-3/
>         igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-
>         mmap-gtt.html> (i915#15990 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15990>) +24 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-10/
>         igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-
>         blt.html> +60 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-
>         rgb565-draw-mmap-cpu.html> (i915#15989 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>) +21
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/
>         igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html> (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>         +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-
>     mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-8/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-
>         mmap-gtt.html> (i915#15104 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15104> / i915#15990 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-
>         blt.html> (i915#15102 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15102>) +18 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-
>         move.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/10433> / i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102> /
>         i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3458>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-
>         mmap-cpu.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#1825 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +6 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-
>         mmap-gtt.html> (i915#15990 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15990> / i915#8708 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +2 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-
>     mmap-cpu:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/
>         igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-
>         draw-mmap-cpu.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>) +2 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-
>     render:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-13/
>         igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-
>         draw-render.html> (i915#15102 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/15102>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/
>         igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-
>         move.html> (i915#15102 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15102>) +32 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-
>     mmap-cpu:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-2/
>         igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-
>         draw-mmap-cpu.html> (i915#15102 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/15102>) +22 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-2/
>         igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-
>         blt.html> +58 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-2/
>         igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-
>         gtt.html> (i915#15990 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15990>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-14/
>         igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-
>         blt.html> (i915#15989 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15989>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-
>         primscrn-cur-indfb-draw-blt.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-5/
>         igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-
>         blt.html> (i915#15989 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15989>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-
>         rgb101010-draw-pwrite.html> (i915#15989 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>) +17
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-
>         primscrn-pri-shrfb-draw-render.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#15102 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15102> / i915#3023 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3023>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-
>         primscrn-spr-indfb-draw-blt.html> (i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102> /
>         i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3458>) +15 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-19/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-
>         blt.html> (i915#15102 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15102> / i915#3458 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +3 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>       o shard-snb: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-
>         primscrn-pri-shrfb-draw-mmap-cpu.html> +146 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-
>         rgb565-draw-render.html> (i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102> /
>         i915#3023 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3023>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-12/
>         igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-
>         mmap-gtt.html> (i915#15990 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15990>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-8/
>         igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-
>         mmap-cpu.html> (i915#15991 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15991>) +18 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-msflip-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-3/
>         igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-msflip-
>         blt.html> (i915#15991 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15991>) +38 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psrhdr-2p-rte:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-12/
>         igt@kms_frontbuffer_tracking@psrhdr-2p-rte.html> +21 other tests
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-blt:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-4/
>         igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-blt.html>
>         (i915#15102 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15102>) +38 other tests skip
>   *
> 
>     igt@kms_hdr@bpc-switch:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@kms_hdr@bpc-switch.html>
>         (i915#16012 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/16012> / i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555> / i915#8228 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-4/igt@kms_hdr@bpc-switch.html>
>         (i915#16012 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/16012> / i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555> / i915#8228 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_hdr@bpc-switch-
>         suspend.html> (i915#16012 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/16012> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> /
>         i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8228>)
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_hdr@bpc-switch-
>         suspend@pipe-a-hdmi-a-1-xrgb2101010.html> (i915#16012 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>) +1 other
>         test skip
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-4-xrgb2101010:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-19/igt@kms_hdr@bpc-switch-
>         suspend@pipe-a-hdmi-a-4-xrgb2101010.html> (i915#16012 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>) +3 other
>         tests skip
>   *
> 
>     igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-4/igt@kms_hdr@bpc-switch@pipe-a-
>         hdmi-a-1-xrgb2101010.html> (i915#16012 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>) +1 other
>         test skip
>   *
> 
>     igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-2-xrgb16161616f:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@kms_hdr@bpc-switch@pipe-a-hdmi-
>         a-2-xrgb16161616f.html> (i915#16012 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>) +1 other
>         test skip
>   *
> 
>     igt@kms_hdr@invalid-metadata-sizes:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-8/igt@kms_hdr@invalid-metadata-
>         sizes.html> (i915#16011 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/16011> / i915#3555 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> /
>         i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8228>) +1 other test skip
>   *
> 
>     igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-14/igt@kms_hdr@invalid-metadata-
>         sizes@pipe-a-hdmi-a-1-xrgb16161616f.html> (i915#16011 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>) +7 other
>         tests skip
>   *
> 
>     igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb16161616f:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@kms_hdr@static-toggle-dpms@pipe-
>         a-hdmi-a-3-xrgb16161616f.html> (i915#16011 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>) +7 other
>         tests skip
>   *
> 
>     igt@kms_hdr@static-toggle@pipe-a-hdmi-a-2-xrgb2101010:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-4/igt@kms_hdr@static-toggle@pipe-a-
>         hdmi-a-2-xrgb2101010.html> (i915#16011 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>) +3 other
>         tests skip
>   *
> 
>     igt@kms_joiner@basic-big-joiner:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-7/igt@kms_joiner@basic-big-
>         joiner.html> (i915#15460 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15460>)
>   *
> 
>     igt@kms_joiner@basic-force-big-joiner:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_joiner@basic-force-big-
>         joiner.html> (i915#15459 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15459>)
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-1/igt@kms_joiner@basic-force-ultra-
>         joiner.html> (i915#15458 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15458>)
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_joiner@basic-force-
>         ultra-joiner.html> (i915#15458 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/15458>)
>   *
> 
>     igt@kms_joiner@basic-max-non-joiner:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_joiner@basic-max-non-
>         joiner.html> (i915#13688 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/13688>)
>   *
> 
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-1/igt@kms_joiner@switch-modeset-ultra-
>         joiner-big-joiner.html> (i915#15638 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638> /
>         i915#15722 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15722>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-4/igt@kms_joiner@switch-modeset-ultra-
>         joiner-big-joiner.html> (i915#15638 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638> /
>         i915#15722 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15722>)
>   *
> 
>     igt@kms_panel_fitting@atomic-fastset:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@kms_panel_fitting@atomic-
>         fastset.html> (i915#6301 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6301>)
>   *
> 
>     igt@kms_panel_fitting@legacy:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/
>         igt@kms_panel_fitting@legacy.html> (i915#6301 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>   *
> 
>     igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-8/igt@kms_pipe_b_c_ivb@pipe-b-
>         double-modeset-then-modeset-pipe-c.html> +11 other tests skip
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-8/igt@kms_pipe_crc_basic@suspend-read-
>         crc.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-
>         crc.html> (i915#12756 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/12756> / i915#13476 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476>)
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-rkl-6/
>         igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html>
>         (i915#13476 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13476>)
>   *
> 
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-
>         yftiled.html> (i915#14712 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14712>)
>   *
> 
>     igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-
>         ytiled.html> (i915#13705 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/13705>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-5/igt@kms_pipe_stress@stress-
>         xrgb8888-ytiled.html> (i915#13705 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705>)
>   *
> 
>     igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_plane@pixel-format-4-
>         tiled-dg2-mc-ccs-modifier.html> (i915#15709 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>) +1 other
>         test skip
>   *
> 
>     igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-
>         mtl-mc-ccs-modifier.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#15709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15709>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-17/igt@kms_plane@pixel-format-4-tiled-
>         mtl-mc-ccs-modifier.html> (i915#15709 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>) +1 other
>         test skip
>   *
> 
>     igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-4/igt@kms_plane@pixel-format-4-
>         tiled-mtl-mc-ccs-modifier@pipe-b-plane-5.html> (i915#15608
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608>)
>         +1 other test skip
>   *
> 
>     igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-1/igt@kms_plane@pixel-format-y-tiled-
>         gen12-mc-ccs-modifier.html> (i915#15709 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>) +4 other
>         tests skip
>   *
> 
>     igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-4/igt@kms_plane@pixel-format-y-
>         tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html> (i915#15608
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608>)
>         +1 other test skip
>   *
> 
>     igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-6/igt@kms_plane@pixel-format-yf-
>         tiled-modifier-source-clamping.html> (i915#15709 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>) +1 other
>         test skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-7/igt@kms_plane@pixel-format-yf-
>         tiled-modifier-source-clamping.html> (i915#15709 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>) +2 other
>         tests skip
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@kms_plane@pixel-format-yf-tiled-
>         modifier-source-clamping.html> (i915#15709 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>   *
> 
>     igt@kms_plane_alpha_blend@alpha-transparent-fb:
> 
>       o shard-glk: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-glk6/igt@kms_plane_alpha_blend@alpha-
>         transparent-fb.html> (i915#10647 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647> /
>         i915#12177 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12177>)
>   *
> 
>     igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
> 
>       o shard-glk: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-glk6/igt@kms_plane_alpha_blend@alpha-
>         transparent-fb@pipe-a-hdmi-a-1.html> (i915#10647 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>) +1 other
>         test fail
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-4:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-8/igt@kms_plane_multiple@2x-
>         tiling-4.html> (i915#13958 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/13958>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-none:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-6/igt@kms_plane_multiple@2x-
>         tiling-none.html> (i915#13958 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/13958>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-x:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_plane_multiple@2x-
>         tiling-x.html> (i915#13958 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/13958>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-y:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-
>         y.html> (i915#13958 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/13958>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@kms_plane_scaling@plane-
>         upscale-20x20-with-rotation@pipe-a.html> (i915#15329 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>) +3 other
>         tests skip
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_pm_backlight@bad-
>         brightness.html> (i915#9812 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9812>)
>   *
> 
>     igt@kms_pm_backlight@brightness-with-dpms:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-4/igt@kms_pm_backlight@brightness-
>         with-dpms.html> (i915#12343 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/12343>)
>   *
> 
>     igt@kms_pm_backlight@fade-with-dpms:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@kms_pm_backlight@fade-with-
>         dpms.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544> / i915#5354 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-8/igt@kms_pm_backlight@fade-with-
>         dpms.html> (i915#9812 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9812>)
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_pm_dc@dc3co-vpb-
>         simulation.html> (i915#15948 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/15948>)
>   *
> 
>     igt@kms_pm_lpsp@kms-lpsp:
> 
>       o shard-dg2: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         dg2-7/igt@kms_pm_lpsp@kms-lpsp.html> (i915#9340 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>   *
> 
>     igt@kms_pm_lpsp@screens-disabled:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_pm_lpsp@screens-
>         disabled.html> (i915#8430 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8430>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-
>         stress.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (i915#15073 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15073>) +1 other test skip
>       o shard-dg1: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-
>         stress.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-
>         stress.html> (i915#15073 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15073>)
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-2/igt@kms_pm_rpm@modeset-non-
>         lpsp.html> (i915#15073 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15073>)
>   *
> 
>     igt@kms_pm_rpm@package-g7:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-9/igt@kms_pm_rpm@package-g7.html>
>         (i915#15403 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15403>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-5/igt@kms_pm_rpm@package-g7.html>
>         (i915#15403 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15403>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-2/igt@kms_pm_rpm@package-g7.html>
>         (i915#15403 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15403>)
>   *
> 
>     igt@kms_prime@basic-modeset-hybrid:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_prime@basic-modeset-
>         hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_prime@d3hot:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@kms_prime@d3hot.html> (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524> /
>         i915#6805 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/6805>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@kms_prime@d3hot.html> (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor-
>         plane-move-continuous-exceed-fully-sf.html> (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +3 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-
>         plane-move-continuous-exceed-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> 
>       o shard-glk11: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-glk11/igt@kms_psr2_sf@fbc-pr-plane-
>         move-sf-dmg-area.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-
>     sf@pipe-a-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html>
>         (i915#9808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9808>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>       o shard-glk10: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-glk10/igt@kms_psr2_sf@fbc-psr2-
>         primary-plane-update-sf-dmg-area.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-update-sf:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-3/igt@kms_psr2_sf@pr-cursor-
>         plane-update-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +4 other
>         tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-8/igt@kms_psr2_sf@pr-cursor-
>         plane-update-sf.html> (i915#12316 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316>) +3 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-3/igt@kms_psr2_sf@psr2-overlay-plane-
>         update-sf-dmg-area.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +5 other
>         tests skip
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-
>         update-sf-dmg-area.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +4 other
>         tests skip
>       o shard-snb: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-snb1/igt@kms_psr2_sf@psr2-overlay-plane-
>         update-sf-dmg-area.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +2 other
>         tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-16/igt@kms_psr2_sf@psr2-overlay-plane-
>         update-sf-dmg-area.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +2 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-glk6/igt@kms_psr2_sf@psr2-overlay-primary-
>         update-sf-dmg-area.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +11
>         other tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-9/igt@kms_psr2_su@page_flip-
>         nv12.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9683>)
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-blt:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-
>         blt.html> (i915#9732 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9732>) +16 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-glk5/igt@kms_psr@fbc-psr2-cursor-mmap-
>         gtt.html> +640 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-blt:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@kms_psr@fbc-psr2-primary-
>         blt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/1072> / i915#9732 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +22 other
>         tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-mmap-gtt:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-9/igt@kms_psr@fbc-psr2-primary-
>         mmap-gtt.html> (i915#9732 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9732>) +13 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-5/igt@kms_psr@fbc-psr2-primary-
>         render.html> (i915#9688 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9688>) +10 other tests skip
>   *
> 
>     igt@kms_psr@pr-primary-blt:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-16/igt@kms_psr@pr-primary-blt.html>
>         (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9732>) +6 other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-render:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@kms_psr@psr-cursor-render.html>
>         (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9732>) +21 other tests skip
>   *
> 
>     igt@kms_psr@psr-no-drrs:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@kms_psr@psr-no-drrs.html>
>         (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1072> / i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#9732 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +1 other
>         test skip
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-4/igt@kms_psr_stress_test@flip-
>         primary-invalidate-overlay.html> (i915#15949 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949>)
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-1/igt@kms_psr_stress_test@flip-
>         primary-invalidate-overlay.html> (i915#15949 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949>)
>   *
> 
>     igt@kms_rotation_crc@multiplane-rotation:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk5/
>         igt@kms_rotation_crc@multiplane-rotation.html> (i915#15492
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492>)
>         +1 other test incomplete
>   *
> 
>     igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
> 
>       o shard-glk10: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk10/
>         igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html>
>         (i915#15500 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15500>)
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-90:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-1/igt@kms_rotation_crc@primary-
>         rotation-90.html> (i915#12755 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/12755> / i915#15867 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867>)
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-6/igt@kms_rotation_crc@primary-
>         rotation-90.html> (i915#12755 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/12755> / i915#15867 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-6/igt@kms_rotation_crc@primary-y-
>         tiled-reflect-x-90.html> (i915#12755 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755> /
>         i915#15867 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15867> / i915#5190 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-4/igt@kms_rotation_crc@primary-yf-
>         tiled-reflect-x-180.html> (i915#5289 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_selftest@drm_framebuffer:
> 
>       o shard-rkl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-rkl-2/
>         igt@kms_selftest@drm_framebuffer.html> (i915#13179 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179>) +1 other
>         test abort
>       o shard-snb: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-snb6/
>         igt@kms_selftest@drm_framebuffer.html> (i915#13179 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179>) +1 other
>         test abort
>       o shard-glk: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-glk6/
>         igt@kms_selftest@drm_framebuffer.html> (i915#13179 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179>) +1 other
>         test abort
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> (i915#8623 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-3/igt@kms_tiled_display@basic-
>         test-pattern-with-chamelium.html> (i915#8623 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-6/igt@kms_tiled_display@basic-
>         test-pattern-with-chamelium.html> (i915#8623 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>   *
> 
>     igt@kms_vblank@ts-continuation-suspend:
> 
>       o shard-glk11: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-glk11/igt@kms_vblank@ts-
>         continuation-suspend.html> (i915#12276 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276>) +1 other
>         test incomplete
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-2/igt@kms_vblank@ts-continuation-
>         suspend.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-1/igt@kms_vblank@ts-continuation-
>         suspend.html> (i915#15132 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15132>)
>   *
> 
>     igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-rkl-1/igt@kms_vblank@ts-continuation-
>         suspend@pipe-c-hdmi-a-2.html> (i915#15132 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132>)
>   *
> 
>     igt@kms_vrr@flip-basic:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@kms_vrr@flip-basic.html>
>         (i915#15243 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15243> / i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555>) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-1/igt@kms_vrr@flip-basic.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#8808 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8808>)
>   *
> 
>     igt@kms_vrr@max-min:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-4/igt@kms_vrr@max-min.html> (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg1-17/igt@kms_vrr@max-min.html>
>         (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9906>) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-7/igt@kms_vrr@max-min.html>
>         (i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/8808> / i915#9906 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_vrr@negative-basic.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#9906 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9906>)
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-2/igt@kms_vrr@negative-basic.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#9906 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-vrr:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-
>         vrr.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9906>) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-
>         vrr.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9906>) +1 other test skip
>   *
> 
>     igt@perf@global-sseu-config:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-1/igt@perf@global-sseu-
>         config.html> (i915#7387 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7387>)
>   *
> 
>     igt@perf@mi-rpc:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@perf@mi-rpc.html> (i915#2434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-mtlp-5/igt@perf@mi-rpc.html>
>         (i915#2434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2434>)
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-1/igt@prime_vgem@basic-fence-
>         read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3291> / i915#3708 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@prime_vgem@basic-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@prime_vgem@basic-gtt.html>
>         (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4077>)
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-5/igt@sriov_basic@enable-vfs-
>         autoprobe-off.html> (i915#9917 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/9917>)
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
> 
>       o shard-tglu: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_15131/shard-tglu-3/igt@sriov_basic@enable-vfs-
>         autoprobe-off@numvfs-6.html> (i915#12910 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910>) +9 other
>         tests fail
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_create@create-ext-cpu-access-big:
> 
>       o shard-dg2: FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg2-1/igt@gem_create@create-ext-cpu-access-
>         big.html> (i915#15454 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15454>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-dg2-6/igt@gem_create@create-ext-
>         cpu-access-big.html>
>   *
> 
>     igt@gem_eio@in-flight-suspend:
> 
>       o shard-rkl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@gem_eio@in-flight-suspend.html>
>         (i915#13390 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13390>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-8/igt@gem_eio@in-flight-suspend.html>
>   *
> 
>     igt@gem_eio@kms:
> 
>       o shard-rkl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-7/igt@gem_eio@kms.html> (i915#13363
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363>)
>         -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/
>         shard-rkl-6/igt@gem_eio@kms.html>
>       o shard-tglu: DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-
>         tip/CI_DRM_18447/shard-tglu-7/igt@gem_eio@kms.html> (i915#13363
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363>)
>         -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/
>         shard-tglu-5/igt@gem_eio@kms.html>
>   *
> 
>     igt@gem_exec_suspend@basic-s0:
> 
>       o shard-dg2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg2-5/igt@gem_exec_suspend@basic-s0.html>
>         (i915#13356 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13356>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html>
>         +1 other test pass
>   *
> 
>     igt@gem_mmap_offset@clear-via-pagefault:
> 
>       o shard-mtlp: INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-
>         tip/CI_DRM_18447/shard-mtlp-2/igt@gem_mmap_offset@clear-via-
>         pagefault.html> (i915#16021 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/16021>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-mtlp-1/
>         igt@gem_mmap_offset@clear-via-pagefault.html> +1 other test pass
>   *
> 
>     igt@gem_pxp@create-valid-protected-context:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-2/igt@gem_pxp@create-valid-protected-
>         context.html> (i915#4270 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4270>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-6/
>         igt@gem_pxp@create-valid-protected-context.html>
>   *
> 
>     igt@gem_workarounds@suspend-resume:
> 
>       o shard-rkl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@gem_workarounds@suspend-
>         resume.html> (i915#13356 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/13356>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-2/
>         igt@gem_workarounds@suspend-resume.html>
>       o shard-snb: ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-snb4/igt@gem_workarounds@suspend-resume.html>
>         (i915#15840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15840>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-snb7/igt@gem_workarounds@suspend-resume.html>
>   *
> 
>     igt@i915_pm_rps@waitboost:
> 
>       o shard-mtlp: FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-mtlp-2/igt@i915_pm_rps@waitboost.html>
>         (i915#15365 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15365>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-mtlp-2/igt@i915_pm_rps@waitboost.html>
>   *
> 
>     igt@i915_selftest@live:
> 
>       o shard-mtlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/CI_DRM_18447/shard-mtlp-7/igt@i915_selftest@live.html>
>         (i915#12061 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12061> / i915#15560 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15560>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-mtlp-1/
>         igt@i915_selftest@live.html>
>   *
> 
>     igt@i915_selftest@live@workarounds:
> 
>       o shard-mtlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/CI_DRM_18447/shard-mtlp-7/
>         igt@i915_selftest@live@workarounds.html> (i915#12061 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         mtlp-1/igt@i915_selftest@live@workarounds.html>
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
> 
>       o shard-glk: INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-
>         tiled-ccs@pipe-a-hdmi-a-1.html> (i915#15582 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-
>         a-1.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>       o shard-rkl: FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-8/igt@kms_cursor_crc@cursor-
>         sliding-128x42.html> (i915#13566 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html> +2 other
>         tests pass
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-tglu-8/igt@kms_cursor_crc@cursor-
>         sliding-64x21@pipe-a-hdmi-a-1.html> (i915#13566 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         tglu-4/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-
>         a-1.html> +3 other tests pass
>   *
> 
>     igt@kms_flip@plain-flip-ts-check:
> 
>       o shard-dg2: FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg2-5/igt@kms_flip@plain-flip-ts-check.html>
>         (i915#10826 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/10826>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-dg2-4/igt@kms_flip@plain-flip-ts-check.html>
>   *
> 
>     igt@kms_force_connector_basic@force-edid:
> 
>       o shard-mtlp: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-mtlp-1/igt@kms_force_connector_basic@force-
>         edid.html> (i915#15672 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15672>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-mtlp-8/
>         igt@kms_force_connector_basic@force-edid.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-rkl: ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-
>         suspend.html> (i915#15132 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15132>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-3/
>         igt@kms_frontbuffer_tracking@fbc-suspend.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-
>         primscrn-pri-shrfb-draw-mmap-cpu.html> (i915#15989 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-
>         draw-mmap-cpu.html> +4 other tests pass
>   *
> 
>     igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render:
> 
>       o shard-glk: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-
>         scndscrn-pri-shrfb-draw-render.html> -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-glk8/
>         igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-
>         render.html> +2 other tests pass
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-8/igt@kms_plane_scaling@intel-max-src-
>         size.html> (i915#6953 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/6953>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-rkl-6/
>         igt@kms_plane_scaling@intel-max-src-size.html>
>   *
> 
>     igt@kms_pm_rpm@dpms-lpsp:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html>
>         (i915#15073 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15073>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html>
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-dg2: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-
>         stress.html> (i915#15073 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15073>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-dg2-8/
>         igt@kms_pm_rpm@modeset-non-lpsp-stress.html> +1 other test pass
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-dg1: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-
>         stress-no-wait.html> (i915#15073 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         dg1-13/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html> +1
>         other test pass
>   *
> 
>     igt@kms_pm_rpm@system-suspend-idle:
> 
>       o shard-dg2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg2-6/igt@kms_pm_rpm@system-suspend-
>         idle.html> (i915#14419 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14419>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-dg2-1/igt@kms_pm_rpm@system-
>         suspend-idle.html>
>       o shard-rkl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_pm_rpm@system-suspend-
>         idle.html> (i915#14419 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14419>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-rkl-4/igt@kms_pm_rpm@system-
>         suspend-idle.html>
>   *
> 
>     igt@sysfs_heartbeat_interval@mixed:
> 
>       o shard-tglu: FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-tglu-6/
>         igt@sysfs_heartbeat_interval@mixed.html> -> PASS <https://intel-
>         gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-tglu-5/
>         igt@sysfs_heartbeat_interval@mixed.html> +1 other test pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_close_race@multigpu-basic-threads:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@gem_close_race@multigpu-basic-
>         threads.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#7697 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-5/igt@gem_close_race@multigpu-basic-threads.html> (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_ctx_sseu@mmap-args:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-2/igt@gem_ctx_sseu@mmap-args.html>
>         (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/280>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#280 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/280>)
>   *
> 
>     igt@gem_exec_balancer@parallel-ordering:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-5/igt@gem_exec_balancer@parallel-
>         ordering.html> (i915#4525 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4525>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-6/
>         igt@gem_exec_balancer@parallel-ordering.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#4525 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4525>) +1 other test skip
>   *
> 
>     igt@gem_exec_big@single:
> 
>       o shard-tglu: FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-tglu-4/igt@gem_exec_big@single.html>
>         (i915#15816 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15816>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-tglu-7/igt@gem_exec_big@single.html>
>         (i915#15944 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15944>)
>   *
> 
>     igt@gem_exec_reloc@basic-wc-read:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3281 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3281>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-8/
>         igt@gem_exec_reloc@basic-wc-read.html> (i915#3281 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +4 other
>         tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-write-read-noreloc:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-8/igt@gem_exec_reloc@basic-write-read-
>         noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3281>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-6/
>         igt@gem_exec_reloc@basic-write-read-noreloc.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3281 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3281>) +4 other tests skip
>   *
> 
>     igt@gem_lmem_evict@dontneed-evict-race:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-
>         race.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544> / i915#4613 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613> /
>         i915#7582 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/7582>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-
>         race.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/4613> / i915#7582 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-engines:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-
>         engines.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#4613 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-4/igt@gem_lmem_swapping@parallel-random-engines.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@verify-ccs:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-8/igt@gem_lmem_swapping@verify-ccs.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4613>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#4613 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4613>) +1 other test skip
>   *
> 
>     igt@gem_media_vme:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@gem_media_vme.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#284 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/284>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-rkl-4/igt@gem_media_vme.html>
>         (i915#284 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/284>)
>   *
> 
>     igt@gem_pread@display:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-2/igt@gem_pread@display.html> (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/
>         shard-rkl-6/igt@gem_pread@display.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3282>)
>   *
> 
>     igt@gem_pwrite@basic-random:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@gem_pwrite@basic-random.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3282 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3282>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-5/
>         igt@gem_pwrite@basic-random.html> (i915#3282 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +1 other
>         test skip
>   *
> 
>     igt@gem_userptr_blits@forbidden-operations:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-1/igt@gem_userptr_blits@forbidden-
>         operations.html> (i915#3282 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3282> / i915#3297 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-6/igt@gem_userptr_blits@forbidden-operations.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3282 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3282> / i915#3297 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-1/igt@gem_userptr_blits@readonly-pwrite-
>         unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3297>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-6/
>         igt@gem_userptr_blits@readonly-pwrite-unsync.html> (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3297 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-
>         cycles.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#3297 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html> (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@i915_pm_sseu@full-enable:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-2/igt@i915_pm_sseu@full-enable.html>
>         (i915#4387 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/4387>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-6/igt@i915_pm_sseu@full-enable.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#4387 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/4387>)
>   *
> 
>     igt@i915_query@hwconfig_table:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@i915_query@hwconfig_table.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#6245 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6245>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-2/
>         igt@i915_query@hwconfig_table.html> (i915#6245 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>   *
> 
>     igt@intel_hwmon@hwmon-read:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-4/igt@intel_hwmon@hwmon-read.html>
>         (i915#7707 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/7707>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-6/igt@intel_hwmon@hwmon-read.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#7707 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7707>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-180:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-
>         rotate-180.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#5286 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html> (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +1 other test skip
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-
>         rotate-90.html> (i915#5286 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/5286>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-6/igt@kms_big_fb@4-
>         tiled-64bpp-rotate-90.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/5286>)
>   *
> 
>     igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_big_fb@linear-16bpp-
>         rotate-270.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#3638 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-4/igt@kms_big_fb@linear-16bpp-rotate-270.html> (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>   *
> 
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_big_fb@linear-max-hw-
>         stride-64bpp-rotate-180-hflip.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#3828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3828>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-8/igt@kms_big_fb@linear-max-hw-
>         stride-64bpp-rotate-180-hflip.html> (i915#3828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-
>         rotate-270.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-1/
>         igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html> +24 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-
>         dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-
>         hdmi-a-2.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +5 other
>         tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-
>         dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html> (i915#14098 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/6095>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-
>         rc-ccs-cc@pipe-c-hdmi-a-2.html> (i915#14098 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#6095 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6095>) +11 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-
>         dg2-mc-ccs@pipe-b-hdmi-a-2.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/6095>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-
>         dg2-mc-ccs@pipe-b-hdmi-a-2.html> (i915#6095 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-
>         tiled-lnl-ccs.html> (i915#12313 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/12313>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-6/igt@kms_ccs@crc-
>         primary-rotation-180-4-tiled-lnl-ccs.html> (i915#12313 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-
>         tiled-lnl-ccs.html> (i915#12805 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/12805> / i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (i915#12805 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/12805>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-
>         tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html> (i915#14098 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#6095 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6095>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-4/igt@kms_ccs@crc-
>         primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html>
>         (i915#14098 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14098> / i915#6095 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6095>) +5 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-
>         stress-resolution-non-4k.html> (i915#11151 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#7828 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7828>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-7/
>         igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html>
>         (i915#11151 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/11151> / i915#7828 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/7828>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-
>         fast.html> (i915#11151 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/11151> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html> (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/11151> / i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#7828 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +3 other
>         tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_content_protection@dp-mst-
>         type-1.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#15330 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330> /
>         i915#3116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3116>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-2/igt@kms_content_protection@dp-mst-
>         type-1.html> (i915#15330 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15330> / i915#3116 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-5/igt@kms_content_protection@uevent.html>
>         (i915#15865 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15865>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/
>         igt@kms_content_protection@uevent.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#15865 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15865>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-max-size:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-max-
>         size.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/3555>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-rkl-6/igt@kms_cursor_crc@cursor-
>         onscreen-max-size.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x512:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-8/igt@kms_cursor_crc@cursor-
>         random-512x512.html> (i915#13049 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html> (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13049> / i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-
>         movement-32x32.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-
>         movement-32x32.html> (i915#3555 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_feature_discovery@psr2.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#658 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/658>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-rkl-8/
>         igt@kms_feature_discovery@psr2.html> (i915#658 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#9934 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9934>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-8/igt@kms_flip@2x-
>         flip-vs-dpms.html> (i915#9934 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/9934>)
>   *
> 
>     igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-4/igt@kms_flip@2x-modeset-vs-vblank-
>         race.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9934>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-rkl-6/igt@kms_flip@2x-modeset-vs-
>         vblank-race.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#9934 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +3 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>     upscaling:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>         upscaling.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#15643 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-
>         to-32bpp-4tiledg2rcccs-upscaling.html> (i915#15643 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>) +1 other
>         test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-
>         ytile-to-32bpp-ytileccs-downscaling.html> (i915#15643 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytileccs-downscaling.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#15643 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15643>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-cur-indfb-draw-blt.html> (i915#1825 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-
>         draw-blt.html> (i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#1825 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +15 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-
>         primscrn-shrfb-pgflip-blt.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-6/
>         igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-
>         blt.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544>) +29 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
> 
>       o shard-dg2: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-
>         rgb565-draw-render.html> (i915#10433 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> /
>         i915#15102 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15102> / i915#3458 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3458>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-dg2-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html>
>         (i915#15102 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15102> / i915#3458 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3458>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-
>     pwrite:
> 
>       o shard-dg1: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg1-18/
>         igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-
>         draw-pwrite.html> (i915#15102 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/15102> / i915#4423 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-
>         indfb-draw-pwrite.html> (i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-
>     pwrite:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/
>         igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-
>         draw-pwrite.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-
>         shrfb-draw-pwrite.html> (i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>) +6 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-
>         primscrn-indfb-plflip-blt.html> (i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102> /
>         i915#3023 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3023>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-
>         primscrn-indfb-plflip-blt.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#15102 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15102> / i915#3023 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3023>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-rte:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-
>         rte.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544> / i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102> /
>         i915#3023 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3023>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-
>         rte.html> (i915#15102 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/15102> / i915#3023 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>) +5 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-
>         scndscrn-indfb-plflip-blt.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1825>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-
>         scndscrn-indfb-plflip-blt.html> (i915#1825 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +9 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-
>         rgb101010-draw-blt.html> (i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-6/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-
>         blt.html> (i915#14544 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/14544> / i915#15102 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>) +12
>         other tests skip
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_hdr@invalid-hdr.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3555 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3555> / i915#8228 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-7/igt@kms_hdr@invalid-hdr.html> (i915#16012 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/8228>)
>   *
> 
>     igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-2-xrgb2101010:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-
>         a-2-xrgb2101010.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#16025 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/16025>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-
>         a-2-xrgb2101010.html> (i915#16012 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>) +1 other
>         test skip
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-
>         ultra-joiner.html> (i915#15458 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/15458>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-6/
>         igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#15458 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15458>) +1 other test skip
>   *
> 
>     igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-
>         ccs-modifier.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#15709 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html>
>         (i915#15709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15709>)
>   *
> 
>     igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-8/igt@kms_plane@pixel-format-yf-tiled-
>         ccs-modifier.html> (i915#15709 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/15709>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-6/
>         igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#15709 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15709>) +1 other test skip
>   *
> 
>     igt@kms_pm_backlight@basic-brightness:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_pm_backlight@basic-
>         brightness.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#5354 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-8/igt@kms_pm_backlight@basic-brightness.html> (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>   *
> 
>     igt@kms_pm_dc@dc9-dpms:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html>
>         (i915#15739 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/15739>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#15739 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15739>)
>   *
> 
>     igt@kms_pm_lpsp@kms-lpsp:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#3828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3828>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#9340 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9340>)
>       o shard-dg1: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-dg1-19/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#9340 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9340>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#3828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3828>)
>   *
> 
>     igt@kms_prime@basic-crc-hybrid:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#6524 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/6524>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-8/
>         igt@kms_prime@basic-crc-hybrid.html> (i915#6524 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-
>         move-continuous-exceed-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-
>         exceed-sf.html> (i915#11520 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/11520> / i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>) +3 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-
>         continuous-exceed-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_15131/shard-rkl-8/igt@kms_psr2_sf@psr2-cursor-plane-
>         move-continuous-exceed-sf.html> (i915#11520 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +2 other
>         tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-cursor-plane-move:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-7/igt@kms_psr@fbc-psr-cursor-plane-
>         move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/1072> / i915#9732 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-6/igt@kms_psr@fbc-psr-cursor-plane-move.html> (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> /
>         i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#9732 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/9732>) +7 other tests skip
>   *
> 
>     igt@kms_psr@psr-sprite-plane-move:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html>
>         (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/1072> / i915#14544 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/14544> / i915#9732 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-3/igt@kms_psr@psr-sprite-plane-move.html> (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> /
>         i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9732>) +4 other tests skip
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-vrr:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-
>         vrr.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9906>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-rkl-6/igt@kms_vrr@seamless-rr-
>         switch-vrr.html> (i915#14544 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/14544> / i915#9906 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-8/igt@perf@gen8-unprivileged-single-ctx-
>         counters.html> (i915#2436 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2436>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-rkl-6/igt@perf@gen8-
>         unprivileged-single-ctx-counters.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#2436 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2436>)
>   *
> 
>     igt@perf_pmu@module-unload:
> 
>       o shard-tglu: ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-tglu-3/igt@perf_pmu@module-unload.html>
>         (i915#13029 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13029> / i915#15778 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/15778>) -> ABORT <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_15131/shard-tglu-10/
>         igt@perf_pmu@module-unload.html> (i915#15778 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778>)
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-6/igt@prime_vgem@basic-read.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3291 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3291> / i915#3708 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15131/shard-
>         rkl-7/igt@prime_vgem@basic-read.html> (i915#3291 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> /
>         i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3708>)
>   *
> 
>     igt@prime_vgem@fence-read-hang:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-5/igt@prime_vgem@fence-read-hang.html>
>         (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/3708>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_15131/shard-rkl-6/igt@prime_vgem@fence-read-hang.html>
>         (i915#14544 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/14544> / i915#3708 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3708>)
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>       o shard-rkl: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_18447/shard-rkl-7/igt@sriov_basic@enable-vfs-bind-unbind-
>         each.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/9917>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_15131/shard-rkl-6/igt@sriov_basic@enable-vfs-
>         bind-unbind-each.html> (i915#14544 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544> /
>         i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/9917>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8899 -> IGTPW_15131
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_18447: 302d234f6c7a763bdf7ca8b1c40e02fa1efec5e4 @ git:// 
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_15131: 12d52f3bb14e763cb1d5ede418f1a57758a99e8f @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git:// 
> anongit.freedesktop.org/piglit
> 

