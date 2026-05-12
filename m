Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E035CD37BE
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 00:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D471410E945;
	Tue, 12 May 2026 00:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hkkaY/sx";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011023.outbound.protection.outlook.com [52.101.57.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E64E10E945
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 00:36:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IA0KbQtGVDGpZ3NFA+aP+Mb7gHmDfuVbo0G4ko5oNhW5ci7RGhxsrg0O/TZJmoikMcK/0XQ7xecwgoB1x6CFmEuw4+imUUleSJAADHitcHcVa4CfPRnwJiZSTix5wa8YalefFiYa56EERbyzOjvE5GvukNCQ/ih9g1RdAUqmVU41gsfmpFbywVPJF672bNcTRRNNqu96sBoOqLe6docd/in8stN3NjsdezoPEi+nXx2lERXwwlK5PEH26IZSSMYMNo+HNnLr5bpXa5Be3BuT4724bS9bNDyJWrBl7Hfxd7TYUDg5M7y4ITD+FGVCBuSv+MYQkURoa0cjov4ZNAe27g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TkXyfQlRnuy9KXj6NlplvtBnChxACOTawgBJI5QgNA=;
 b=vTs1a4fmlFBFyf/Ld31Ybay7RSh43Sxc0ndQ8VBQgHw/+B0F6On8paYOXr4GfT7aGUx9QewctXAsi7qyLpZJu5ROzRBlA4HADRJY5HvgQuY+0wgIvFWNjy6AazGPauANQ1wpDFoYpDSbigFSFe328V9BIROb0+0NOqDFqhjrxx3md8qLlno1EBX/XLKw1AccBBeVpN5j5VD3YTYEAJIjQCDzxD0sMs5UGvo6Wrervf3Om5i/LnKwEtAG8oYAu5BvohEnY/zYYLflqpeQgWNXg47N/PCKQtOpMUcTf8bSdLLiG3YILlPyM0iD4Fr6I1GiKnJ3538AZhSn5bsYgLDVPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TkXyfQlRnuy9KXj6NlplvtBnChxACOTawgBJI5QgNA=;
 b=hkkaY/sxui2qyiX1wJbGjbh+H2RG6jeFaJyf6khIeBReJA17k2R98dsZ588mp42cfibCDqkO0m/FYhwrjoSbyQa6aL+dLmNl6jOGTHxgJ6wcMajQADMtykBsEfCNcifuPs677y7aOJ5R1LleAmH5SJOhyRIA3uv+XXYZKZxASgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY8PR12MB7634.namprd12.prod.outlook.com (2603:10b6:930:9d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 00:36:12 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 00:36:12 +0000
Message-ID: <a6ed9e4f-96f5-4aaa-8a46-659677ab0deb@amd.com>
Date: Mon, 11 May 2026 18:36:10 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t][V3] tests/kms_hdr: Add visual HDR verification
 subtests
To: igt-dev@lists.freedesktop.org
Cc: Mark.Broadworth@amd.com, vitaly.prosyak@amd.com, swati2.sharma@intel.com, 
 kamil.konieczny@linux.intel.com, jani.nikula@intel.com,
 Wayne Lin <wayne.lin@amd.com>
References: <20260507211330.2640022-1-alex.hung@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260507211330.2640022-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:303:2b::10) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY8PR12MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: b97ad828-85d8-4b83-0007-08deafbe7780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799003|3023799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: s5aLq5IDANpCyQ3uTip/XogWQUuQAaV0c80LzkG52ozDpCg/yVEW21j2jbplNpJCoLxZ+IkBTLU5fHC3TiRsDwr4h7GQiBw6nr9TWYIGIcogdcxvZqvrhCZEnxA78gyzUrs6axfFWMj+7UI839mfTz7Q9QTZDhgcNNWJqDSa0pVZ6+a3dMEHMrIivfdmjCjCkIuh4rk+1NdfWmY4TMHGRDD49cNPgqyG7HB+8iEIdPfruEGnHJNPU1YBzV1jxPfX5zGq9tjO7TAC/xrgDFuc4qVx5SiYGIGs8hPjZk6s7fMpti2Hqlk8vEJHNwy/z/awwicgTali0BptsOmLq5mBrLUjIRi9WL/g2qZmQjxcpVyiRj+TlELH2yYQUrIs7VKwTCZlkXs8UGALGUfXwBRX/rZnUJxVx7Hgzmy4a3VmElt1QGauMN06T7HTfTb5mlVgdehlOXe4rg8FjBWPiWH1gf1WyUGAiC3XdBOEHxQGsLgG/8GLNbn9RgLI1HjdGWbQZzFD+uU8OL5TkFlaYMxTJlUMqpSk6mEr06jmFKTsjWcaL3h09Vgp5cJ8gzGTXWONde9g02UOVEBYWsPWMkd8RwKKnHni2YdzF7d1s0qBCls5mGY3CxXMjiobzp2oyP0Sv+aTXjZv/2NrQISVAgn9434rI7n4jdUOtksPgDsWDTX/mB5H5Df8PcYKhBpZgcxi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(3023799003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGV6T2RXN21tMHBLZnM5djNOSWx2VHBsMVk0RFdvaTdkYUhYWGR6cnNQd2hv?=
 =?utf-8?B?QXVmNVQ0WkJiMGJVSFJKN2Z0TlFtK0lJTnc1cHl4Y2xoNjQ1ODRmaHhvZm5M?=
 =?utf-8?B?cGtZSUxQT2NLZzJucXRqcEJTZmR2SkQreWtNL3NRZUVHVXRsSXpNNGhwUUQx?=
 =?utf-8?B?L3lIbWRMZ2JlK2pJQ3cxWUV0K1pWU3pUN003WThWT0cyRGVZcXJBaDROVzZF?=
 =?utf-8?B?NFBOdC9yY005SzhabXZDVlhKSHhoV2krM0RpM1ZhTXdNb0R1QUQwem5IZHpt?=
 =?utf-8?B?bUFhVkJ4WUY2UDlEcW1GRGI3SWIxVlM5TEdXUC92NWx2dUc3ak9YZklGRHB4?=
 =?utf-8?B?TFpQT01Cb2FwNEJORitOQ2dJZ2JFK1dkQ3pUbVNYbGNSdkZCdHZBdW9KT0tu?=
 =?utf-8?B?a1k4NU5OVXN0NTNscW1UVzEzUnl2dWo5cnN1VHdkVnBreHpCc3ptSXg0blJ2?=
 =?utf-8?B?VFRDempqd2pQMzNRaExFdFdXZy96WHgvRllWcjBCT05sUnFKN2U3OGRlbG5O?=
 =?utf-8?B?aTFDWXM1QkdscWZNT05EblRuN25VTjNscm11YThtMTRBb3ZpUUtMdVNSeDZO?=
 =?utf-8?B?RlRkRU5wcG5vcWlNUzluUFk0RElDTjEyaW9XY3NIR29TZk9odzhCVGM4cDBR?=
 =?utf-8?B?cEcvdXJVY1dPT3MvdlVQUmE2dmFqZFJhNjdvaHlob1Y1RXZBc25RZmJPUnQx?=
 =?utf-8?B?Q2hEd1VCQ0x0LzYwci9vV1F0Y3Ixa2ZQTG9Pd3JqY0IrNlJRTjk5ektIWUFn?=
 =?utf-8?B?YjlvRVpScy9GVk9PU1hleGpwd1J6aFZ1RjIyRWZIeXllMHI4SVg0UEJtM0JE?=
 =?utf-8?B?NUJlR0daTjJ1azFsaFhYWUZuQ01EVjlkSUxpQkQ5K3Q5QW9neW5PSE82MURt?=
 =?utf-8?B?b1J1Wm9raVNrVWlzaVdRRzlrSm01cDdPOGlpbXpyRU9MYXRoN2w1UURjb0Js?=
 =?utf-8?B?SmErS2gxV0NWYVF0RXRwbjJ1SUR0MmZ2T1NNMGpNTVN5d0RYMU9oSCt2SVNF?=
 =?utf-8?B?eEZVTDV0S2Y0aGNHUVk4cXNnRE5aZ3R5SW53WW9BanBsZTFFMjg3UGlsLy8r?=
 =?utf-8?B?VnVnamhzSWVidWxaOVRkbW1BOWt4cGhvekFyT1M2VnRrZFNESWVPUTc1K3Nv?=
 =?utf-8?B?Y0xlY0lzblJzaGRDelQrOUVxcVpXUGk5T2p1K0pUYlJ0aVU0SytHVWkwR2I4?=
 =?utf-8?B?Z0t4c1ptb2dCT29xOElGcytaN2NITUk3MDRseU5tem9zdmxFUEFlcmpLVUVn?=
 =?utf-8?B?ZVdTUDZOQmdvMXhlZEZ4ZU0wb3o5NTRsR2JRTzRMUWcyalFUSFAzK2NqNWlU?=
 =?utf-8?B?ZVM4SUZOSXhqMWF1QlBDVDZncENrZ2xLUGFKbS9CSVE3YU1CTjBFR0s1dEl5?=
 =?utf-8?B?TGg2UVZWTFIrVlNkUldCazhQVjNZTkxDNzFpS2pTQlp1VXJ0cUhhRW5FN2I2?=
 =?utf-8?B?S1FvdzVnMmFiK1pNWjRHdktIRytZRkRybzVRRmFxeXl3ZFF5dWJqNUpmaXFG?=
 =?utf-8?B?aGIwaFhOdzk5NXRHZW9KYkg3cVYwQkhvMEdhZnFhM1FFbkUvWFUxQmVlUGVv?=
 =?utf-8?B?dCtYWG9uVXQraHlTR1JMYVVjQjRIL3htYjljSHRwem10MlNZMWVxS3dXRTRO?=
 =?utf-8?B?YkFiYjQ3RWI0eEhlYllxaFpNaXh0WGJSQjBsWkpFS2ZObEg2cWRLKytINmxD?=
 =?utf-8?B?dWoxamlmNFNGbWRtNnZ0WWpNVlk2UGIrYkZ3QjBPZVc0ekhjbkQraHAxUnFj?=
 =?utf-8?B?cGk1VHQyay9kQjluQkllc01vOWpBWnZWQzBDWTFUQ050ZktQcjk3QnlSWVFu?=
 =?utf-8?B?enZWVVhOUHYwRTJ0UmJTMUpHZFl0RVZrQXJ4dlhxMVdSc3NHUk9SSWljTDAz?=
 =?utf-8?B?anlmV2w1NFcvaHM0Snl1azM5b0VvQmd6aEtiTS93NUw1R1FRZVJYd2NBMjRY?=
 =?utf-8?B?dWFvRkw3aDRxTUV6Y0ZjeUVTUno5NUpVeklnNjBJK3lFLzR0TURRWnNKUmh5?=
 =?utf-8?B?NEVLdHBmRm0wRWVMQ2ZsdVNwZ1Zxd0FuNTVBS203amgwMHJkUWlrYXR3aW1X?=
 =?utf-8?B?NDFjUkptaEhMNmZSaU5ZTmZvZ3lGYmVmQ0RUZnZTL1pianFqRldNcXBMMTFG?=
 =?utf-8?B?dllzOW43N0RQWWZKaWp3NFRRcGlMbEJ6c1p4Q2d0Z21DZTltNVJWUUxHbkF6?=
 =?utf-8?B?RTN6MXhPeVFNRTNKdEw1aEZGZmFOR1hTZUZJMDJ0UFRyRy9ldXE4NTVocUph?=
 =?utf-8?B?MWtuMmJURmcrQU5nb3RNeFpiVk84NFJWa1dacHZQak5YbWJCQzdpVEhyYStS?=
 =?utf-8?B?dFdvNlJIK0l6VHhhdEVyb2pQbGdkSnRodW9BWDZqUUYxRjlyZEJNUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97ad828-85d8-4b83-0007-08deafbe7780
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 00:36:11.9177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdeAoKLZLmJOJ432PwvXqPNmjY7XSwxU/5lCp/s9KZ0oQ3OLX/5HnvIrxBI7Ddq4nYs2kj2Ias6XAZTbr3N7wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7634
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

Hi,

Does anyone have any concerns if I merge this patch?

On 5/7/26 15:13, Alex Hung wrote:
> From: Wayne Lin <wayne.lin@amd.com>
> 
> The new subtests display an HDR test pattern under a given metadata
> mode and pause for user confirmation, enabling manual inspection of
> HDR output quality on a connected HDR panel.
> 
> New subtests:
> kms_hdr --run-subtest static-swap-smpte2084 --interactive-debug=smpte2084
> kms_hdr --run-subtest static-swap-traditional-sdr --interactive-debug=traditional-sdr
> 
> Co-developed-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
> Assisted-by: Copilot:Claude-Sonnet-4.6
> ---
>   tests/kms_hdr.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 89 insertions(+)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 876c1c03a..c13e985e1 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -67,6 +67,14 @@
>    *
>    * @swap:                    swapping static HDR metadata
>    * @toggle:                  entering and exiting HDR mode
> + *
> + * SUBTEST: static-swap-smpte2084
> + * Description: Show a visual HDR pattern with SMPTE ST 2084 metadata and
> + * require user confirmation.
> + *
> + * SUBTEST: static-swap-traditional-sdr
> + * Description: Show a visual HDR pattern with traditional SDR gamma metadata
> + * and require user confirmation.
>    */
> 
>   IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
> @@ -647,6 +655,79 @@ static void test_hdr(data_t *data, uint32_t flags)
>   	}
>   }
> 
> +static void test_hdr_visual(data_t *data,
> +			     void (*fill_metadata)(struct hdr_output_metadata *),
> +			     const char *mode_name)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	igt_fb_t afb;
> +	int afb_id;
> +	bool found = false;
> +	struct hdr_output_metadata hdr;
> +
> +	igt_display_reset(display);
> +
> +	for_each_connected_output(display, output) {
> +		igt_crtc_t *crtc;
> +
> +		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (!igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("Panel attached via %s connector is non-HDR\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		for_each_crtc(display, crtc) {
> +			igt_output_set_crtc(output, crtc);
> +			if (!igt_crtc_connector_valid(crtc, output))
> +				continue;
> +
> +			prepare_test(data, output, crtc);
> +
> +			afb_id = igt_create_fb(data->fd, 512, 512,
> +					       DRM_FORMAT_XRGB2101010,
> +					       DRM_FORMAT_MOD_LINEAR, &afb);
> +			igt_assert(afb_id);
> +
> +			draw_hdr_pattern(&afb);
> +
> +			igt_plane_set_fb(data->primary, &afb);
> +			igt_plane_set_size(data->primary, data->w, data->h);
> +			fill_metadata(&hdr);
> +			igt_hdr_set_metadata(data->output, &hdr);
> +			igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> +			igt_display_commit_atomic(display,
> +						  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						  NULL);
> +
> +			igt_info("Displaying %s HDR pattern. Press a key to continue.\n", mode_name);
> +			igt_debug_wait_for_keypress(mode_name);
> +
> +			igt_hdr_set_metadata(data->output, NULL);
> +			igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +			test_fini(data);
> +			igt_remove_fb(data->fd, &afb);
> +
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	igt_require_f(found, "No HDR-capable connector found.\n");
> +}
> +
>   int igt_main()
>   {
>   	data_t data = {};
> @@ -698,6 +779,14 @@ int igt_main()
>   	igt_subtest_with_dynamic("invalid-hdr")
>   		test_hdr(&data, TEST_INVALID_HDR);
> 
> +	igt_describe("Show HDR pattern with SMPTE ST 2084 metadata and require user confirmation");
> +	igt_subtest("static-swap-smpte2084")
> +		test_hdr_visual(&data, igt_hdr_fill_st2084, "smpte2084");
> +
> +	igt_describe("Show HDR pattern with traditional SDR gamma metadata and require user confirmation");
> +	igt_subtest("static-swap-traditional-sdr")
> +		test_hdr_visual(&data, igt_hdr_fill_sdr, "traditional-sdr");
> +
>   	igt_fixture() {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.fd);
> --
> 2.43.0
> 

