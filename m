Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB51F3029A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 05:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFBF10E0E3;
	Tue, 17 Mar 2026 05:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S0oYw2ur";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012040.outbound.protection.outlook.com [52.101.53.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0DA10E0E3
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 05:56:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuLJrPYNNCUWSJlAdT5MQ4aOVT5rMD/qxb603Mt6xZbz720yFG6SZuZoWfUZigT/ePZ+si/oTsFS4h0gVrWgaIH8nDLeG3vrHOM89FYXYo42Z2muo8CxCEHlVYjlDsqyp024ox95wG6UmYN9JvWb56wiDGsmbZacPLeu0NmagynwEAfiI8r0SUs6MqV8TAxeQFPZW+Y9w2CLoFXG2wzE+VWmhNOUanhrdCcTXGlA/SyXgMsW8cJ4EOtHg5tfBN36UppSJ3qq2CAfc1ckTmifW9HR3KyT3GIR4hwkv0vDLrObtaAt0M6Aqj8tOpdl1xYpqIrWeS1m+ASPE+UbgUrffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rl3+97RJwaMUmu0CbHlI3hrQLEbPFY86FjbcI4D8jg=;
 b=VMxsK8Y+P4MyNjZ+K+Ur/ZF3Igd+fgpZ9zUQgmza+aG1fVh++99YYyYbf/h50IMDl21JrxBgL3M1bJvM5xepBt7Z4I1mQKbOMv0WSqGqxISGh5C7oEusGvsAvwSnOsGTrwm6hlrL89GgBncmeG+P0eBX4JFJT5eOhbja2+WZQLiBvuaURASaYEBkqRc2hNYRvICdre9sNPPbHxB2nz6GGadYLB3gzxlYtdU81lDP+IhFJAd2t7uFq2MWSjvbBcJYXutzwPRIt1EyJUwdSkeuiD+HrfSYoqefyp23P6nBhB2QnoaCpnUCV9f85tveZ/ak/XWlYkYm/KMHEU+L8zwDTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rl3+97RJwaMUmu0CbHlI3hrQLEbPFY86FjbcI4D8jg=;
 b=S0oYw2urcLuOHtav0pYokim65jJxqtz5Rkl6mQEsecFL99uMpaOR9/Mt8+et/huTcHLNiyf+dK6Z5svJdjBWwJ3sDLvcYscPuuEccleh99/ijaZOLkUhvI98KDUxKQ48M4ZThOlu2zVkFKpj559Mo+gxKwHdO2vN9HuiOVy0/+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11)
 by IA1PR12MB8585.namprd12.prod.outlook.com (2603:10b6:208:451::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 05:56:22 +0000
Received: from PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::4f70:b453:55c9:a190]) by PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::4f70:b453:55c9:a190%4]) with mapi id 15.20.9723.016; Tue, 17 Mar 2026
 05:56:17 +0000
Message-ID: <a3d5a09e-090a-4e6e-90da-9a871a0e93e3@amd.com>
Date: Tue, 17 Mar 2026 13:56:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_ilr: add disallow replay debugfs
 and fix CRC read timeout
To: Ray Wu <ray.wu@amd.com>, igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, sunpeng.li@amd.com
References: <20260313085713.890370-1-ray.wu@amd.com>
Content-Language: en-US
From: Tom Chung <chiahsuan.chung@amd.com>
In-Reply-To: <20260313085713.890370-1-ray.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0181.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::19) To PH7PR12MB6611.namprd12.prod.outlook.com
 (2603:10b6:510:211::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6611:EE_|IA1PR12MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d2fd7b-0d44-445a-a5ca-08de83e9e793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: B1Ld3+sCITdDvID66hW1PMTTn0N4HIa6CZK4IV76+5BN4im61xuaP9IxcdGAZKm/68T/IvGVMFB6c/le/NZb9YodbR4gc5kB+VSj2Ng3VBbiXF0ELBcNAzengPT9JgUZPDgtpNn4dTwJTS0LkPmBEfZAxXcDdcTRVbBTGfrGdasWeISPLt6cJ0OfNcJ+RBNjAUWwaaYa/tIRHdZX8/6GvtyQVB2yt2XE4FbmT1xc8xOQpZSq9iDrsxijbllENE6pw/3nL5alvQXqZohmWeShatzLUs4PQgLu4y68alYjqAFHw1d0ubyp6nP45pEzSK8RksSPgE5TP8ckiKxarEsplYycAJr2EVUhpZ/OFQlXgo2jYZv07DZb13xVJTlUS40Zb205donGUoC5aYVaS2mc8Z28AFZA3JCVlN0gQgaKQwOHDLarbg3COm7vFTPli5mrCiowNod6pyJBSyf3XJF6WIbB33DA8M3QOSWiajlen+F9jljKTVhXpE/YAuyaGquHX3VktuPUOTYL5nHgj7bP2l+/+/sFsL4iGX2V1ed9r9SH1KTPKrASs3umnXP6ftYHmWSioUFP18R81i8xNM7UZ1MYeNZl8H1BFFCqtkGkjYsd3QKJeWEMmXKgYIiZpr8KThV+pYrCgL+4NSodWchimZbbuN6wl3dQqHjqSJyvS35dC+ukXhUS/uA2d1ubi2hhbVP931SLxuRUzzIztxxImWWnIO5hqjmbQv3HdZ7hrTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6611.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3E1TWRCVStBMWhTWmxEbmN5bHpZenFCcWxORWtMQkFZbm8yK0lHZittRXBZ?=
 =?utf-8?B?VFV5Rmszd20vRldrbEFyMTZTUmcrRDBjNmFhUFljemd5cmRVcmowckMvdkZX?=
 =?utf-8?B?ajlHWWF3MHJLdU9OSUwxc1U5MVpZcWszSC8yK3FYdWV5azNZWHN2K1FwSUJQ?=
 =?utf-8?B?bDJ2YnlhcFZMcmNZbkliMzUvTmNWTVkwbnZqTzdVZ3d2dXFNMGRTRXdzTFN3?=
 =?utf-8?B?R2g3eEVFZHFvei9wbi9uS0NvVi9KL0l2SEVIVFRFbEh3SVlTeWZiUTh2RC9r?=
 =?utf-8?B?OHBHOEpJeGU4cnRtQSs2MENwN3FwMVU1ZTNveFR2aUMxenFVbUt4VHk3L29K?=
 =?utf-8?B?aCtmcktQakk4OHNMMVRyMWZ5Rk5idE5lR0ZZZEJLa0dHZWVkYTFhZlNsek9F?=
 =?utf-8?B?b2YydWEwT0R4cXRyS2NGRkdiZEZVMjg2VU43YlFocWFlUmt2QkZYTmhWK0Rp?=
 =?utf-8?B?djl4YjlGbkxFSWVSa3FOejNRY3NOSzhTV1lRYU1aR3Z3VUxVeFhnSzNrVjFq?=
 =?utf-8?B?bG1QL1c1T29McXI1NlZxeVV2cmRxanJBVzdRQ3NlRFRYZlB0T04rKzdEUmJJ?=
 =?utf-8?B?cE5YZlBJQUZ4ODJGczVpT3pHR3FPWUdqYXRiamtCcjUrTWt1OEsxWXhyQ0NN?=
 =?utf-8?B?eENRTGUvKzE5Rzc3WUdZNk9LeUNTZVJ4b3pKSXlPRFFCenVZa1UxNWxaaW85?=
 =?utf-8?B?ZFJhV2hiYWsyQk9aZ1h3dU5XL3NXWXZ2VkpGNGs1OWJrcmhWUjNyWld2Q0w1?=
 =?utf-8?B?VUNhVDlnd3dzbktZZTE5cUNuWnFpeDA4RjJHNTMxaE5QMXJVcGdSU3BDYXBW?=
 =?utf-8?B?VGFKREF2dmFpMmpyVG4wQm9FTXVrWGJmNmhWU3lxT0dxYlVjMHd0Y2lVdjNZ?=
 =?utf-8?B?Tm1UVk5kZy9WcC9uSlVDNjJWTkx0UXFwQVdWWXdHM1JMbG82MXA4VWZ4ODgx?=
 =?utf-8?B?TUF1ekdCeUZZb3Q0Y25QTmN6bWdIRGt4UzV5Z21XeHA4M1FBOUx6Vk0vdVBK?=
 =?utf-8?B?b29xV2ZuSSswVnh2Zjd5QkxWREpxanJmckU0NFJQUlN3amRkMlhRS3pMd00z?=
 =?utf-8?B?bjJLVVpJdWkwSUREOFNEd0JNQm1mNzZyaGNmNnZPRC9ZMEZTQ1ljV2svVVVU?=
 =?utf-8?B?WVBRTGdvQ0llWTU1YXdua2FZbktBOGxvQm9RZDFaMGViK1VCOExHTUlTTDdw?=
 =?utf-8?B?a3h5V0crRzhlVCtTczE5RmdxSlZ4N0U3SXE0YWl6cFRXOFM4bDRuTXE4aXMz?=
 =?utf-8?B?NjZsS0xYQ29jaWxOZXlhZVlDbktLM01UMTVQMnNyaDBOZUt0QVQ1U0ljbHlv?=
 =?utf-8?B?Y3ljUTdJdUlEdHVzYWF4Q1dRd1Z1VHVIaVZuSENLeHlvQmE1SmJmTGl2eTFk?=
 =?utf-8?B?bjVydzc0Sm5vczF3QnBiTHNCOUxxT3ZWR1F6SGJpOVlHQjdaS2tqMjI1aDEx?=
 =?utf-8?B?R3hjejJDUCtEbS85Z1RlOWJWQ1E5UDJkbkJ1U3NIQWVuZGF4QVpyMEQvTnNT?=
 =?utf-8?B?WmxnZWVrZzV5b1dyc3hiSFFVZzUrMVFRWDZiVy9BZzRsMXpUMDNhZXZCNVFL?=
 =?utf-8?B?dFg2MkxNT0RYV2drQXgxeTUrWW05WElhVzJNVEFDWjhLUVAvVEI3akdTYXpx?=
 =?utf-8?B?Z0ZxR25qWnhTMjRldDBiSENIYnBWeFVuOFUrZTEzc0hBcnlqblNpQm5ZV1Rq?=
 =?utf-8?B?WVNXNEQ0NmFDMFFIUzl1aE1obXdNUlYrcnpvWEgyZG9zRmpUWWRHRkM0YWt0?=
 =?utf-8?B?LzZqZGFCbEdMZnpyZ0ZsanNIRkl2QWlUVzdVV3dPd1pKcHpoc0VSeThBeWhD?=
 =?utf-8?B?LzdCSDduVk9UMldtcng1QTNNckNHa3F5c0cySFVoajJsRVJ0VVZidjNBYVpZ?=
 =?utf-8?B?b3FXZGdCWDdOSm8zQnNmd2lMR3NTa1Nod29VeHFuOXozNTc2ek55MENzakMr?=
 =?utf-8?B?VjdnVlNrck9jb0NGQmYvVjBJSENkV2V1VjFtdFBJVzZMRlRZcGxocVZKSlF1?=
 =?utf-8?B?K1dwaDVYbTlhMnpISmgyVWJ2cktZWC9QNXlrekJWUHhCZEE3d05nTXpsRnhR?=
 =?utf-8?B?UkxZbzhOYXFKbHVZb0txTlVjeFB4cW5iRnNtZDNmNVNCOCtHY2U1R0t2aFZO?=
 =?utf-8?B?Ym5xbVBEZGh4czl3aXVUQ1hhdUZJU1g0clRkSVJuRklDUFlNemRBWU82clBy?=
 =?utf-8?B?eGFwbjY1bUpoRDJrTXlNdU1sSTdEVWxubW5VMUJOdEd4ZGJqRFlZb1RCQlF5?=
 =?utf-8?B?SHRCOG1pUmZZMlNSQ1Fjd21jYVN2NzlYRTIxOHQzNmtWenc0S01YcnIwUDlm?=
 =?utf-8?B?dE5QTHEyYmxoSlhTV2hqQUQxa21ManV0T2FORkR5T1ZiOUxsZFI4QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d2fd7b-0d44-445a-a5ca-08de83e9e793
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6611.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 05:56:17.2252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xx/h7o9HrzGiHbj3lJxcCPICs81AZfVWqNlE8d4jjS+IW6kDO56iuaxygainwH36Ox0QxR/BrrtD75aUbpSOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8585
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

Tom Chung

On 3/13/2026 4:57 PM, Ray Wu wrote:
> [Why]
> On eDP panels that support Panel Replay, the kernel enables replay during
> link training. This causes the eDP Rx CRC read to time out because the
> panel enters replay mode and stops sending CRC data normally.
>
> [How]
> 1. Add igt_amd_disallow_edp_enter_replay() helper in lib/igt_amd that
>     writes to the disallow_edp_enter_replay debugfs node, following the
>     same pattern as igt_amd_disallow_edp_enter_psr().
>
> 2. In amd_ilr test_flow():
>     - Call igt_amd_disallow_edp_enter_replay() with enable=true before
>       reading eDP Rx CRC to prevent the panel from entering replay mode.
>     - Call igt_amd_disallow_edp_enter_replay() with enable=false after
>       reading CRC to restore normal replay behavior.
>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Tom Chung <chiahsuan.chung@amd.com>
> Signed-off-by: Ray Wu <ray.wu@amd.com>
> ---
>   lib/igt_amd.c          | 44 ++++++++++++++++++++++
>   lib/igt_amd.h          |  2 +
>   tests/amdgpu/amd_ilr.c | 83 +++++++++++++++++++++++++++++++-----------
>   3 files changed, 108 insertions(+), 21 deletions(-)
>
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 3ddb5f403..a97adad43 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1365,6 +1365,50 @@ void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enabl
>   	close(ret);
>   }
>   
> +/**
> + * igt_amd_disallow_edp_enter_replay: notify kernel skip edp replay setup and enable
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name
> + * @enable: skip kernel eDP replay setup and enable -- disallow edp enter replay
> + * example usage: disallow replay
> + * echo 0x1 >
> + * /sys/kernel/debug/dri/0/eDP-1/disallow_edp_enter_replay
> + *
> + * expected IGT sequence is as below:
> + * 1. disable eDP PHY and notify eDP rx with dpcd 0x600 = 2.
> + *    for example, kmstest_set_connector_dpms off will do this.
> + * 2. echo 0x1 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_replay
> + * 3. enable eDP PHY and notify eDP rx with dpcd 0x600 = 1 but
> + *    without dpcd 0x37b.
> + * 4. read crc from rx dpcd 0x270, 0x246, etc.
> + *    igt_pipe_crc_collect_crc will do this.
> + * 5. echo 0x0 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_replay.
> + *    this will let eDP back to normal with replay setup.
> + */
> +void igt_amd_disallow_edp_enter_replay(int drm_fd, char *connector_name, bool enable)
> +{
> +	int fd, ret, wr_len;
> +	const char *allow_edp_replay = "1";
> +	const char *dis_allow_edp_replay = "0";
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +	ret = openat(fd, DEBUGFS_DISALLOW_EDP_ENTER_REPLAY, O_WRONLY);
> +	close(fd);
> +	igt_skip_on_f(ret < 0, "Skip test: Debugfs %s not supported\n",
> +		      DEBUGFS_DISALLOW_EDP_ENTER_REPLAY);
> +
> +	if (enable) {
> +		wr_len = write(ret, allow_edp_replay, strlen(allow_edp_replay));
> +		igt_assert_eq(wr_len, strlen(allow_edp_replay));
> +	} else {
> +		wr_len = write(ret, dis_allow_edp_replay, strlen(dis_allow_edp_replay));
> +		igt_assert_eq(wr_len, strlen(dis_allow_edp_replay));
> +	}
> +
> +	close(ret);
> +}
> +
>   static bool get_dm_capabilities(int drm_fd, char *buf, size_t size)
>   {
>   	int ret, fd;
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index bce4657cb..a45122b68 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -53,6 +53,7 @@
>   #define DEBUGFS_EDP_PSR_STATE	"psr_state"
>   #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
>   #define DEBUGFS_DISALLOW_EDP_ENTER_PSR "disallow_edp_enter_psr"
> +#define DEBUGFS_DISALLOW_EDP_ENTER_REPLAY "disallow_edp_enter_replay"
>   
>   /* amdgpu DM interface entries */
>   #define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
> @@ -235,6 +236,7 @@ bool igt_amd_output_has_psr_state(int drm_fd, char *connector_name);
>   int  igt_amd_read_psr_state(int drm_fd, char *connector_name);
>   void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool enable);
>   void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enable);
> +void igt_amd_disallow_edp_enter_replay(int drm_fd, char *connector_name, bool enable);
>   
>   /* DM interface helpers */
>   bool igt_amd_has_visual_confirm(int drm_fd);
> diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
> index 5dd467b43..f7f480e66 100644
> --- a/tests/amdgpu/amd_ilr.c
> +++ b/tests/amdgpu/amd_ilr.c
> @@ -203,10 +203,12 @@ static void test_flow(data_t *data, enum sub_test option)
>   		}
>   
>   		/* states under /sys/kernel/debug/dri/0/eDP-1:
> -		 * psr_capability.driver_support (drv_support_psr): yes
> +		 * psr_capability.driver_support (drv_support_psr): yes/no
> +		 * replay_capability.driver_support (drv_support_replay): yes/no
>   		 * ilr_setting (intermediate link rates capabilities,
>   		 * ilr_cap): yes/no
>   		 * kernel driver disallow_edp_enter_psr (dis_psr): no
> +		 * kernel driver disallow_edp_enter_repay (dis_replay): no
>   		 */
>   
>   		/* Init only eDP */
> @@ -216,9 +218,10 @@ static void test_flow(data_t *data, enum sub_test option)
>   		 * DPMS on/off will not take effect until
>   		 * next igt_display_commit_atomic.
>   		 * eDP enter power saving mode within test_init
> -		 * drv_support_psr: yes; ilr_cap: no; dis_psr: no
> +		 * drv_support_replay: yes | drv_support_psr: yes;
> +		 * ilr_cap: no;
> +		 * dis_psr: no, dis_replay: no
>   		 */
> -
>   		mode = igt_output_get_mode(output);
>   		igt_assert(mode);
>   
> @@ -228,11 +231,16 @@ static void test_flow(data_t *data, enum sub_test option)
>   				      0, &data->fb);
>   		igt_plane_set_fb(data->primary, &data->fb);
>   
> -		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no
> +		/* drv_support_replay: yes | drv_support_psr: yes;
> +		 * ilr_cap: no;
> +		 * dis_psr: no & dis_replay: no
>   		 * commit stream. eDP exit power saving mode.
>   		 */
>   		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
> +		/* drv_support_replay: yes | drv_support_psr: yes;
> +		 * ilr_cap: yes;
> +		 * dis_psr: no & dis_replay: no;
> +		 */
>   
>   		/* igt_amd_output_has_ilr_setting only checks if debugfs
>   		 * exist. ilr settings could be all 0s -- not supported.
> @@ -247,23 +255,35 @@ static void test_flow(data_t *data, enum sub_test option)
>   
>   		igt_info("Testing on output: %s\n", output->name);
>   
> -		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
> +		/* drv_support_replay: yes | drv_support_psr: yes;
> +		 * ilr_cap: yes;
> +		 * dis_psr: no & dis_replay: no
> +		 */
>   		kmstest_set_connector_dpms(data->drm_fd,
>   			output->config.connector, DRM_MODE_DPMS_OFF);
>   		/* eDP enter power saving mode.
> -		 * drv_support_psr: yes; ilr_cap: no; dis_psr: no.
> +		 * drv_support_replay: yes | drv_support_psr: yes;
> +		 * ilr_cap: no;
> +		 * dis_psr: no & dis_replay: no;
>   		 */
>   
> -		/* Disable eDP PSR to avoid timeout when reading CRC */
> +		/* Disable eDP PSR / Replay to avoid timeout when reading CRC */
>   		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, true);
> -		/* drv_support_psr: yes; ilr_cap: no: dis_psr: yes */
> +		igt_amd_disallow_edp_enter_replay(data->drm_fd, output->name, true);
> +		/* drv_support_replay: yes | drv_support_psr: yes;
> +		 * ilr_cap: no;
> +		 * dis_psr: yes & dis_replay: yes;
> +		 */
>   
>   		/* eDP exit power saving mode and setup psr */
>   		kmstest_set_connector_dpms(data->drm_fd,
>   			output->config.connector, DRM_MODE_DPMS_ON);
> -		/* drv_support_psr: no; ilr_cap: yes: dis_psr: yes
> -		 * With dis_psr yes, drm kernel driver
> -		 * disable psr, psr_en is set to no.
> +		/* drv_support_replay: no & drv_support_psr: no;
> +		 * ilr_cap: yes;
> +		 * dis_psr: yes & dis_replay: yes;
> +		 * With dis_psr yes and dis_replay yes,
> +		 * drm kernel driver disable psr/replay,
> +		 * psr_en & replay_en are set to no.
>   		 */
>   
>   		/* Collect info of Reported Lane Count & ILR */
> @@ -282,33 +302,54 @@ static void test_flow(data_t *data, enum sub_test option)
>   				break;
>   		}
>   
> -		/* drv_support_psr: no; ilr_cap: yes; dis_psr: yes */
> +		/* drv_support_replay: no & drv_support_psr: no;
> +		 * ilr_cap: yes;
> +		 * dis_psr: yes & dis_replay: yes;
> +		 */
>   		kmstest_set_connector_dpms(data->drm_fd,
>   			output->config.connector, DRM_MODE_DPMS_OFF);
>   		/* eDP enter power saving mode.
> -		 * drv_support_psr: no; ilr_cap: no; dis_psr: yes.
> +		 * drv_support_replay: no & drv_support_psr: no;
> +		 * ilr_cap: no;
> +		 * dis_psr: yes & dis_replay: yes;
>   		 */
>   
> -		/* Enable PSR after reading eDP Rx CRC */
> +		/* Enable PSR / Replay after reading eDP Rx CRC */
>   		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
> -		/* drv_support_psr: no; ilr_cap: no: dis_psr: no */
> +		igt_amd_disallow_edp_enter_replay(data->drm_fd, output->name, false);
> +		/* drv_support_replay: no & drv_support_psr: no;
> +		 * ilr_cap: no;
> +		 * dis_psr: no & dis_replay: no;
> +		 */
>   
> -		/* eDP exit power saving mode and setup psr */
> +		/* eDP exit power saving mode and setup psr/replay */
>   		kmstest_set_connector_dpms(data->drm_fd,
>   			output->config.connector, DRM_MODE_DPMS_ON);
> -		/* drv_support_psr: yes; ilr_cap: yes: dis_psr: no */
> +		/* drv_support_replay: yes | drv_support_psr: yes;
> +		 * ilr_cap: yes;
> +		 * dis_psr: no & dis_replay: no;
> +		 */
>   
>   		/* Reset preferred link settings*/
>   		memset(data->supported_ilr, 0, sizeof(data->supported_ilr));
>   		igt_amd_write_ilr_setting(data->drm_fd, output->name, 0, 0);
> -		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
> +		/* drv_support_replay: yes | drv_support_psr: yes;
> +		 * ilr_cap: yes;
> +		 * dis_psr: no, dis_replay: no;
> +		 */
>   
>   		/* commit 0 stream. eDP enter power saving mode */
>   		igt_remove_fb(data->drm_fd, &data->fb);
> -		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no */
> +		/* drv_support_replay: yes | drv_support_psr: yes;
> +		 * ilr_cap: no;
> +		 * dis_psr: no & dis_replay: no;
> +		 */
>   
>   		test_fini(data);
> -		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no */
> +		/* drv_support_replay: yes | drv_support_psr: yes;
> +		 * ilr_cap: no;
> +		 * dis_psr: no & dis_replay: no;
> +		 */
>   	}
>   }
>   
