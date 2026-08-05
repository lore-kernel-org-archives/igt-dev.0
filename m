Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B59C55174
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 19:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F27E10E0FB;
	Wed,  5 Aug 2026 19:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="46hfqDGn";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010069.outbound.protection.outlook.com [52.101.85.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A20810EFC2
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 19:15:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nv8eY2Nwqi/auRXhDOnvetKqFJKyjiaFUeGt1gLPTrJSiw9SANeIRQCJBn8CQHhvSQLBR9tYg/LBm7lNs4+pOjY9I1prJeijOupSRUcVJ7tgXGkHVoDldiwICtwzIKkmVDJDbXpyTLtdk0+wGp0U1xIwiBtL414axdH5VkbSSTat0o6rffyzlsz4WhBUXYfZ9athzlpgygA6I+b1hwn7M316KefxZDLr2YHsr97H798rAJejYHm7eB0GBx7UKPv5Awfz/TKyTxwtm8fdc5hCLPXFWDWoBb/tNszl7Cp3LAFOiT2ZWHBa3EtvhSxy1NAIyaODvNbPG39N7hOcVW5MMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zb9jiWMgLRVW2qYwBc3JUHccl4PdJ9q3AXjHMAsQ5vo=;
 b=Vzv1W4J/WxT78OFoZsWG39LvwoUKpv9tD+Pbxlgw4emkdayjesxKJIb6/ttIu7TRMbw+gMIf90wT9+Z3TBXoCrTCpRajsbMnEfGDwez1zgRVkTHGjPlnRXa1SL4CPfQwuXRP1nQ/HSvHsKL9DRNll9nYaFWxg9ZJ9psfdKu1CwaQjp8I9STmjbUMnqmG8bVzeNHsqTeKBc0dvM/ibclLjeV3kBs98dNzMYZIIoxOChgRwvJ0AERDBQuB90yvawYbVedqM9dpZ3QlMKxTMnfw46OtIGe8lJN3N/6zwor9hRZNekSKQDTppI1pM9nwAUIDWytWLFvRTbIJLmKQ8apwzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zb9jiWMgLRVW2qYwBc3JUHccl4PdJ9q3AXjHMAsQ5vo=;
 b=46hfqDGnO0r+Tti88SOwt5fE0UnrPMKC7112ustlRyurSwImzXBF/Ykb34VlNJ1ZiP7whQ9ILN9EVEh0OBuDavPVARRhBfXrctcWAbAbD98axcMVAunWqQJM//hzXLlF+xMCdwavBJZ99R/zzA1KfbT61Em+kIRRZZIh/i6uU3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by CY5PR12MB6576.namprd12.prod.outlook.com (2603:10b6:930:40::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.20; Wed, 5 Aug
 2026 19:15:52 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%5]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 19:15:52 +0000
Message-ID: <cf985f9c-13e6-43cc-9c45-1f4f1cb8ccb6@amd.com>
Date: Wed, 5 Aug 2026 15:15:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/amd_hdmi_compliance: Add ALLM content type toggle
 test
To: Fangzhi Zuo <jerry.zuo@amd.com>, igt-dev@lists.freedesktop.org,
 Alex.Hung@amd.com
References: <20260804194735.1577182-1-jerry.zuo@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260804194735.1577182-1-jerry.zuo@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0085.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::16) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|CY5PR12MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 8276e4d9-40da-4bf1-ef8d-08def325f722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9RZdhfZRCA7eAfXBCLhfKqSK1iRDEsRcqhMgBkjm61MPMjputveHLWGAybabJxfJLW877pgWlboXq5A2vzW5P+SzZQ9YnDDUFCXhJJxVyybFTl0gAOg2jGqABREi5TNZSRWfMC/TZqDoeRTi5N9c5LgPLP+J5JDFQlVo8vZ3cDksNOblMvO77rbZnVK6nzM7ptJRzcx1yfJ1TcZEn8TyAvoYD0aMwII9c5JrqKdXaD3wK1EoCqzGp9JiiQk9C8yhWrExKV4t6B9XsYJTpU56GLQUC2grGdXZPm6B8k3ug5rPrlSDZKEK4DknHmvGBqXt1+seaIx6qXBpWmgDcT+HG3R+pgXexqfRltpFc09IvhW8faialcAEn5/EAvjXH6q1OX1M45KSX3CP72Ucv1zMSaRarYD0ZVHtHrgosPX5c0xEfE1R/gIHW6fMBlPtirrWaYJzUqUaTEKl8805uVtoM4LgJ1jYn9etEWRQpP9l9XRRbhSj7FmcXxeBU5iBP7v6XZIAVq3nMfCpfiKtU8MRhcG7pW8QjPRSUObxhY4r7FYUXULY9v97qd2xiAGIavv0bXZDhP/MKpWNeX88HXcqlKxV7+k7+I4OdOSDWFt1NCMJoqfpRqhXWDfGHG1mjc2td8hM1V1XOwBthiztRY11tpSnP4toh6iiCmzMoJVF/rE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzR0TDl4WlpOMElJQSs2bjNZNHdsdlVjcjkwMTlqZ1VQeVYxTjdPNk1WcjZz?=
 =?utf-8?B?ZEJJcExUSVpHVlpTUUFMcVBKTlpzY3N6amhtcE1wTzlXYkdYVE5jMHdSekZz?=
 =?utf-8?B?VGZ0ZnJQZHZaelRGZGNRWXFvQkJnaVBxY1JxVHJxSE1SVkRqdGdJWW5Jb2tx?=
 =?utf-8?B?TGRFMjZ4SnR2RExRZTZwYURtU2dSNVI2VzNOT2kzNTVVTG0rRGRRL1hqRmJD?=
 =?utf-8?B?enNzNFg1OXY2Z3Bqdnc5eFgxTUNaNzhlTFd0Vmp4KzBhejg5eThoWTJBNnpk?=
 =?utf-8?B?VHhYZUV4N2loSWo2VTh0ZEN1YXNPUlVZNzF0RUd4d2U0WWFBMi9NWGpsWmNH?=
 =?utf-8?B?VkxkTFdmRnVONDZaVGNLZEZhZ1N4bXZkRTdxTnZ3cjdBOWlkZmhFWTd3aUU5?=
 =?utf-8?B?REI1bzBqTjBZZmlYajJ3MnhYR0lveUhNMDR0OW1zLzFscHF4Z1kraGtSWU1m?=
 =?utf-8?B?cHMyZkNxNW1EVWRjU1ZEeWRXREtrMEdEV1hkY0o0aG8wRWZKdkpxUnJ2M0w3?=
 =?utf-8?B?YnFWSnI5NGUrTTNuNDU1b2gyN1hGOEFpanlKNVYzN3haRVJSdi94U0hJY3Mz?=
 =?utf-8?B?YlVSRmdZb2dBMytrNXRSRW9mbkRqM0U1TmZSR29XYWR5TkpCazhmU0lGSXBH?=
 =?utf-8?B?YUxCblZXYVI4WDB1a3o5NEFSZ2JmTGhCN1gwQ2dtTkZJMm53TTdQMXBGTmQy?=
 =?utf-8?B?OVNWMXZ6ZEsyNmFXQkNrVGJ3alZLb05wSFhUREhhNFhWdWFIZXEvc0ZBQUN1?=
 =?utf-8?B?d2tJMjl6UUNneVBaL2pTcVdNb3JwSjJtNW0wL08rN00xZEtKRkdEK0puMzFT?=
 =?utf-8?B?OC8zRHhQQ0lldlVkbGZsUnBKRDAzMTRwZnorZHprdHJpeEY2U2tlWEtXV3Zu?=
 =?utf-8?B?dFI5OXJCLzZ4QUswTFNIRGRHbXRuVUxEbVN6QldYMzVreGVXYnpFS1BJMlZI?=
 =?utf-8?B?eWFTc3dwVTAra2kvMU5yZG4zZ0dWWUxkT25hZlpaVjhicmt0SDVTczh1dnYy?=
 =?utf-8?B?cTNsbWZWM1dPdnd4eGRaUFJ4cnhydmFFMFZkd2NWSWp1UTlDWUlLTmxaajJC?=
 =?utf-8?B?aGVVZkdmWmh5aUw4dDFtMU93bGREMUt6dGxKVFp2ZjhJa0hweTk5QzBxN01y?=
 =?utf-8?B?SUVnNFZwRlo0ZUtiblprVGRKazcxVitMVjJFakRuN2V4Rjg5cjdGQ0lyOXNv?=
 =?utf-8?B?Z0pWZW9iaVQxTnNzQjRQU1RhK2k5SFZXZVFOemErY2xkMzA2aHhDUGY4THZq?=
 =?utf-8?B?bzArczF6NjBJQ3RucUFlYmRSbW9jK2NtSDl6Z0RuU1ZONk1xWmp2Z1JNY3BG?=
 =?utf-8?B?cDFxN0hhclZMMHRzYklETWV0ZUVZODMzUHdkVmlJdC93RFVNZUJwMThybG5r?=
 =?utf-8?B?ZkpObHJKM2ZtRGhXZW9NYytIWnF5a2pRQk1zQjhORThhT0hVd0h1L3dPZVJR?=
 =?utf-8?B?UDFRb21YVXJLRjltL0pPYWVpVzl6U2N2UU96MmI0YTcvN3lyOWZxSk5HenpK?=
 =?utf-8?B?RDRucW5KQjI1eVRKenhFcVZwbVFqbGNoWmM5WXpYK3pYTTY3UG1yR0NCVkdT?=
 =?utf-8?B?QnpRZFdOVUVXMC9vV2tZd1JmYlY5bVBDVVlwR3lJVlJXVWxZVHFQRVJRSlBY?=
 =?utf-8?B?cjdwQTNQTHlyV0JWc0lhTm5hYlRRSmFuRFo5YjVXRDJoc1k0WmxWZ2tOMGpT?=
 =?utf-8?B?cXNBNmFERXM0ZjI1MHVsYWcrRlZ3WklsWGNXRW9FUDkrZHdwdmZXRVFZcGJp?=
 =?utf-8?B?VmducGc0N1F4SkhrRURXVUF4NFlzN3V5ZzFmMndMVUZpSkVHZ28vV1B6aHMw?=
 =?utf-8?B?ZkxLVnhzb2VaaEsyalNyRFpacmxsVGpkQ3ZGVHFkVTdiRVkwWDQvbmdjdDJl?=
 =?utf-8?B?QmR5QVFPSEVYTnBBZEFQejlXRTJWY2VoTkF6S3JiQmVxRFptL2w5MGpkKy8z?=
 =?utf-8?B?WkJVZkRSamUxcnJ3c2NXQ2FBL1RmTlZ3dFd4bmNRUzhBNHJmOVEzZ29TQWwv?=
 =?utf-8?B?d0RyQ2s0ZkgrcXM2bnpHSzd3Z3dPSExiV1F6N2ZEb2VseC9RUUo3L0FoU0tF?=
 =?utf-8?B?L3c0VmJiRmY2SE5rMVFneXpiNXE1aWJXbEUrcHdPRlFJRGM3YmxaYnEyMGh0?=
 =?utf-8?B?Rno5VkpqcTBVbjNUUFhKcnZvdlp4a1A0VW1Ga1RoU2J3Kzg2aC9JYkFpdllp?=
 =?utf-8?B?czYzOFQ1WkFHeGVuOFNmWDZuZklteU5yM1JGQng3b2Uxb20vQUFMZ1FYamhp?=
 =?utf-8?B?d1ZUank2SWZvOGlyYklSQnhXT3BtS0ZaUThBbkxSSW1QcEJzS3c4TlJNVTdE?=
 =?utf-8?B?dUw5Tm9MY2ZtZmtTcnZuT0ZRZFNUeEFKZHZxT25QbFlUcm5BNzJ4QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8276e4d9-40da-4bf1-ef8d-08def325f722
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 19:15:52.0954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaCFER3NuE5OEs+LNFywLCVJPXaqiuLjzlnMvLhF1bibQ2D2R9IJvJJF7+X9G2lWaiwkOIG5G/7rCYvkb01wfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6576
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



On 2026-08-04 15:47, Fangzhi Zuo wrote:
> Add a new '-a' option that exercises HDMI ALLM (HF1-56 steps 14/15) by
> toggling the connector 'content type' property between No Data and Game
> on a live pipe without tearing down the link.
> 
> A full atomic modeset is performed once, then each toggle is first
> attempted as a property-only atomic commit. If the kernel rejects it,
> the change is retried with DRM_MODE_ATOMIC_ALLOW_MODESET. The path taken
> is reported so the operator can tell whether ALLM was toggled in-band
> (seamless, link stays up) or required a modeset that blanks/retrains the
> link.
> 
> Signed-off-by: Fangzhi Zuo <jerry.zuo@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   tools/amd_hdmi_compliance.c | 97 +++++++++++++++++++++++++++++++++++--
>   1 file changed, 94 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index 0bc77e092..2af4c0bab 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -913,7 +913,91 @@ static void test_vic_mode(data_t *data, int vic, int conn_id)
>   	test_fini(data);
>   }
>   
> -const char *optstr = "hvt:i:b:y:e:";
> +/*
> + * Toggle HDMI content type (No Data <-> Game) on a live pipe to exercise HDMI
> + * ALLM (HF1-56 steps 14/15) without tearing down the link.
> + *
> + * A full atomic modeset is performed once, then each toggle is first attempted
> + * as a property-only atomic commit (no DRM_MODE_ATOMIC_ALLOW_MODESET). If the
> + * kernel rejects it, the change is retried with ALLOW_MODESET. The path taken
> + * is reported:
> + *   [seamless, no modeset] -> ALLM toggled in-band, link stays up
> + *   [MODESET required]     -> content-type change blanks/retrains the link
> + */
> +static void test_allm_toggle(data_t *data, int conn_id)
> +{
> +	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode;
> +	uint32_t connector_id, prop_id;
> +	uint64_t cur_ct = 0;
> +	igt_fb_t afb;
> +	char line[16];
> +	int game = 0;
> +
> +	test_init(data, conn_id);
> +
> +	connector_id = data->output->config.connector->connector_id;
> +	igt_require_f(kmstest_get_property(data->fd, connector_id,
> +					   DRM_MODE_OBJECT_CONNECTOR,
> +					   "content type", &prop_id, &cur_ct,
> +					   NULL),
> +		      "connector has no 'content type' property\n");
> +
> +	/* Initial full atomic modeset with a test pattern. */
> +	mode = igt_output_get_mode(data->output);
> +	igt_info("Using connector id %d, mode %s\n", connector_id, mode->name);
> +	igt_create_pattern_fb(data->fd, mode->hdisplay, mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888, 0, &afb);
> +	igt_plane_set_fb(data->primary, &afb);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	igt_info("\nMode set. content type = No Data (0).\n");
> +	igt_info("Press [Enter] to toggle Game <-> No Data, 'q'+[Enter] to quit.\n\n");
> +
> +	while (fgets(line, sizeof(line), stdin)) {
> +		drmModeAtomicReq *req;
> +		uint64_t val;
> +		int ret;
> +
> +		if (line[0] == 'q')
> +			break;
> +
> +		game = !game;
> +		val = game ? DRM_MODE_CONTENT_TYPE_GAME :
> +			     DRM_MODE_CONTENT_TYPE_NO_DATA;
> +
> +		req = drmModeAtomicAlloc();
> +		igt_assert(req);
> +		drmModeAtomicAddProperty(req, connector_id, prop_id, val);
> +
> +		/* Try a seamless, property-only commit first. */
> +		ret = drmModeAtomicCommit(data->fd, req, 0, NULL);
> +		if (ret) {
> +			int nomodeset_err = errno;
> +
> +			ret = drmModeAtomicCommit(data->fd, req,
> +						  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						  NULL);
> +			igt_info("content type = %-7s (%llu)  [MODESET required, link blanked] (nomodeset err: %s)\n",
> +				 game ? "Game" : "No Data",
> +				 (unsigned long long)val,
> +				 strerror(nomodeset_err));
> +		} else {
> +			igt_info("content type = %-7s (%llu)  [seamless, no modeset]\n",
> +				 game ? "Game" : "No Data",
> +				 (unsigned long long)val);
> +		}
> +		if (ret)
> +			igt_warn("commit failed: %s\n", strerror(errno));
> +
> +		drmModeAtomicFree(req);
> +	}
> +
> +	igt_remove_fb(data->fd, &afb);
> +	test_fini(data);
> +}
> +
> +const char *optstr = "hvt:i:b:y:e:a";
>   static void usage(const char *name)
>   {
>   	igt_info("Usage: %s options\n", name);
> @@ -924,7 +1008,8 @@ static void usage(const char *name)
>   	igt_info("-b 6|8|10|12|16	Set 6|8|10|12|16 bpc\n");
>   	igt_info("-y 1|2|3|4	Set RGB|YUV422|YUV444|YUV420\n");
>   	igt_info("-e seconds    number of seconds to display test pattern and exit\n");
> -	igt_info("NOTE: if -i is not specified, first connected HDMI connector will be used for -t, -b and -y\n");
> +	igt_info("-a            Toggle HDMI content type (ALLM) Game <-> No Data on a live pipe\n");
> +	igt_info("NOTE: if -i is not specified, first connected HDMI connector will be used for -t, -b, -y and -a\n");
>   }
>   
>   int main(int argc, char **argv)
> @@ -935,6 +1020,7 @@ int main(int argc, char **argv)
>   	int conn_id = 0;
>   	int max_bpc = 0;
>   	int pixel_format = PIXEL_ENCODING_UNKNOWN;
> +	bool allm = false;
>   
>   	memset(&data, 0, sizeof(data));
>   
> @@ -958,6 +1044,9 @@ int main(int argc, char **argv)
>   		case 'e':
>   			data.timeout_seconds = atoi(optarg);
>   			break;
> +		case 'a':
> +			allm = true;
> +			break;
>   		default:
>   		case 'h':
>   			usage(argv[0]);
> @@ -979,7 +1068,9 @@ int main(int argc, char **argv)
>   	if (max_bpc)
>   		set_max_bpc(&data, max_bpc, conn_id);
>   
> -	if (vic >= 0) {
> +	if (allm) {
> +		test_allm_toggle(&data, conn_id);
> +	} else if (vic >= 0) {
>   		if (vic > ARRAY_SIZE(test_modes) || !test_modes[vic].name[0])
>   			igt_warn("VIC %d is not supported\n", vic);
>   		else

