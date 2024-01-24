Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45A6C47422
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 07:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9253810F626;
	Wed, 24 Jan 2024 07:55:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C9C10F626
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 07:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706082925; x=1737618925;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gmDkR3vIhOfCUyRwlCZcIr/FYqqiBGoIe/tqilvmH6U=;
 b=foVTQAQvnaQCb51V940B9NUqo1RJIM7V0JbJo5DNr8rntc+Kc7qlCXOE
 ACpgdEku2abdaIvB06kLJwJJAdvVfF6ZujJRiOq+iA9hE/vJQRrzd+4PP
 y98E2hR7ZZnE4ZtR1UUJFGHRO9dWc4BvGoBZGE9316koryRsMBLX+72RZ
 u7RPLvy/CCgQ8E01JUPEwzYm2XgF4PoSsCkH/Eff5YIO7a5qnaPhAEsT9
 LmYvwRB9pK8Tovk323JHrINBndyfqFGGS4XPA06v5irlFJtfO8rG+5k7O
 yOR4e8axWDkf9U7lU9YcKEehDp2ItKM2PmIOsanQaBsv5Bzb+ThrmCwgM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8422872"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8422872"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 23:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20644099"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 23:55:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 23:55:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 23:55:21 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 23:55:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmRv0G+QpUIQAmcZjgIaPSMByhvy0Z89VMUSxLAQZEV1apRktmswfan5GiU+reKUHDYXzEk/h4ik7XNjF1rLc54fcAT3K5nuVNzQTlD4xSo8AkTuCb1S0zgdf3dDmImQjYMjqY5Fn5f2vc4lCFsoGCxnjt13Xv8aCNb5LDNpBA3fMrtPBwo2hglHdZY9OjZwkE6jAuSoC/lz8QCnlEQmVgZjWBagPAyGTAJKL/fQGde9h+G88M/D7wkZBHYgplDH8SpiT191Q0h1vVAwDXLtUib5pZ62jetIQ7SCAhQVX8/31sJTlfX3dReeEEytlAXHPT75+ltfKQosf1N61QewpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E30Qi9HY+0a5mVztP2Lm+C8LJpbGswWBrGeqI2pq7E0=;
 b=SzaeGiOj4z6fUVfd2teq3bR+YAAKtp28sjzXwHrr9nasrrmVb3NXIAnL48rtNM8yOOFaZmG56Y0a9VaTTEbsBbMIc64DUbv3lDB5WNQAHrY65rFfcWP69CfkZM+D1GVJU6JLX7fNJiqZQjo0qEfjmLwrGB6EakYZKE8DhRKhky7eIt9vhkVOmm+3CLk97f6O8q8kKyUtE0N3KnbgnMpeW2Iv/zmUtpC9b7ygNRNAuoQ9O+U1begZAgRd1Eu9IWkmDktTjtZZqaoNYzvsxQ5wna+Jany2VRhTAGEPf7knHjTJRQ04xBF4tQ8acPzJ7o4dqfsOBp3D9e7QNVLYjZ2YiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CH3PR11MB7893.namprd11.prod.outlook.com (2603:10b6:610:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 07:55:13 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb%3]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 07:55:13 +0000
Message-ID: <57317e40-9c36-42c6-bf2c-dfef86377e4d@intel.com>
Date: Wed, 24 Jan 2024 13:24:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_big_joiner: add new test to
 validate force bigjoiner
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240118161847.1001234-1-kunal1.joshi@intel.com>
 <20240118161847.1001234-3-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240118161847.1001234-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CH3PR11MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9b2574-9643-473c-c49f-08dc1cb1cbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k3pKssdAbBDhgQDBsva3JCcsR4VeM2kFyUi4pMBfQSwEqIcckunOcblDrA3mqA21PUZCDjb6k1rncNag7LWy/5BcTxWa1jFZyqnryI8Hiv/XiwMvWGKRkVRsJseU753KTE7Ys1OYQ4AaHgfczXqvZFrziAK8NVnCAwWuFWRWspnTd1c8klVEvGLUBCdf+w/MmspYXsarnPJk49C1cMHqGdwCM7fi9fVE5QmgOF3UGWmyzFYkQyarVddgfaSM3dKSchCwkZ9LAJoHpiOEHPwgUMMpTTLNtt5fZF8LdJ/02QQZbjn9VwlTvxvh0yWZAC+pnit9sv+rauOEEmbph3nmQSGREa9zID2emnZ532neQC0tyq52yqt2C0Hs9VR9s0ATDxucRCQZaybWi3fCG/ObHY9i1nMnbNvU2O4RIoIpE9nr4hACUUk56BYT/DhMVqfY2DLzEC1ZmOkoDf6qVPYbfDjexvBsYyT3n+15Hz+J/QixEGUdNgIc5DmEzH+yq6Ala2Rz1DFjnasofpmlkPYAvJ/8EvwDgfWBhSGfr7wbYf1pO6BciQw8HDfTnxmpywQH8edQGs02B5svheIpJzLfoTU3F4RXiHaOa/h2eplkRjwxv0hFJ/s6/Ur5J3Rat8vg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(31686004)(83380400001)(41300700001)(36756003)(82960400001)(86362001)(31696002)(38100700002)(6512007)(2616005)(26005)(107886003)(6486002)(966005)(54906003)(66556008)(8676002)(6506007)(53546011)(66946007)(316002)(478600001)(6666004)(66476007)(4326008)(8936002)(15650500001)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW5CTmRlT1VoUElyNDF1U1pQS2FiM2l4MzRGbDBjTnBRYWFRZXBQWVNCWjNC?=
 =?utf-8?B?NGVzdjRadWNDcEFLMmU5VE03cnJoc0ZFZkk0aklTeko3ZnlqbHd1RFRSazdE?=
 =?utf-8?B?SVhEN2c5YnY2REV5aVA4dW9hMFBqRjdMaEZvU3hjR01SSzIyNTgwYWRHRW5u?=
 =?utf-8?B?WlNsYnlzU3RoUzFkWmtwMVJrdlNKSXo3K0ZBN0JISWc2bmQ3eTZ6L1FRYnRv?=
 =?utf-8?B?THo2RHgybnN3SkpRUjBBV0RyMjRlWHpCbHR0Wk9XbERoREdaZmFPRllaSWp0?=
 =?utf-8?B?Qk5DdDRSRHNSNG55YzZ0RWNjTTFyYkJZSG5Bd09aMTdJa3RuWk43WmkzSW1T?=
 =?utf-8?B?Y0pmK3M2b1hpam9wa1ZaWmlVOWxqalo5L0ozZUx0VnBnRTNjbzVaYkQvcXY2?=
 =?utf-8?B?U2Uzek5pa3lVSSt6UXA2ZXQrRUlrdGRsUy9iTkpDUTdRcGM2MnV6Y1E1VU5i?=
 =?utf-8?B?UWNucE1BcWNjWFlLSERtU0wzeUZuYjZxbTMyN3dEVFJGTTEySnpWZUpBYWVy?=
 =?utf-8?B?eXE0UFN2b0JzZmt4QVdXVGprU0tuSEI0KzRNSTZtLzNVM1ZVRjg1aW16QXB4?=
 =?utf-8?B?ZmZkN1dCK3lHTWlSUHkrNlU4RXliNmluT3ZmUEw0M3BadGp5V2k3ZWowaGhF?=
 =?utf-8?B?VmpLNmlPa0JtNlQrVDBoTHBsWHc3dXkzMThjRUJrZ1Y3NHBNVDBKak9acW1T?=
 =?utf-8?B?NlFOV1dhZDBCT3JoM1QwY2liNXp4QXNra09tR0U2ZDV0V3dIalpMdHFENTk2?=
 =?utf-8?B?NlUwZU9IZGgvZ0FPb3pvbGQzbWJWUW1IclU0eWlzSUU2UDdzTnlDZlQzR24y?=
 =?utf-8?B?Q084QytFL3ZCSnNiUVRGL0ZYN1VCcnR6OFhpcjNWZE91YVhxYmZGMnYvMzN1?=
 =?utf-8?B?T3Q1ZCtzZDJEeUxzK1pRelpGYWhUYXJtdmRDaTJ2U0IxbmtWdkJCUmZxOG44?=
 =?utf-8?B?Y2ZCZXRQWTR6SmF1NmZ4N1I0em40cXAxTnZYMFphRUlIeVkxbUxjQjR2VHFV?=
 =?utf-8?B?ZGdsRU9UeUx6OEpWa2FzeUpXcE9OUGVJTWFiUHF6MEVxMlAxNHNaK2xscVoy?=
 =?utf-8?B?QWxFY1dnUzZsSFhnWnE1a2JnQXhJalRCOVkxbVVKSU4rWHJKRC9iTTZZK3lZ?=
 =?utf-8?B?MTNEL0R0SWd5ZDltdzVmZ2ljS3RudTVISjYveVozRnVRWnFMWEVtbHYydnEv?=
 =?utf-8?B?a25LNCtBUjd6VjZuUHBxV2VLaWJJWEl4cENoRGhMdjlUYVlyazFYaUZZSm9u?=
 =?utf-8?B?VEZ3R1NqMUk4enpqaEtLY0pJRDcxeHRZK0FvTysrdzh2dXhVUUtadUhPQjZD?=
 =?utf-8?B?cHZyRDNYTzNOQVZTZ0JnYllYR2t5RFlRT3Qwekd2b2NZbU1rUldiRU5pNUox?=
 =?utf-8?B?QmtEbml1OE1EeDVzS3V5aTRpOU1uV043blNFVFY0eXR5cXFjbXdIUlBnaGpQ?=
 =?utf-8?B?ZGFOWXFjNzV1YWpwR2E1ZUxFR1VmeEJCSjlKRS9tVHZ6bUVYdVlKbnRJdkZT?=
 =?utf-8?B?cURtUFQ5QS90VlliWU9MTWxTbFYxQUwxNzlQRkRrc0gwM1lTSXh2NHhjYS84?=
 =?utf-8?B?WnFsWnA2alJIOXJITHdhbTd2ZjR1YnlNZ1NuMEVTWVdMT0Z0Znlyckp5V2hS?=
 =?utf-8?B?dFR2OWFoU1dzRE9tTGJtTEw4eGdERndBYk85eFZRdUJtTFZGbnV6aDZzdyto?=
 =?utf-8?B?N1pDY3RnYW1vNEg4UTdLOXdnRGQ1STc3OG5XQm5nOFlQaW9PNHBGN1JNVnZW?=
 =?utf-8?B?aXVwbnNsWmlOYlY2bURDVXljbTN2cStiRXNMa3NjRlRHV29KV09CQm1pTmZr?=
 =?utf-8?B?Z1NIRmx1d0VLSFhKZTRJQU1INVBlejRCRExFTGN6d2U0RytiNldUR05iWGM0?=
 =?utf-8?B?ajY5dGRkVWYrV1ZzMXl1T21lYUF3VmJQOGkyS3pubnhBdEpSQUhYWUJZQnFY?=
 =?utf-8?B?MTNoY1FxS25ZZElUQkprNHNOVHRCc3h1WUxrVnU5ZjNjM1o5TDBXMVplNFA1?=
 =?utf-8?B?dnBpcFZQRWRvd085ay9UOExnL0NvejgyamF1REdMVDhsOXZHZUlja1hZMDkx?=
 =?utf-8?B?cG5wMHdGMWoyWXNGVzNhSnVtVVlpdzhOaGRrZEoxcnZRZkFDTDBOTU5CVHJm?=
 =?utf-8?B?ZlNld2VFUVhqdjRXTnRabnhMNGdpYlJEZHJleU1EN2thdjl1UHJ4TkQxeU53?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9b2574-9643-473c-c49f-08dc1cb1cbb4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 07:55:13.5469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2W9Mn0SjL3ihGrmXl5Dat5B8kI0u1qz6h/j/egxigKSNctI8oYwDh2FEBWOabJ0Xb9wBvwp7Hvq/pNd2/qgEFvC3ywdpKbH/lN0Gnrq+sd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7893
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

Hi Kunal,

On 18-01-2024 09:48 pm, Kunal Joshi wrote:
> Earlier bigjoiner was enabled only for below cases
> a) for mode having hdisplay > 5k
> b) if clock requirement were higher than 1 pipe could handle
> 
> https://patchwork.freedesktop.org/series/124730/
> With above series we can force bigjoiner without such constraints.
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_big_joiner.c | 92 +++++++++++++++++++++++++++++++++---
>   1 file changed, 86 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index aba2adfbe..bc1c49023 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -46,8 +46,10 @@
>    *
>    * SUBTEST: 2x-modeset
>    * Description: Verify simultaneous modeset on 2 big joiner outputs
> + *
> + * SUBTEST: force-bigjoiner
> + * Description: Verify bigjoiner on non bigjoiner outputs by force
>    */
> -
>   IGT_TEST_DESCRIPTION("Test big joiner");
>   
>   struct bigjoiner_output {
> @@ -67,6 +69,23 @@ typedef struct {
>   
>   static int max_dotclock;
>   
> +static void force_big_joiner_on_all_outputs(data_t *data, bool enable)
> +{
> +	igt_output_t *output;
> +
> +	for_each_connected_output(&data->display, output) {
> +		/*
> +		 * Force big joiner on output
> +		 */
> +		igt_assert_f(igt_force_bigjoiner_enable(data->drm_fd, output->name, enable) >= 0,
> +			     "Failed to %s big joiner for connector %s\n",
> +			     enable ? "enable" : "disable", output->name);
> +		igt_assert_f(igt_check_force_bigjoiner_status(data->drm_fd, output->name) == enable ? 1 : 0,
> +			     "Failed to force big joiner on output %s\n", output->name);
> +	}
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
>   static void test_invalid_modeset(data_t *data)
>   {
>   	igt_output_t *output;
> @@ -107,6 +126,53 @@ static void test_invalid_modeset(data_t *data)
>   	igt_assert_lt(ret, 0);
>   }
>   
> +static void cleanup(data_t *data, igt_output_t *output, struct igt_fb *primary_fb, igt_plane_t **primary) {
> +    for_each_connected_output(&data->display, output) {
> +        igt_output_set_pipe(output, PIPE_NONE);
> +    }
> +    force_big_joiner_on_all_outputs(data, false);
> +    free(primary_fb);
> +    free(primary);
> +}
> +
> +static void force_bigjoiner(data_t *data, int simultaneous_bigjoner)

Instead of writing the new logic, let's try to utilize the existing 
infra. All we need to do is Fix the logic (force bigjoiner) to identify 
the selected output as bigjoiner supported.

- Bhanu

> +{
> +	int no_of_outputs;
> +	drmModeModeInfo *mode;
> +	igt_output_t *output;
> +	igt_display_t *display = &data->display;
> +	enum pipe pipe;
> +	struct igt_fb *primary_fb = malloc(data->n_pipes * sizeof(struct igt_fb));
> +	igt_plane_t **primary = malloc(data->n_pipes * sizeof(igt_plane_t *));
> +
> +	igt_display_reset(display);
> +	pipe = 0;
> +	no_of_outputs = 0;
> +
> +	force_big_joiner_on_all_outputs(data, true);
> +	for_each_connected_output(display, output) {
> +		mode = igt_output_get_mode(output);
> +		igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1.0, 0.0, 0.0, &primary_fb[no_of_outputs]);
> +		igt_output_set_pipe(output, pipe);
> +		primary[no_of_outputs] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary[no_of_outputs], &primary_fb[no_of_outputs]);
> +		igt_info("Using (pipe %s + %s) to run the subtest with mode %dx%d@%d.\n",
> +				kmstest_pipe_name(pipe), igt_output_name(output),
> +				output->override_mode.hdisplay, output->override_mode.vdisplay, output->override_mode.vrefresh);
> +		no_of_outputs++;
> +		pipe = pipe + 2;
> +		if (pipe >= data->n_pipes || no_of_outputs >= simultaneous_bigjoner)
> +			break;
> +	}
> +	if (no_of_outputs != simultaneous_bigjoner) {
> +		cleanup(data, output, primary_fb, primary);
> +		igt_skip("Can't test all outputs\n");
> +	}
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	cleanup(data, output, primary_fb, primary);
> +}
> +
>   static void test_basic_modeset(data_t *data)
>   {
>   	drmModeModeInfo *mode;
> @@ -257,24 +323,27 @@ igt_main
>   			j++;
>   		}
>   
> -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
> -
> -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>   	}
>   
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>   	igt_subtest_with_dynamic("basic") {
> +		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
> +		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>   		for (i = 0; i < data.n_pipes - 1; i++) {
>   			data.pipe1 = pipe_seq[i];
>   			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
>   				test_basic_modeset(&data);
>   		}
> +		igt_remove_fb(data.drm_fd, &data.fb);
>   	}
>   
>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>   		     "when the pipe is active with a big joiner modeset");
>   	igt_subtest_with_dynamic("invalid-modeset") {
> +		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
> +		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>   		data.pipe1 = pipe_seq[j - 1];
>   
>   		igt_display_reset(&data.display);
> @@ -323,11 +392,15 @@ igt_main
>   					test_invalid_modeset(&data);
>   			}
>   		}
> +		igt_remove_fb(data.drm_fd, &data.fb);
>   	}
>   
>   	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
>   	igt_subtest_with_dynamic("2x-modeset") {
>   		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
> +		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +				      DRM_FORMAT_MOD_LINEAR, &data.fb);
> +
>   		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
>   		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
>   			data.pipe1 = pipe_seq[i];
> @@ -335,10 +408,17 @@ igt_main
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
>   				test_dual_display(&data);
>   		}
> +		igt_remove_fb(data.drm_fd, &data.fb);
> +	}
> +
> +	igt_describe("Verify bigjoiner on non bigjoiner outputs by force");
> +	igt_subtest_with_dynamic("force-bigjoiner") {
> +		for (i = 1; i  < valid_output+1; i++)
> +			igt_dynamic_f("%dx", i)
> +				force_bigjoiner(&data, i);
>   	}
>   
>   	igt_fixture {
> -		igt_remove_fb(data.drm_fd, &data.fb);
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
>   	}
