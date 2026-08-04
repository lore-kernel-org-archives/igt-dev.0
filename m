Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51782C55182
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 02:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD1110E0D1;
	Tue,  4 Aug 2026 02:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Uk/WPoka";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011037.outbound.protection.outlook.com
 [40.93.194.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856A310E0D1
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 02:53:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9XLOIOcY/kSreYFFetYIwqB2Xe8gLHSFUFP9E3pcXWIxjotIol9bP7Uj+PgOTo82/Cbw3KmPVPXSr9qN7Sl1LGVOjUPRIP+eZxFivuK9cGw+DIY9S77jsGMtF5/kDfQsOePWJOjvrhHlponfW/0dJBw+fs/NtdZsg8Zkpc3ItrIFYSFhvbOa0GDXS8M3Sym3/TpU8ZYZ9+e+jYqAIJcEYtmNpKxdeT7lJikE4hiudt3B3buQ32msp42PVb1SoqQ4SuM3Af0/y/RJGklmu51Xxq7VudY3xo0iEjgqE4rTh4Z1Bojeu1w6JZPJC+1lV/BxmSGDwjj5tisFEeE+NrrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFI79GAThvY0kGx7be0RhXWLgZ8n7Ia7/AlFf8VhgIk=;
 b=bYg1RNRo+A/vjGAePHDNGF/aXvy5q9VMQe3SihmhYe4JfPpa3CAmZ48arKOzVohFSiwsMZwOYJyZWHMpPN+g9l/1tUPDX+3AgNdspk/+gGdQB936MXNhcVRGGWVckVnWyvXKwJb30dWgsG1q0g/toBTaTwi7tnc0pPzFTw+v4/AtpI89a/UR4FSER0FDwgPoVxZ6KPHLIZ1EOTUD7HlkqXxOed1/OmATNwC3y/QabVZIZa40tizonZAzX97nj+8AQwlXwkA/hC7JhIj4WzpZ60kVRKGyUiDflXL08QOtmaaLN3t9mouLelHs37h5Xsko7YznftvgRXheIRT46IwWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFI79GAThvY0kGx7be0RhXWLgZ8n7Ia7/AlFf8VhgIk=;
 b=Uk/WPokaVOu59S9vw/mz5/EPFdtAcGhbuUjtsrH0ImIz/bu8aPsXVM5tjCFFJ8bQjKfo340Jmg07JbebzWYMU5BAWGOUmL+nNCH7i1l7w/en995lRkWbC5/oURgRbAzrQ5jd2pMXykiSDw0wg8617da4vxA7FSMPPHNz3Mgc8ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB9189.namprd12.prod.outlook.com (2603:10b6:a03:55b::15)
 by MW4PR12MB7360.namprd12.prod.outlook.com (2603:10b6:303:21a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 02:53:47 +0000
Received: from SJ2PR12MB9189.namprd12.prod.outlook.com
 ([fe80::7923:8cd0:a2d8:ac7e]) by SJ2PR12MB9189.namprd12.prod.outlook.com
 ([fe80::7923:8cd0:a2d8:ac7e%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 02:53:47 +0000
Message-ID: <1ba157c1-eeb7-40f4-82de-b900e2de7701@amd.com>
Date: Tue, 4 Aug 2026 10:53:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_cursor_overlay: reset primary
 position for reference frame
To: James Lin <PingLei.Lin@amd.com>, igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, sunpeng.li@amd.com
References: <20260730125740.110354-1-PingLei.Lin@amd.com>
Content-Language: en-US
From: Tom Chung <chiahsuan.chung@amd.com>
In-Reply-To: <20260730125740.110354-1-PingLei.Lin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::18) To SJ2PR12MB9189.namprd12.prod.outlook.com
 (2603:10b6:a03:55b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9189:EE_|MW4PR12MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd497ff-3593-446d-3355-08def1d39ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: azB2yil6CgDdwL1HRWdOjvf/944aTUm8+fVGJWC8ts1KMD67RkwLNMlJ510ZIg4hC/PJfKDxQdRo/jf7BwdNCLpdt/XktJqkb/dz84IRerrqfy9fUV41UBk+wIaRbthZCklb+oZB8NKXqY7lVhcNPBSRuasj/QxN4nHB83VZeKtwGK/vTQ/7oUDVIcWWHeXj6jQ0ug2c86un6gc2ANWk7fGQ0/5g+DdPco5dMdj034M2DeU73b1aWqMJcw2+qwRlVoFb9e3VxWeIyCOWcHSNdfaGIKRAG17sbGc0a5RsmeRbAK4SogOLvFKel7r21juta5JnTz//kYpXDlW0P9w/jGO1t659pkY9czgBVnRJzmohwJau1g+OcmRC4fm82kItOm94YNFUZMEhmFXH5aGZ4woNx8did3o0e/kSK0mlrsVmet5kAKwBfTphzhuRHIwT4g6Qe2uJ555QSEehC3XtJcHIdgPy+ZVnEUztWiCwsbFowQXCsQWwpda9DL7pG3JFLMIFhL7R/hsNk/taZTUnI7x9/nsWpetEfB/7qEJA3+9MyzcXKxEzdJGwD1N9NO2PyQ3JmjRpGDXathbytC6DkSj2/rY4KUrfUmwo/sJXS+8ytiLgA7owI4gwrgRWMea1BC5O3TF8mE7mNikAD8rn4QYdBkYkmWWeqjEteBnnh/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9189.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3U1VmxLZFAwYmxYYUQ2b0xTVWxJVGtXUFRHTDREU2FyQXIxanZhb01XMUc0?=
 =?utf-8?B?cVU5RjhpT21CZFV2SnVmZWpDSEhQTVZ6TnRHSU1uTGQwU0k0MDExbTFoU2VN?=
 =?utf-8?B?UDhHVHJLd0ErUGNZb1UxcEt6M0FKYmIvTHR3eEdDZjgwQm9GVG4yNDJyK3ow?=
 =?utf-8?B?dGE1WHpYSWNZekViTkVjUzNoZ3hNdzJ2WlZNcWJlakFHRFdRY093MjFFTS9H?=
 =?utf-8?B?YTZoWHVFeitjTGxnMnBINVZjZC9VSXpqbVZ2RlJ5MTZkQXFYM1hrUWVkRmhm?=
 =?utf-8?B?cWFvS1c1R3MxTnY0S2o4VkozZG91djI1KytGTnU4NldKUVo5dHRRRFNHVHpV?=
 =?utf-8?B?Q0VWMnRoTXBhb1dVeU9ERUxJajVoR09ROHNndnIzNWdTRDMvZ2pUQ1c1RUlQ?=
 =?utf-8?B?STlSUUVDYzdhVGFPMkd6SFpabm9xVURJSVY5WXlGRnY4WTlQZEY2djNYSjc3?=
 =?utf-8?B?NjNVY09iL25JTm12RVlJVmVUd0xIYkw4dEpyMFN1YjFMblhEU1llSmFYZGhZ?=
 =?utf-8?B?bmZtbFVaTktyU2ZzUzFOdnBkblJEazR3RHVsNVRVV21WZE5wMGdKQUVBalpS?=
 =?utf-8?B?d3F6WU11ajJPcVRlZ05NNzgrU0lFS2pwcHdodlpiQTlsRW1QQkdUQ0t4Uks3?=
 =?utf-8?B?Z3ZPYWprY0NGb0hiRmRxdXFvblZrYWx6ZHQxdFlDc0dYVXAxQ29saVhTZnRW?=
 =?utf-8?B?T2RXV0NmUWoyRENqdW1BL0RLVWlRSlZLZDVxSXJzejJ4b0pZWStTQmZSNU12?=
 =?utf-8?B?UDFKZU1NOHN0ZVU3cG5oNU1VNVoxUGtNbG9jWEowODVvRzBNd2Q0TmxIU2V4?=
 =?utf-8?B?bVJOUG1zR2FVVHR2aG5abWZ3elBFbkdjQzNFbDViWXRTVnQ4SkpBNitheHJm?=
 =?utf-8?B?dEgwWVBSMWJJUExBSW8walM0cVpTTGVNSkZvMnRzcmtRdk5RNVRTS2xzb1hZ?=
 =?utf-8?B?c0E4YkswbmR1MVJoMTNyc0NxQVBUdXdJYlRNK2dyb0JrUE94K2J1N3Z4dENt?=
 =?utf-8?B?Z1d3Y09acERFd2MrWmdyT1RYbzVqclJQRStYWGNtSmxvbGJOYm5iQmdUcW9J?=
 =?utf-8?B?QWtZRU54d2hBREtxQVl3UjhKNlpwRGIwS0JXaXFZODFDZi9DQklRNWh1NzMw?=
 =?utf-8?B?OGZnVnRCTFRnaHFqbTRQMStLV1NBcTNPcGhlczZ2K0NRUnBKT1I0K1RrTDJK?=
 =?utf-8?B?VUhJcFNWMVVXWVhtdkE4bVdTdjU5NytTbkdoZjFWMHJPbXJob1p0cTVEcUdv?=
 =?utf-8?B?a0E2WDI2NjNaM2lnWkcySC8wbDRkS0pXaldCSjNKa3pwZEJxeFduYytFQ3BK?=
 =?utf-8?B?SlM5RWN1aEtUdElJSUJBU2Rha3ZJTGg5cW5XSnF6UXczbWV6UldjNGpUVTh3?=
 =?utf-8?B?UHY1R0trdEN2UHVWTU1NUHYwb2l5SGM0NUoxR0U1MGVsMUhuWGw0MklxNS9o?=
 =?utf-8?B?aEk2eEY3bnY0Smpaay9rV2oxQTJzM011TUI1aVNWKzVnRGs3NW1sODRDWGhz?=
 =?utf-8?B?V1lidm12ajVsNFdjaUJiRUZQYXU5aGx1MXJJUHBZbHdVVmlVRFlDZTMwb2JI?=
 =?utf-8?B?bllBS1ZFamxKWkY0a1JkWXV6bUcwQmpPMFhoTjZYNEsyZU53YlRIazFpOXJZ?=
 =?utf-8?B?Z1NwbEQzNm9YQ3JXcUYrc29XYlhaTVlHT1Z1ektvbHptUXhmeERqMFdhODFZ?=
 =?utf-8?B?QUpZVURtMVZmOS95Uk5NdjIwNmIweHM1VVFpWXI2Rzkwd2krWUhVc0ZacGxk?=
 =?utf-8?B?a1JyTWZIUVlCVnpmQU96UGRvblVtSkU3TEJ3cm03MVp0RFU5dkdEckZrckFX?=
 =?utf-8?B?TmJtNGxnUy9UZWlXaXVaMkRVcnFPZkU4b0J5eENvRUZjU05laEQ0QVdIWTJa?=
 =?utf-8?B?bUcvVFRvb0NNUllsQ3ZsbnpEb1p5QUZRZ1BlQjVGWFM0Mko4Nk55eklxUDY2?=
 =?utf-8?B?ZWpxNTFkUWdic2ZLZjNUNEhCSTVWRjZlc3JWWVhhQzNtYkFJOWh6TFVtaS9y?=
 =?utf-8?B?dDRkSGVZMGs0dTRkbVM4dGp0am1BeVIySkR3UURreTF6MUxic2s1RkRHQnpY?=
 =?utf-8?B?RHFadzRyRlI3c2Z4dENYbmN2NzVpNmZybE91MURpcTlLeU9qSm5ON1dzLzRu?=
 =?utf-8?B?QzhtRjh1cFY5MnY1R29mdHdWbUdYK3dnVGZNcVFBazJJZTlXbGVYdE5JbDgv?=
 =?utf-8?B?L2hHQlJsRkhyMk1tdTRUQUIzcWVxR2FlN1Vhak9wenE3S3JIVzhnSVpOd1ND?=
 =?utf-8?B?VER3YlVubGdjaVRLUXF4eG9vN2pBQnlseFFLelRhUTJKczBlRDNEVW5wU0FY?=
 =?utf-8?B?N0U0QlBaMnZJTEVkdGsrNlZoSW5VNldSZ1ZRaHBJaDhHbzhxL2VMdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd497ff-3593-446d-3355-08def1d39ac4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 02:53:47.2721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D0lGNR4INlFSA5U9qP3/F0qNcR7chGUdh7H61Vfc/YnpvKOyVljfyYVcE5Mx85ej6vZ+Ip08E1JOihf9AbB1Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7360
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

On 7/30/2026 8:57 PM, James Lin wrote:
> [Why]
> test_cursor_pos() reuses the primary plane across cursor positions. The
> TEST_QUARTER_FB path repositions the primary to an opposite quarter of the
> screen (opp_x, opp_y). On the next iteration the reference frame reprograms
> the full-size framebuffer with igt_plane_set_fb(), which resets the plane
> size but NOT its CRTC position, so the "full-screen" reference primary keeps
> the stale quarter offset and therefore no longer covers the CRTC.
>
> On DCN4x the cursor falls back to overlay mode whenever the top plane does
> not fill the CRTC. With the stale offset the reference frame is composited
> with an overlay cursor instead of a native one, which renders differently
> from the settled frame and produces a stable CRC mismatch against the test
> frame (only the first position, where the primary is still at the origin,
> happens to pass).
>
> [How]
> Explicitly reset the primary plane position to (0,0) for the reference
> frame so it actually covers the CRTC, matching the test's intent.
>
> Signed-off-by: James Lin <PingLei.Lin@amd.com>
> ---
>   tests/amdgpu/amd_cursor_overlay.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
> index 41c9905b8..b130da4ff 100644
> --- a/tests/amdgpu/amd_cursor_overlay.c
> +++ b/tests/amdgpu/amd_cursor_overlay.c
> @@ -214,6 +214,7 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
>   	cr = igt_get_cairo_ctx(rgb_fb->fd, rgb_fb);
>   
>   	igt_plane_set_fb(data->primary, rgb_fb);
> +	igt_plane_set_position(data->primary, 0, 0);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   	igt_paint_color(cr, 0, 0, rgb_fb->width, rgb_fb->height, 0.0, 0.0, 0.0);
