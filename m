Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A91CCFA03
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 21:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52A710E4AC;
	Mon,  3 Nov 2025 21:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="glgXiaDB";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010063.outbound.protection.outlook.com
 [40.93.198.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B7E10E4AA
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 21:28:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bT7DmgeHoEHoJhutRxwyLMeOUZCFtbqXcbXay7XI0VX0xvp++dHjUy7jrK4a4YV9X1IszuTIzLAl/CJqpZgGrBYV9D2FPXgo4R4JqBuRnTOHaqXDEnvxIZY0heNH/F9w6ZjRpfV54Wg31xKytvmXelQrVLy9VuDkkIYSWmbLlyp333oKlGqHY8j+fEUSx2LlnCo4aBLZm2EXngVqN/5v1kSLVi28fznOF9DaIIFiLeVEghrnp61p8+X7MvR4bKM3Tvmi0rVOl8n3TwNl/SsuUqR4Kczn6mBMO16RZaqDSwv+VLfXcmn+i5ZLIBYbYL2nNa7FHJKhUYcFCXlSTqmvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smygUXqr5cHnAhs96cIOg6zOun/uLkbmQoLbWfsMc7c=;
 b=px4a6OSJaHYgGNpLslLeKNhBwKS7NLBjaQDOuBetgUWpVxOXdnfuSYL/6OUjZvEs0pe1i8ewcPQpmWCkPZ+CbsXm+B7Dy6zZXA9xEpQDqaQJs9pz7O7dXexpB4CgP+WJ6xX4rcq3f5m4SYHWnMNSsJTF91vKSy1ZTVnOMPkK0k8DlkQ/b9X89woEr8hZbUhCTj7IEqDUvIivIG84GB+9TPV5ILJ6Is0L8KL32B0oiwu+MEwYmsPtquJrVP+sr9kir4N/BDUvGrzZqFecqBQ9Vrmxa7/1/HYlvuuqQ/nVCh5hXixnmmySEQsGr7f/mAqqAZvdC4t342JucJRieFXn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smygUXqr5cHnAhs96cIOg6zOun/uLkbmQoLbWfsMc7c=;
 b=glgXiaDBABubkQUeT8rqNgK8u6H3oJXuKphI2rjXvo91A7XK6YnbKTidrbBK6TdJMoBygj7AfFh5WnJmEslMLck03SolKf+PKHRuy3Kw/6XiABiRNQ6ugSdl2Vmvp29SOvHpMXWS/+HznPCchhEARp8L/eR5V9BmM9EmIHDiarA=
Received: from PH8P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::26)
 by SN7PR12MB7022.namprd12.prod.outlook.com (2603:10b6:806:261::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 21:28:24 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::8a) by PH8P221CA0011.outlook.office365.com
 (2603:10b6:510:2d8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 21:28:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 21:28:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 3 Nov
 2025 13:28:23 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Nov
 2025 15:28:23 -0600
Received: from [10.4.13.158] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 3 Nov 2025 13:28:23 -0800
Message-ID: <5372a9d7-b9d1-43bd-973a-ad431e97d87e@amd.com>
Date: Mon, 3 Nov 2025 16:28:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 06/32] tests/kms_properties: Add colorop properties
 test
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-7-alex.hung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20251030042801.2315866-7-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: sunpeng.li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|SN7PR12MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: f428d8d4-415a-49b2-6968-08de1b1feb5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|42112799006; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1hZNENWcTFzMyt2aHA5cDNnUmhFMzBzNHhjT3F0ejZRallkVFhwMHBpbW45?=
 =?utf-8?B?NFlqc2FQOVFLSFhaTFRSSkpVUS9ZS040RGlaS08za0tYeTBBZ3hhL3VJdmYz?=
 =?utf-8?B?S3RJaHNOVTF3N2FMU3krL3U1R1JoVElNNDFzU2o5bXZxZDVFSGhLWVB6SDVn?=
 =?utf-8?B?SEhFeGVzcThCMjVSazRGVVJkWUZGVTBtbUM0QUlDdFNQL3d0Ym02R29pMVdj?=
 =?utf-8?B?dzdJZ3YxRjM0ci9UYU54MWV4MWEreXBSdXpqSnEwSHJlWTdxMFZucUZQb0t0?=
 =?utf-8?B?MmRXREZ5Wll2MXBYMGpLM0Q2QjNkWHFUclVTT3B6a0hRT3Q2M05oTm1pb1F0?=
 =?utf-8?B?NnBBS05YdW00eU93ekYvMnBiNGU3TW42ellHQng1UklobGdVYUtNbDlmRkZX?=
 =?utf-8?B?akp0S0pFNzdqZ2FDaTVsdGdHUmpNdytKeFNxTE9CclJWam9BOVZBbnJkZ3Yv?=
 =?utf-8?B?Q1JmUHV2ZGFrMGJ0ZjFSaUcvY2hhMkphVExSbkZ0YWl6SHRldVgycGZEZmR6?=
 =?utf-8?B?ZWZZd2JGNHRmVWgzdjd2azIwYUpFcHJTdk5oalR0WDlOQkkyODFlT0ZvTHRt?=
 =?utf-8?B?aE9Td3FRMy9URk1xbElYNEJNZllKanRLZG81MFhINHdqbmNkV3FhSkdPcTQr?=
 =?utf-8?B?NVJMSDVDd1BHSjdWc0wvbityL1ZLVngvUXBmV2FuWE40M2RMdFR0Qmg3L1Ja?=
 =?utf-8?B?RHM1SERSK1NUcXU5OFRmK1FyL0s0RkZ0cWQ3UXFHQm1CNStZdzNwSnE5akJQ?=
 =?utf-8?B?R21PRm1zNzVLUmdQUmU3SEg3THA4TmMzd1Q5UzdoU1dNeWsra1lnd0dKeWFL?=
 =?utf-8?B?Y3M5Zjh5RUFKaTFOVDU1bklPRmdtTnlxMGI2S213blYvU0dERnBkSmtaV3lJ?=
 =?utf-8?B?UjBrR0wyQ3M0c0RweFl2eENXSHVObFVGbXdPNDZmd3djbFY5aURnWkI4YnRH?=
 =?utf-8?B?MzlrWTJodzlyNzlkUlR6a1JTVXZmWkt1ZHp5aURZVzRLdm5Rc2JtcUdaNExS?=
 =?utf-8?B?T0xRbEhOenh3aElpbFd5eGVqVSs0ZU1oSW80L0lINWs4RXNjWGM3SEU0SzNN?=
 =?utf-8?B?c1lXV0NWRHpSWEYxcmMyZHpNVkZtRGo0alIyMHpST1B2dUQ2QU1Jdk9mSmo0?=
 =?utf-8?B?VkI4aXo5TWJUT3p0eGNsU1hrUHJ5cTBEUm9DdTg4VGZyYWNwTktyeCtCQlky?=
 =?utf-8?B?OGR0Z3FtdHI3SG4rM0xibTJjV3ZmU0lvYUNURVJvQmNRU2MvUW1FQTRrVUpm?=
 =?utf-8?B?R2tveHkyN1FDZVNRY2w4VGZiWlQxeFE5aHhTa0FFMFhiblcxTkc0eEZldVBD?=
 =?utf-8?B?VFE1Y1F0MVZER3NoUnM3ajhVY0RrM09OcElneE9Gb01PUW1vOCtzbVZnZkRG?=
 =?utf-8?B?cnk3UENsSGt4a0hwNEZUWnQ1d0dlYnBZTUNXL0xyVzVqSG1sc1JORVV6YlMv?=
 =?utf-8?B?RjgzdHgzVVdKVlh4MXBNenFrcDVrTFBGSUpzaHNEVm1obVRGa2M0dHVnUis2?=
 =?utf-8?B?RUFWZXdhUGdnUEZ2OVIyalRMUEJFTGtzL25nUTFDSDFnVFZNSUZxaTd6a1RI?=
 =?utf-8?B?M0dRRElhampVeDV3SzdCMUl3U0pFSGlmT1lMdUp0d2xMSUxrTHZrdVlZUWxu?=
 =?utf-8?B?dGZiTXlHdjhaUkUvVndVOTNoMENWbGpYYjJmdzlsSjZTZkNGbmI4elJJS3lj?=
 =?utf-8?B?QnVpZi94aXlzZkV0cEd6dEU5bXkyQ2E4MWswM1NJVmE1bk4vTCtUbGd3L1Y3?=
 =?utf-8?B?djFPMzdiaXQydzBEMEtZdkx6YW02a3dyN2hXM010NW5VRkNwL21SbWVPNW9V?=
 =?utf-8?B?eFhWa2Y2amxzcW9qbU9IVE55TG5OOXdEN1c2M2NZTVkvcVlzQys0MUFWSy8z?=
 =?utf-8?B?UDhFNE1rZ0djdS91QlhxUllLamlRM3FPb1JuNnR5dmNDcjlJVW1INTJEeXpz?=
 =?utf-8?B?a0pIcDc1Z2xoTWxRbGU3VnNYSXJLT1ExVkNmVko0SHQ1eGNheC9VNXhDbDl3?=
 =?utf-8?B?SG1jVjFCTTIvS2xia2pGVXpLaDN4am8wZUFLTTFYWEhDMkhDQWRITC9xakEz?=
 =?utf-8?B?Ni9jY0hlQnBzbS9wRml6MHMyN0JlZGxnYjNaZW1NZFBvQmp2ZDd6ZTczYTR6?=
 =?utf-8?Q?nJkk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(42112799006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 21:28:23.9157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f428d8d4-415a-49b2-6968-08de1b1feb5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7022
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



On 2025-10-30 00:27, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> We've introduced the concept of a new DRM core object, the
> drm_colorop, to represent a color operation as part of a
> color pipeline.
> 
> Add new tests to kms_properties to test the properties of
> a drm_colorop object.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  tests/kms_properties.c | 71 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 3bdf23aad..21e09504a 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -47,6 +47,7 @@
>   * @crtc:            CRTC
>   * @plane:           Plane
>   * @invalid:         Invalid (connector/crtc/plane)
> + * @colorop:         Colorop
>   *
>   * arg[2]:
>   *
> @@ -230,6 +231,41 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, boo
>  	}
>  }
>  
> +static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
> +{
> +	struct igt_fb fb;
> +	igt_plane_t *plane;
> +	igt_colorop_t *colorop;
> +	int i;
> +	int colorop_id = 0;
> +
> +	prepare_pipe(display, pipe, output, &fb);
> +
> +	for_each_plane_on_pipe(display, pipe, plane) {
> +		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
> +			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
> +
> +		/* iterate over all color pipelines on plane */
> +		for (i = 0; i < plane->num_color_pipelines; ++i) {
> +			/* iterate over all colorops in pipeline*/
> +			colorop = plane->color_pipelines[i];
> +			while (colorop) {
> +				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
> +					  kmstest_pipe_name(pipe), plane->index, colorop->id,
> +					  kmstest_plane_type_name(plane->type), output->name);
> +				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id,
> +						atomic, display->has_plane_color_pipeline);
> +
> +				colorop_id = igt_colorop_get_prop(display, colorop,
> +								IGT_COLOROP_NEXT);
> +				colorop = igt_find_colorop(display, colorop_id);
> +			}
> +		}
> +	}
> +
> +	cleanup_pipe(display, pipe, output, &fb);
> +}
> +
>  static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
>  {
>  	struct igt_fb fb;
> @@ -275,6 +311,37 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
>  		cleanup_pipe(display, pipe, output, &fb);
>  }
>  
> +static void colorop_properties(igt_display_t *display, bool atomic)
> +{
> +	bool found_any = false, found;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
> +	/* colorops are only available with atomic */
> +	igt_skip_on(!display->is_atomic);
> +
> +	for_each_pipe(display, pipe) {
> +		found = false;
> +
> +		for_each_valid_output_on_pipe(display, pipe, output) {
> +			igt_display_reset(display);
> +
> +			igt_output_set_pipe(output, pipe);
> +			if (!intel_pipe_output_combo_valid(display))
> +				continue;
> +
> +			found_any = found = true;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +				igt_output_name(output)) {
> +				run_colorop_property_tests(display, pipe, output, atomic);
> +			}
> +		}
> +	}
> +
> +	igt_skip_on(!found_any);
> +}
> +
>  static void plane_properties(igt_display_t *display, bool atomic)
>  {
>  	igt_output_t *output;
> @@ -853,6 +920,10 @@ igt_main
>  		  "Tests connector properties with legacy commit" },
>  		{ "connector-properties-atomic", connector_properties, true,
>  		  "Tests connector properties with atomic commit" },
> +		{ "colorop-properties-legacy", colorop_properties, false,
> +		  "Tests colorop properties with legacy commit" },

If colorop_properties() skips on !is_atomic, do we need to define a legacy subtest?

- Leo

> +		{ "colorop-properties-atomic", colorop_properties, true,
> +		  "Tests colorop properties with atomic commit" },
>  	};
>  
>  	igt_fixture {

