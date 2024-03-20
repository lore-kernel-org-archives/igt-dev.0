Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4731C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 13:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6471110FB48;
	Wed, 20 Mar 2024 13:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/vxK4U8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E0210FB48
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710940632; x=1742476632;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sAPMbuY90mhY3MBO8AbAZoNEFpYfPNrp12W08MV2V+Q=;
 b=X/vxK4U8dUbOhibLZvBge/xXp+hvCWg/DP8nbb0OG8JQbSVi3JEySKtX
 QZX2wM7T5EzL38509Bjvy8EOJNFcx4i3802LlfriYbFtM1AKU2D910Cr8
 V/iCL/vq7ueb9n2Qk48WJcDs9JGRfCjxNClmYNcbyFGlRefWFmnXvMSRx
 jEQ/tMFxnYeFr0DtS0rVnqEhyS68E/Ei0OzR5ASkzeeMn/SZjOl8A4ey5
 8wxj5lgAQuU3IALauULuexLdfAMbHgdzgWw00sBJ3Ucltrq5fQI2lOCKM
 Iaq0ykq31mVo3gZ+jvrtHxLn02qlMaZnV20bQl+81KmTjfMCiq4RVB1hu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6040436"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="6040436"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 06:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18825498"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 06:17:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 06:17:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 06:17:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 06:17:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 06:17:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PO0XfyBVqPJySYpgnfr4PxuItp+xsBV+8KN3vCN2qvfuM8AvBm5vgWWdxY9BNo6QBLsiQAw7+PVSxw9aDXmNkSCc/Q3CbxZ00Z1o5EFXv20jKUm3jgkvzziheUSn/coyXWS75ZyP2EMdOALWJzpaIhbM37XEaWsuepbvriZ0TdVtJEcrzhZknRwDb9DIwBwdJhSW1fKiOffmFq1cx1mmYEgTm2d408zm/aQ/dF5ICCBil2JcLCndOVwo+P5LOqX0foOOrJL0Kz4xukGNT3i0VNjDiLALUwXtjYctwXbVFI7XI7iq4CkFWJilDTFCV4yFShW2R+w//S2ABwBwhqAGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg1ZMQDxEAMEmffKCN1fYy29QoSu8oYSQUk4UJBCJj0=;
 b=BAFSTcUO7P+GiwVKKOwTCEXFetUEPTd/RZOLAMa6vuheNH4fzP2MMYNBl1zELfNspT7zxCgPqo6RO4WQm4FdQsOnWl9gZRsNnTwKGT/J03+j0oc+InusDVmvIscN26wFlRJ89AU/NuzCf6hzMMLk3lQcptVoc2l22a2OHVg5LMuw+AyKd5fWF884SGYirvOJcw+BlZTWFypHyN3KC3LkFj+tkIGFNCbxv6ZJyHCJbpvf1fKqxGwzPgM78gxXsWD+33ipdarZQGXI+7urEGRmxqUKBmazbm4Sx4CgLlmj8hCZiuWO8niXLdv561HNeQkoRDm0fvYKl2eoOEmlCiAahw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB8501.namprd11.prod.outlook.com (2603:10b6:510:308::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Wed, 20 Mar
 2024 13:17:08 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 13:17:08 +0000
Message-ID: <2fb4abcb-9d8f-422b-8b98-fb10847f7589@intel.com>
Date: Wed, 20 Mar 2024 18:47:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/kms_big_joiner: add tests for force
 joiner
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240310142721.874315-1-kunal1.joshi@intel.com>
 <20240310142721.874315-5-kunal1.joshi@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240310142721.874315-5-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::24) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e13ace9-2e98-4784-5258-08dc48e00b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lERC98b4Q0dBWIGKro+Konc+vI7Vf64t7O0cfL68I/STUo6Q57pIp3bZOTJTOKFzAkB+98ObQx+Hswh9/e3tRDE6JOxcl8U8HZFWVPgTrbpx2V3r4SvaqQnyTyABAsBx8pc+7UNWIPJkJJkgddcOZmDFQ1teQ4yn+GhsoieQU8QJZHr+5NvZlvFtO1OkMQAR0VOIk5ZjEzG2QjouKeo+niQxl44HzcPvAOohAYUdSZRrW1bfjS9gDlqO9n0TnjMv9d6XbUe9XwtJiZmP7wrwgj3LIfzg8Uu/LYYpr/boGB3crBpUHINEfcY0clE0dYlxYg3nKy98x9VrXQWKNs4qwozq6bsz0cJiCI2hq80e68khFy6RBMb551UI3tViYbxQUer2O/StQqLazEYJNr40Xs/tGbAIHACaVtlpizBt97n3vWpNsZNiIceY1A47eCh0QghPx+0uGzgNURTPERmi+lpQMXZwFYMZEV+fCTdqs+Rwz4AqbAiiHp5ujbArGHQuLyrkgpIJV2EqcBb5juY9YavaXb30Cb9pwCjR2qEJVwD+YKTpZsM11MVxmhBTtTKMst8lEBiCNj91AeIVvoaIkZa1+ro7uZgKZImQEk86sE7AvQeM9tXy1Aum/W7iNtZ1HgsgG1X+Bf04QbU1lXiGXXrcPLUTfrsXP6ME83du6lg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTVqbmNSMnhIcml4aGxwbnpKQnZyQVYwV2UxZUtJcHNWcjF6c0txWHhLSmlN?=
 =?utf-8?B?aHVhWUVyT0ZtQnFVOGdFWVcwcmhTVTVucHZDWTIzcDRBZ1k3S0ZJM25kRi9C?=
 =?utf-8?B?R3hTZllVbDhtTUpjUFhRYW55TFVzdmg4UkI0OXdwZGZQWm9oQk5Vd28ycjcv?=
 =?utf-8?B?aEhiTGd0T2xYTXZWVGhldWQ2Tkt3VkhwbldpZXJFbXdqNXNwRE8zaUJlekxO?=
 =?utf-8?B?VlRCU0R5QXNlWllqMFM1MDVkTm9iSnJUTHM0STdmSHhQSk4yekQ1WDZpU2Zz?=
 =?utf-8?B?NXZQM3lnNTNhbSt5SlQzMzdZT3BOM2xSQTlKN0IwTUtITU9QUmZXSkpHWExK?=
 =?utf-8?B?S3orRG4ranh5SkhWZFRNRkxTZFFVK3YyZkVZTEhFU2JQQ3BzTnpzREkxc2ZY?=
 =?utf-8?B?eW0raks0Y3prSjdpeHBBaENsNGNPd0E2RkZCU2oxa1c5cVdZMCtwUkxKNGQz?=
 =?utf-8?B?ZVJjMHFKd0VuQ1J3eGIrWUcwYVM4YTI2L2cvTU4zNHc4Um5Xb0YvNWswcE1O?=
 =?utf-8?B?cVdNb3MrZHRDWkFzTFU5bTdMWmNON1ZjRFRjMy9LdGw0eUlJSXhjei9UZ1lr?=
 =?utf-8?B?TFIzSHJyWXRGemdNdTFxNDN1aXlSOTgyU2hSZXFZSk82WlBrZVVlRFBRZ1JJ?=
 =?utf-8?B?aFBmSU5EWnNaYzlUR05Qc1V1UXJMRVB4azk1dFJBOFhaUlphOGkwUnYvTjVm?=
 =?utf-8?B?SlZ5QW9GY2lzd1NZQTlmbHhNVUxFWFlDekdTektFcjN4SmFybkMwVEZZblRT?=
 =?utf-8?B?UGJGMGhGQVc5SFBlaWQwdE03RytBKzdyQTB2Wjk2STkvSm1oR2RWV3pZS3B6?=
 =?utf-8?B?N2lHK2IxN1pKZitQYS96RXpLVHU0eTB1ZWU4aUMwTUQ2ZkNPR3FOZCsyVlN0?=
 =?utf-8?B?eHFrWDJZdHh3UEZpY0k5bFdJVGdLWDlUUFV5L3dKWE1yb1JPSE0zeTVQeTQ3?=
 =?utf-8?B?YkU3c1FGejQ3aHpkSVJpV3RwVWhUZit3VDY3VHNKUHQ5bHdqQWJpMXlGMGpU?=
 =?utf-8?B?N0lZSUt5UHFxTGlSLzNNT0VLSlVpSjlsTlNaWklJL1UzNTlpNW1KQVRLdnp3?=
 =?utf-8?B?eTQyWWZIYVZ3VkdobzBSUXhhYnlqRENkU0xJOHYzVUJtTDBXRzVVcGpBM1Zi?=
 =?utf-8?B?bVJtOVRyZGlLNUFvcW41aU9KUVFTSGpQeGM2cW9SSVZ6MEk1NUk0MWtacmQ0?=
 =?utf-8?B?alZSWHVqUllySUE3TGRWSUtaZktXZGxERy9mSnhOWUN0V3VzODJaWUJFTXJw?=
 =?utf-8?B?cURReFFkcm43d1UzNDVVbTl4MUdmN2U3QjJaOExZYUtOM1ZPU3ZKVDNtaXRk?=
 =?utf-8?B?Mnk2Q2EwN0YxWjNoMEtqZmNYYTRDSjhQQWRUeTRRZlFhZ1cvNk05VVBJb1Vo?=
 =?utf-8?B?YlZDem04c0YvVzV6RnEydklkc1JrVE9FbG5BZ3R1S29RRUtRVitoVjJzRlMx?=
 =?utf-8?B?WEFHcldacE45S0REWSs0RktHYkFjcVhLZGhlK0NnTzVxK1ZSZExhWktMbHY1?=
 =?utf-8?B?dWR3WUI5RUlXeXhkZVpkUkc5dkFERGF6alJyclhtZzVIZjlxck83MnUwS3R0?=
 =?utf-8?B?RE9iS0ZKV3JOY3ZOMGlGNGpZOTNtUHU3S09Ed0xEME1qQ0dXbjFwS2t6SUVv?=
 =?utf-8?B?eE9MOTloRm9UZUNmMWw5b0pKNTJteXBCWXpVWUpJTTFFU1hzbG10UXdtVGFF?=
 =?utf-8?B?cTJDcjU4UFhxYVZCdm1HS3dSRHVudWNVRUJ4ek1rUkdudU5tYjRURU9lRzJM?=
 =?utf-8?B?NjYyRWE1UUxtYjkwaW1CU2dwWk90SndFTUlwZDZrUTJTeElpR1YvdGVHSk1P?=
 =?utf-8?B?SlEvZlBUVUVDYmQvMEFWM0c0VmVDYnZ5S0pYN1YzSGlGTm9oR05jUHJrSEVz?=
 =?utf-8?B?Z05VdzhUTktjNk9QM2ZpQml4MTVmdmxnS3gvQUd0dUZyMHZwQU9wa3BERXZT?=
 =?utf-8?B?aEN1Si85MThrWlk4ZVNQNjZlcEZyQ3JNWDhWUTM0TW9yOFJUbmtQcG9DdEJu?=
 =?utf-8?B?KzNBazFtYWZUVmNEcWg1S1VmMEVsYS9WTHJ0Rk5IZHQvS0U1MGVvSDIzTlU3?=
 =?utf-8?B?aThsaUQwZVNNVjQ2ZHp1a01VdGFCYnpPQjQ3SzAwa1dvZ1kxd0toaExHb1Y4?=
 =?utf-8?B?VUZIdmszVTVtTWVPWHA0NTVmSVpxK0xPSFFOZnc4VWVGR0t0d0xXOVVTTDU4?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e13ace9-2e98-4784-5258-08dc48e00b62
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 13:17:08.1550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 587HecaOysPFHN4julQ776EBy97/UmxbZIpLgEM56jSNR+rO82j8zsa9O6W4tZAjVrJkGfg9s3IB9JKkf39k3XJw35l2eHrmyRuqFBQaKBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8501
X-OriginatorOrg: intel.com
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


On 3/10/2024 7:57 PM, Kunal Joshi wrote:
> add tests for force joiner
>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_big_joiner.c | 101 +++++++++++++++++++++++++++++------
>   1 file changed, 85 insertions(+), 16 deletions(-)
>
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index d4b0d1100..6017b30cd 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -44,13 +44,20 @@
>    * SUBTEST: basic-bigjoiner
>    * Description: Verify the basic modeset on big joiner mode on all pipes
>    *
> + * SUBTEST: invalid-modeset-force-joiner
> + * Description: Verify if the modeset on the adjoining pipe is rejected when
> + *              the pipe is active with a force joiner modeset
> + *
> + * SUBTEST: basic-force-joiner
> + * Description: Verify the basic modeset on force joiner mode on all pipes
>    */
>   
> -IGT_TEST_DESCRIPTION("Test big joiner");
> +IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
>   
>   #define INVALID_TEST_OUTPUT 2
>   
>   typedef struct {
> +	bool force_joiner_supported;
>   	int drm_fd;
>   	int big_joiner_output_count;
>   	int non_big_joiner_output_count;
> @@ -90,6 +97,17 @@ static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t id)
>   	return NULL;
>   }
>   
> +static void toggle_force_joiner_on_all_non_big_joiner_outputs(data_t *data, bool toggle)
> +{
> +	int i;
> +	igt_output_t *output;
> +
> +	for (i = 0; i < data->non_big_joiner_output_count; i++) {
> +		output = get_output_by_id_or_assert(data, data->non_big_joiner_output[i]);
> +		igt_force_bigjoiner_enable(data->drm_fd, output->name, toggle);

Perhaps we should check if the force enable was success.


> +	}
> +}
> +
>   static enum pipe get_next_master_pipe(data_t *data, unsigned int available_pipe_mask)
>   {
>   	if ((data->master_pipes & available_pipe_mask) == 0)
> @@ -98,7 +116,7 @@ static enum pipe get_next_master_pipe(data_t *data, unsigned int available_pipe_
>   	return ffs(data->master_pipes & available_pipe_mask) - 1;
>   }
>   
> -static void test_single_joiner(data_t *data, int output_count)
> +static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
>   {
>   	int i, ret;
>   	enum pipe pipe, master_pipe;
> @@ -110,7 +128,7 @@ static void test_single_joiner(data_t *data, int output_count)
>   	igt_fb_t fb;
>   	drmModeModeInfo *mode;
>   
> -	outputs = data->big_joiner_output;
> +	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
>   
>   	for (i = 0; i < output_count; i++) {
>   		output = get_output_by_id_or_assert(data, outputs[i]);
> @@ -121,7 +139,8 @@ static void test_single_joiner(data_t *data, int output_count)
>   			master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
>   			if (master_pipe == PIPE_NONE)
>   				continue;
> -			igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_name(pipe), kmstest_pipe_name(pipe + 1), output->name);
> +			igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_name(pipe),
> +					 kmstest_pipe_name(pipe + 1), output->name);
>   			igt_output_set_pipe(output, pipe);
>   			mode = igt_output_get_mode(output);
>   			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -134,7 +153,7 @@ static void test_single_joiner(data_t *data, int output_count)
>   	}
>   }
>   
> -static void test_multi_joiner(data_t *data, int output_count)
> +static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)

force_joiner is not used in this function.

Also there seem to be an overlap with test_single_joiner, so there seem 
to be some code we can take out as a separate function, without 
compromising readability.


>   {
>   	int i, ret;
>   	unsigned int available_pipe_mask;
> @@ -158,7 +177,8 @@ static void test_multi_joiner(data_t *data, int output_count)
>   			if (master_pipe == PIPE_NONE)
>   				continue;
>   
> -			igt_info("Using pipe %s as master %s slave for %s\n", kmstest_pipe_name(pipe), kmstest_pipe_name(pipe + 1), output->name);
> +			igt_info("Using pipe %s as master %s slave for %s\n", kmstest_pipe_name(pipe),
> +					 kmstest_pipe_name(pipe + 1), output->name);
>   			igt_output_set_pipe(output, pipe);
>   			mode = igt_output_get_mode(output);
>   			primary[i] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -176,7 +196,7 @@ static void test_multi_joiner(data_t *data, int output_count)
>   }
>   
>   static void test_invalid_modeset_two_joiner(data_t *data,
> -					    bool combined)
> +					    bool combined,  bool force_joiner)

Here too force_joiner is not used.


Regards,

Ankit

>   {
>   	int i, j, ret;
>   	uint64_t *outputs;
> @@ -209,7 +229,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
>   	}
>   }
>   
> -static void tets_big_joiner_on_last_pipe(data_t *data)
> +static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
>   {
>   	int i, len, ret;
>   	uint64_t *outputs;
> @@ -218,8 +238,8 @@ static void tets_big_joiner_on_last_pipe(data_t *data)
>   	igt_fb_t fb;
>   	drmModeModeInfo *mode;
>   
> -	len = data->big_joiner_output_count;
> -	outputs = data->big_joiner_output;
> +	len = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
> +	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
>   
>   	for (i = 0; i < len; i++) {
>   		igt_display_reset(&data->display);
> @@ -247,6 +267,7 @@ igt_main
>   	data_t data;
>   
>   	igt_fixture {
> +		data.force_joiner_supported = false;
>   		data.big_joiner_output_count = 0;
>   		data.non_big_joiner_output_count = 0;
>   		data.combined_output_count = 0;
> @@ -274,7 +295,10 @@ igt_main
>   				data.big_joiner_output[data.big_joiner_output_count++] = output->config.connector->connector_id;
>   				igt_output_override_mode(output, &connector->modes[0]);
>   			} else {
> -				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output->config.connector->connector_id;
> +				if (has_force_joiner_debugfs(data.drm_fd, output)) {
> +					data.force_joiner_supported = true;
> +					data.non_big_joiner_output[data.non_big_joiner_output_count++] = output->config.connector->connector_id;
> +				}
>   			}
>   			data.output_count++;
>   		}
> @@ -297,10 +321,10 @@ igt_main
>   			igt_require_f(data.n_pipes > 1,
>   				      "Minimum 2 pipes required\n");
>   			igt_dynamic_f("single-joiner")
> -				test_single_joiner(&data, data.big_joiner_output_count);
> +				test_single_joiner(&data, data.big_joiner_output_count, false);
>   			if (data.big_joiner_output_count > 1)
>   				igt_dynamic_f("multi-joiner")
> -					test_multi_joiner(&data, data.big_joiner_output_count);
> +					test_multi_joiner(&data, data.big_joiner_output_count, false);
>   
>   	}
>   
> @@ -309,13 +333,58 @@ igt_main
>   		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>   		if (data.big_joiner_output_count >= 1)
>   			igt_dynamic_f("big_joiner_on_last_pipe")
> -				tets_big_joiner_on_last_pipe(&data);
> +				test_joiner_on_last_pipe(&data, false);
>   		if (data.big_joiner_output_count > 1)
>   			igt_dynamic_f("invalid_combinations")
> -				test_invalid_modeset_two_joiner(&data, false);
> +				test_invalid_modeset_two_joiner(&data, false, false);
>   		if (data.combined_output_count)
>   			igt_dynamic_f("combined_output")
> -				test_invalid_modeset_two_joiner(&data, true);
> +				test_invalid_modeset_two_joiner(&data, true, false);
> +	}
> +
> +	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-force-joiner") {
> +			igt_require_f(data.force_joiner_supported,
> +						 "force joiner not supported on this platform or none of the connected output supports it\n");
> +			igt_require_f(data.non_big_joiner_output_count > 0,
> +				      "No non big joiner output found\n");
> +			igt_require_f(data.n_pipes > 1,
> +				      "Minimum 2 pipes required\n");
> +			igt_dynamic_f("single") {
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +				test_single_joiner(&data, data.non_big_joiner_output_count, true);
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +
> +			}
> +			if (data.non_big_joiner_output_count > 1) {
> +				igt_dynamic_f("multi") {
> +					toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +					test_multi_joiner(&data, data.non_big_joiner_output_count, true);
> +					toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +				}
> +			}
> +	}
> +
> +	igt_subtest_with_dynamic("invalid-modeset-force-joiner") {
> +			igt_require_f(data.force_joiner_supported,
> +						 "force joiner not supported on this platform or none of the connected output supports it\n");
> +		igt_require_f(data.non_big_joiner_output_count > 0, "Non big joiner output not found\n");
> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> +
> +		if (data.non_big_joiner_output_count >= 1) {
> +			igt_dynamic_f("big_joiner_on_last_pipe") {
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +				test_joiner_on_last_pipe(&data, true);
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +			}
> +		}
> +		if (data.non_big_joiner_output_count > 1) {
> +			igt_dynamic_f("invalid_combinations") {
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +				test_invalid_modeset_two_joiner(&data, true, false);
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +			}
> +		}
>   	}
>   
>   	igt_fixture {
