Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A39C982C1
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 06:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DFA10E41F;
	Thu, 17 Sep 2026 06:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EOG7D05/";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A499910E41F
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 06:25:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQbrzep3vpBFMAcF3z0jGWhY6PERkOyQsu96D2Q5FEF3XCRwudE2Irq9D4IfHOVmt/f8/pubHeNnlw9Pad4FqKT/BQMzvxto8UkKYb8p2eIKpnO1FFeOhtNgMvdsqS9xyQi5wuww5ASMZRzHXSKu7ANrszvmuHQbS1zXq3jQf65RQSuaPx8XcpFormTfH4qWGmDAr6PTDXNoNTF/8Cd9R3PmeV/SNRDfAA8eHu/C7J4Q5t2eoIXMtww608vUaVJOD9EJxO1KNiLXA//nCIDcyE0YqEs/14wVdp4Lwo7GZbGOQrDtGbppytOwHFMUJp/ethAPfjESf4q+S0zYNQatZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7/q7uJTZxP1w3FobIo85Y4j6yFN2QGVGI7fnHVPKQE=;
 b=w32Eeu/Jr0a6U9Y99DmmzwIihykUhYEofOIw+qjxWmJVXhYF6CkweKLkhkFg76wAqC4CnhyIilG3VjUL5aJ1s8m9hMuMTLZIk3ZQnwlW42raSIMrSZyGHfTsxEHeEmB9j1sdSC/GhTHilEzmr8TOfR0U+zdoJRWZSlstvE/ZFAfxTsRcVJ2XYPwXMX1+XZnG/xlIZKXzRN2tNVLenkwzoCv1z6aPxeTCncJvOxB0h92iK69CF7NyI7XQoYElmqtnssIwANA5NNlAFr1qlsdN6v/5vqEQTw3aFxzY9vMGDEdcwe4lDXs4gQcmczCY38miE1xb+aAJMDm++GJp+E5PgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7/q7uJTZxP1w3FobIo85Y4j6yFN2QGVGI7fnHVPKQE=;
 b=EOG7D05/j26/DjsIKxkoQciX89RKwT6AuTiifJ5w3AqWJBKoiB2jf0H5ZxFRuWUb9Kv9vr7F4PXBekdxI0GRALJI1ljgftMJqCBoKkGjhyyhVH6kHi6XM+ANPpO1sv/OQphZc525qQl/tabPdF+fXxtC4QZ8R4+hlE6ClMiInKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB9189.namprd12.prod.outlook.com (2603:10b6:a03:55b::15)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Thu, 17 Sep
 2026 06:25:26 +0000
Received: from SJ2PR12MB9189.namprd12.prod.outlook.com
 ([fe80::7923:8cd0:a2d8:ac7e]) by SJ2PR12MB9189.namprd12.prod.outlook.com
 ([fe80::7923:8cd0:a2d8:ac7e%4]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 06:25:26 +0000
Message-ID: <5f3e4b6c-3d0e-4164-b772-e25e7a800df3@amd.com>
Date: Thu, 17 Sep 2026 14:25:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Revert "tests/kms_plane_alpha_blend: Skip 7efc
 alpha-swap CRC check on AMD at >8bpc/DSC"
To: James Lin <PingLei.Lin@amd.com>, igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, sunpeng.li@amd.com
References: <20260913131359.2314079-1-PingLei.Lin@amd.com>
Content-Language: en-US
From: "Chung, ChiaHsuan (Tom)" <chiahsuan.chung@amd.com>
In-Reply-To: <20260913131359.2314079-1-PingLei.Lin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:405:370::19) To SJ2PR12MB9189.namprd12.prod.outlook.com
 (2603:10b6:a03:55b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9189:EE_|SJ2PR12MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 666e4b95-708a-4f55-24e1-08df14847650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|3023799007|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: zeTiBCk73/Q5lVJDrk9kreNMy5WjEvGKMNuTVYFrritCZDy9b2ez5neuS1IsH3GH6412Tjgoqv+DfDpyqpE6TcmgQhxkl+e0vi7OCwdAkt1IEOtRmy59+3yoXy5AnMgeQhWKgV8TE8uYEtHTG7oeMHSsUMNW66dPgh0SCAedqqhRHc+SeM3HwzVpTt2pVI4ud48x8fMSHn2zsbALysx96lf2Q2Fl7wL0S8TzoGk4JgdwyUeFa68k+6rertIYJpzLhOrfVEEIJG2aUQbeSCsoFuZgKar4wkZha8bXciM9nKi1u6JZoXfs79dB6Li//bJrQ9dvQ0iEfPE7NB5esM0Fh0nj17V3cdF662V2UY71MiB3ntOmXigHJygNW/1FiiaRi6HdNegdRL8NmJQzZprueTARyjw6hEkZ8ulPKnfyE+ehgaPaG8aGPujA8+Q/l0xd8j/VFK5ezdenhmoEw0jdCTvMzm/y1WlbliMg5pn/SVtq+iYKQu440Ftx4fO2nd0uZ7cpUQ3A9i3z0QxJqB2jFwHwMhVcHJQf4gBN7gxtfr3iAgx53rXSeKxDkE3RJouHqQDyex1lrNWy/0TX0T2lV5TRTGiUyJR9xRkZqRM/KxDQ7tVaCsixFvUsv2B69oNYUN1eQD2Tt4/3jUohyrrfohhve6aD1JLiH1AfhSC5xN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9189.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHBXYmcyV0t6WG0vWmxaSUZETmNNRldsWlNuUTZWS216UzZFd29SWTczc2FC?=
 =?utf-8?B?bFdRRkZDeFNrbXR3Q1FoTlU3WVBHR2tlVy9paUpScUo1MHBZQm1xcGVNUjhJ?=
 =?utf-8?B?OTdZMVBDTzZ5dHpEdXRub1RSdmZIck44VTY0YnlrVzFZbkdLZDI3RkpmVW5K?=
 =?utf-8?B?b3FZK2orN3hxQU4zMTNCYUFQWVNnNjVkV1NMN0hkQjJrMHBWWkV0QlJnc25o?=
 =?utf-8?B?bGdoaXo5V2FkOFQxWHZlRC9HK2pOSFlvaTc0OVlSWmQvajJmNnZLdnEwcXJP?=
 =?utf-8?B?UjRFVnE2KzkzZ2lGSE1uYzRVVU52UVN2Zm1ubXpmanpjRW02NlN0OWI0eTNa?=
 =?utf-8?B?eldWQW1hVmtONmdFSGdxbFRIMjhpNmhibFdkMk9ld25MTWRDMG9BeUx6N0Zr?=
 =?utf-8?B?dVFKU25udVk2MXVWTXVJWk5KSEVMK0NZTmJLVmpCWDlYaXA5TktTdVY3elVB?=
 =?utf-8?B?NXpMeEc2T2JuSmpRL2ZUazJtSm1HdlhMRzVkY3llMGF1d2xPRFZXNURnVmVr?=
 =?utf-8?B?dTcrMVYvamp2WFhwOEZPRmNIa3BTNUwzTHljOS8wQkhjaXRKcFlOMWRrY1R3?=
 =?utf-8?B?ajJLcEtWUkhoZFhSdTRRS0NjQ3N0NXkrL05ncHBtQXdzaWlHM1NsNjdicUNi?=
 =?utf-8?B?V003dkY2RW54d3BLMWVCZHh3L05idURTMFM2U1hodHNGMEpaNVJLWFA5em96?=
 =?utf-8?B?cDVnTXFuYzdMc3FOSTY4Q3NqZWtkZU9PNUZpN0J0OTNPa3dnRStlNXpkTjBO?=
 =?utf-8?B?MktIVGllUjAxTDlXdncwdHgzSlJSS0wzN3NXU0ZORGIva2RiUVVXa1pRUnV0?=
 =?utf-8?B?azduY2ROcDZ6d0JJMTdhZ21rbHlvUmg5VGZvSUV6S2dpUTFaM3pLMWl1L3FY?=
 =?utf-8?B?N2NrZWplN1JXVUI1WUJBTjFwVGxwVjlvK1hzZW9sVHh2blVHSWI3VUYwWTZ2?=
 =?utf-8?B?eXlDR2xUcXNMeVBUVnh2ZWMxV1dURmlnMDBFU0ZUc1Yza2RkaEVjNmVEN2pV?=
 =?utf-8?B?KzZSSmp0R0sxNXBVYTNpbzF0Y3F1Y3FYTFI2VGt4emdXTWdsNXkxb0lQNHJt?=
 =?utf-8?B?d0IyZFBQelpsaGlLc25uTnhuU3E3Y0x6M2hITHM4S0kxN3N3TzNNQTIrclY3?=
 =?utf-8?B?WnlidHE2TjBaTWg0ZFZHUkRhV2QzVzcwTDVyL2U5Qy8yMGxEaStsMWRmOG9z?=
 =?utf-8?B?SHFianR2M25QUERid3UxcFdQenU1ODZYUEh6LzYvd3E2MFJESkkvcTkyRXA4?=
 =?utf-8?B?YmE2RHVFcmNSUUsyU1JRR2hkeWRtaFBQWHlSbEhNM1Y4anZVYjhCZDFkYkZT?=
 =?utf-8?B?WVd6THhxVm1DT2Z4ZmFBSU44STlNTDB6ZlE4R1NVNVJVMHR4SWU2MERiR0M2?=
 =?utf-8?B?ZS9iT1RtMHJQNlo0QXJUVzA0bHNiSHZzZEpuaGpleUxmcEU5QVhid1RRY292?=
 =?utf-8?B?dktkanpkZ1UyTmUxTDBhOVJOYzVSMVhrWFlYL3RIdHNyZHVSMStDbmpvR254?=
 =?utf-8?B?UW9Wbkk4Z0tiYlhveGQwQlAvUDdKQW5NNjd0R3JiRE01a1cyT1JWWlE2cElI?=
 =?utf-8?B?NjJjU0NXeXc3MWdwYyszN1cwNzJrbXNmUHh2bnB6b2ppbGk1UjVLVTBMeW5r?=
 =?utf-8?B?b202L1BNY0xWcDdtTEZqMXJOd2ZOeHY1bThjb0JqQ3ZFelNLcHYxWERSWXg2?=
 =?utf-8?B?akx0WW9DM1hCc0hyM05iMHhkaXNSelVYOGY0Uys1TERCRXl1bFVaZ3c2SzE5?=
 =?utf-8?B?YURINGtobXVIK2cwSUFEQVNoK2RRKzJSamYvZlllSVVYZnI3NndKVzY4VTZC?=
 =?utf-8?B?dGt3MEljOHlQZTM4L2NFRFczU0NZVGU1dTdWRllzb01kNGxXbHNCdmVCVUZO?=
 =?utf-8?B?aTFqWmlwSk9Senp3RzdDbTFZRGxEbHhqM0g0UVhBYnFOWGV5T1NZWDA2ek1a?=
 =?utf-8?B?bUMydkZFY2w5dkhNSmdLVkdNK3g5KzFtNkhSTEh3R2NiYndlZy9raHpDZXpa?=
 =?utf-8?B?bjBRZHZ4cFhhK2JGc1dSb1pPam80d20vaUtUeWhOT0Q4dFU4T2lVL0kxSE1l?=
 =?utf-8?B?MVUvYkRKRGtta2tBUHJvOVFtc0dsSGcrcFlYWWYvYUhvTGhwQWhkUjgwSDZJ?=
 =?utf-8?B?ZkJHRDZLWE54OGlLL1RZYmlEd0VCbGxUUnIvcTZFcHlNZFJTaUcxMjN6YTcz?=
 =?utf-8?B?OG4zSVJEQ3RCRXVxVkM1R00xWFprMDJ2UEwvc2orb1FWclhoWjhUM2EreElu?=
 =?utf-8?B?L2ZtRjN1ekI5b2FicVZZQkFteFc2V2tLOWh5c1dYYTlVWU5FVHQ3dmpiSlNy?=
 =?utf-8?B?L0d2dm5jcWswMmRLNjVGdTQwbUtxblRqNHJWb3I2QXFOZTlKZTludz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666e4b95-708a-4f55-24e1-08df14847650
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 06:25:26.5622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kc4QMuKNlwjnfwRcJEcjSjeTTYZDKsZ7hg6Oq6ud9un5gmwkvCwqrgxq5BA35JGtOJ8uxCY85cvTBUUek8K3pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884
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

Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>

On 9/13/2026 9:13 PM, James Lin wrote:
> [Why & how]
> Causes some gfx subtests that previously passed to become SKIP.
> Root cause needs further investigation.
>
> This reverts commit 4a6a59f314f61e1e4156bb13a65efabee31a76fc.
>
> Signed-off-by: James Lin <PingLei.Lin@amd.com>
> ---
>   tests/kms_plane_alpha_blend.c | 44 -----------------------------------
>   1 file changed, 44 deletions(-)
>
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index e040d5bec..3a2649833 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -33,7 +33,6 @@
>    */
>   
>   #include "igt.h"
> -#include "igt_amd.h"
>   
>   /**
>    * SUBTEST: alpha-%s
> @@ -78,7 +77,6 @@ typedef struct {
>   	struct igt_fb xrgb_fb, argb_fb_0, argb_fb_cov_0, argb_fb_7e, argb_fb_cov_7e, argb_fb_fc, argb_fb_cov_fc, argb_fb_100, black_fb, gray_fb;
>   	igt_crc_t ref_crc;
>   	igt_pipe_crc_t *pipe_crc;
> -	igt_output_t *output;
>   } data_t;
>   
>   static bool in_simulation;
> @@ -444,49 +442,11 @@ static void constant_alpha_max(data_t *data, igt_crtc_t *crtc,
>   	igt_plane_set_fb(plane, NULL);
>   }
>   
> -/*
> - * The 7e/fc subtests (alpha-7efc, coverage-7efc) assert that swapping the
> - * plane global alpha with the per-pixel fb alpha (0x7e <-> 0xfc) yields a
> - * bit-identical pipe CRC. That identity only holds when the whole blend
> - * datapath collapses to exact 8-bit arithmetic.
> - *
> - * On AMD DCN the alpha/gain values are 8-bit, but the blend itself is carried
> - * at higher internal precision and only quantized down to the output bpc at
> - * the very end, so the swap can leave a sub-LSB residue. At 8 bpc the output
> - * quantization discards it and the two CRCs match; at >8 bpc, or when the
> - * stream is DSC-compressed (carried at its native >8 bpc), the residue is
> - * retained and the CRCs differ. This matches observation: the same test
> - * PASSes on an 8 bpc eDP link without DSC and FAILs on an eDP link brought
> - * up with DSC.
> - *
> - * So keep the strict bit-exact check everywhere except AMD at >8 bpc or with
> - * DSC active, where the swap is legitimately not bit-exact.
> - */
> -static void skip_if_alpha_swap_not_exact(data_t *data, igt_crtc_t *crtc)
> -{
> -	unsigned int bpc;
> -	bool dsc;
> -
> -	if (!is_amdgpu_device(data->gfx_fd))
> -		return;
> -
> -	bpc = igt_get_crtc_current_bpc(crtc);
> -	dsc = data->output &&
> -	      is_dp_dsc_supported(data->gfx_fd, data->output->name) &&
> -	      igt_amd_read_dsc_clock_status(data->gfx_fd, data->output->name) > 0;
> -
> -	igt_skip_on_f(bpc > 8 || dsc,
> -		      "plane-alpha/fb-alpha swap is not bit-exact on AMD DCN "
> -		      "at >8bpc/DSC (bpc=%u, dsc=%d)\n", bpc, dsc);
> -}
> -
>   static void alpha_7efc(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_crc_t ref_crc = {}, crc = {};
>   
> -	skip_if_alpha_swap_not_exact(data, crtc);
> -
>   	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
>   		igt_plane_set_fb(igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY),
>   				 &data->gray_fb);
> @@ -515,8 +475,6 @@ static void coverage_7efc(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
>   	igt_display_t *display = &data->display;
>   	igt_crc_t ref_crc = {}, crc = {};
>   
> -	skip_if_alpha_swap_not_exact(data, crtc);
> -
>   	igt_require(igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage"));
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   	igt_pipe_crc_start(data->pipe_crc);
> @@ -581,8 +539,6 @@ static void run_test_on_crtc_planes(data_t *data, igt_crtc_t *crtc,
>   	int first_plane = -1;
>   	int last_plane = -1;
>   
> -	data->output = output;
> -
>   	for_each_plane_on_crtc(crtc, plane) {
>   		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
>   			continue;
