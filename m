Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F019FC54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 11:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B01311306B;
	Wed,  6 Mar 2024 11:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MFtHlrNc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87D311306B
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 11:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709723299; x=1741259299;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zX1aunrYVm2qAL+ioWHI8OQ3wT5KP1NEAr4QQaqssOs=;
 b=MFtHlrNcW5eF9i1aOJVp7552EUF/Kckfq/Im9gzDIz4LxUhYcx34heOT
 i7eAvCmeBzwoenfigtoU54TxCxJH/XgLR9N3gKZ9p7zVTq8TncnAGT7/G
 iXMszEvMCFuvCO9YxRVAwZo8p3ICxaODHkNpss5YXsws0Y6M6AcIkQd9G
 o2ddGKxdnzJ856Wc/W3qcC8f16gNk+8yvD8TAziYs6uz7lkkt3a008Sjt
 QcuYTzHR4bTaWAodddhorArC6Oq1lEbRr4nB5f8/rQxeSbrugkHYPZtk4
 cLtcTdgNed1b0oenngF7w9ol8AZmyb8ewu80XYv9IC1RfsfKYzjVreBL7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4190646"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4190646"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 03:08:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="14383919"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 03:08:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 03:08:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 03:08:17 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 03:08:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hqfx5OtiQ69YulejybWsJHcR40/s7lCjmTax894WxL6xECRrWrW3uNnQldY92JtQrqSaT/BmmF9tMOtn9cJGxBQTvMY+t5KAOqHW8R2whlEm776GnB6CnXScqIIaimX2t3TpaG/egNxyLL6B4W/z4XdPFHQGN1Btr9By/OLMaAm7QNyXfFHnF56TCL13tCQyoA16QMn9OwX48y7dAhem4AujA3HO/+sGNtYmMHQAfz86LML1B8duVgvzpJtfwIUbXPFX/SjQunueXN2ehvs/ab2dGk1lrll7mYo0jLHAgnWFI2OpCZKZQIlWSGgWfkphGnvTJIFG7IomzrlDPFQcPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKZjaL0Axnv3z1esErx643cGcFjrquti7s3PZBhpyuA=;
 b=biBSygFrSdamVZQnfExT6xbDQRsi+669pFiWJgcpSmuZ3pR4lvM7xZjWt5qhwNeuWqbn5S1KYaVa/ZJUiFSB/LI2IXHMDtvm9MupcBUzN4W+HPe/8SQdZXP4nkTIPvTp86g/gzuz5XIfuG7oRtxK9KnTdSdITKHohNbFJVAHp/Lk4Mjwt7x5JvN7qOMMRrehBPNYyaTFzogtkYrNSlwpmF9VEhFihGtFwNLT9thd0o8YbtnxaGgdDZ8q+l4CBYxtPnTjCI7Nb2fMmdzgQey2xbE1IV92H8gau6W0grcEKkGu+7FTJWurVJjpV1tJws5eYoJywLIiyjvTu6XKtkkx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ0PR11MB7156.namprd11.prod.outlook.com (2603:10b6:a03:48d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.24; Wed, 6 Mar 2024 11:08:14 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::e763:85a4:b747:67b2]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::e763:85a4:b747:67b2%6]) with mapi id 15.20.7386.005; Wed, 6 Mar 2024
 11:08:13 +0000
Message-ID: <58e28ff9-595d-401c-8dd6-1b423666ee33@intel.com>
Date: Wed, 6 Mar 2024 16:37:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_big_joiner: revamp
 kms_big_joiner
Content-Language: en-US
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>
References: <20240306052509.717026-1-kunal1.joshi@intel.com>
 <20240306052509.717026-3-kunal1.joshi@intel.com> <Zeg9KosfNa0Lld1C@intel.com>
 <2d71c76c-8205-47c3-9c5b-57671296eddc@intel.com> <ZehGg6Vkqv06MbzN@intel.com>
 <ZehIqcSsnbUieLjJ@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <ZehIqcSsnbUieLjJ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::13) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ0PR11MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: e7812763-5153-4e15-eb06-08dc3dcdb759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cYh2moKH+f83/YoNPMUj5fM25pTyBe5FHpL0RGBYU4fsrW/6K879hkVKGQzMC+IWg011m8KjZCKWMY64estrtmsI3FvWMiJuCxtH1WOVF0ua4wPtxDlJaUvPZC2WTuOPZnYEfIIKtoaSWBxY0FtnMxfPrXwruDLy90cQ9IswYO+AvjYWBjyLgfDqSyG51ct+2zHU4iDJoaX3xcPbf2V7TstPgVC7qSuOvKZvOetv+bJYV9F13h0eYpuh6eo712KYHcElm25LBM31yOCTaRDUhzBXlojhEKdHAJ4t/G/EqF/knwLQzDAO1kes984Mn1DLC2dJQHCgdCLSepcoi64o3+GEue9BfdmPQ+Z8m4EjOoXPpNKs1illtDjJU1nTr4P3Flg4tjBo0ou3VVO3G8PnILAQmJI7uyrBCd2rkNt/YJOfSelti6tS2os9NCma1xUWG2BndHg1WqjhiFOgf94zofZsdRn9a4A94+x542Jv47fqbdMrddf9JYNc8iXZ+qBShR41e0IwkY/sRQfkfvKEps7CufoIr+6wO5XB6fFXIaye1FO1n5a60rUD2UhGo0l6cpi0JgdeSf4sBKJMxKzvniAm9NUdXXCSsP7bXQ6J/hzE/nMYKdz3rnGjn/h7dm0Sei0H3CU+CMEiur7T4BDYGsl4WwuEb4FgBPOaR7tMXzc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm5mdSsyODhoVDFtVDYwZEJ2SXpoMGdvQTdBVnlDVzFjcHZiNE9DNDJUeXVD?=
 =?utf-8?B?MElWQVB2WmRKWlphdFByVFMxL0Z1bmRMZHZqNE9uMEpYWkNaOUF5VmRDWUlG?=
 =?utf-8?B?eGk5VFNFRE9sNFNhcWQ1Z3pNK2FjMUlQa0cweVNkNkJwYzhVTVBFWTAvYzJo?=
 =?utf-8?B?dnp0VXlVUjFWUmk5V2lETFVBaDl6dUcrQ2lsTFFhVExJYndqWkFkK2p3c21r?=
 =?utf-8?B?bnlEOXNEYXJSMng4dGp5K1NrRlFJNGZxd0JaMklOdDFVYXptQmlBMmxVdW1M?=
 =?utf-8?B?a056YkxQaDJUeVhUbzE2bC9hWU9zbzNEaVNuMnhtem9ZZnM4dGVMc2R4RVJJ?=
 =?utf-8?B?YUFKQmEvczVFZEZPNTBQWDltYUxIclpjMGdSdWtDc292TGRFVkZJUUlrRXNK?=
 =?utf-8?B?Z3RyWWFmdkx4SlBTcFM2MDdqUEp0TjJSNlNwSFJpU3M3bUZLZTRPd2pPWWRL?=
 =?utf-8?B?MFFMb2p1UzhoYXA2ZEtCY1paUHJmZkMybHM0b0NCU1dpSmhMK01ma2tZZXY5?=
 =?utf-8?B?VkJodDBtUkVYZ2E3RGwyZlNuUTFHSnAzYzdRa2puVTArVXZXazRoZWFmTG9j?=
 =?utf-8?B?TjZVN2NRSHJwZ3ZRNVVEbllaYUR2ZXZFWW5McFUrQmQ1UzFmNmphSHR2MHg5?=
 =?utf-8?B?alJlaXdsc3FmUVNQeGRQQnFwM1dFUjdwdXpoWEZUdDVrL0VYYS9pMFZkU3pG?=
 =?utf-8?B?aFFDRWcrMlM1NHlkSHIzcG56VTFpWTRjWEdNK29rUnNtOGxlZGhidWVPMDN3?=
 =?utf-8?B?VU9kRnVkNFQyTkpkSG1naTRubGNneXZFcTFTcWkzVGNIcEMvV0NMdXpVQ2kz?=
 =?utf-8?B?U21uR21SQ0t1RmxRdXMzd0NtV1RvQmlpZDE1UTR0RUNyaElwV0pjSC80cVpP?=
 =?utf-8?B?QlVLV3A3RjdpVWhLTXdZWmhRZWprTmx6dnR2NnVCMVQ1OC9xMkRnMDFvcGRH?=
 =?utf-8?B?c0d3OTVnL01WOWcyd3JjQm9iM3NKSUdQTHpGa1BhQmYyRzJFS0ZucFd4Y2x1?=
 =?utf-8?B?dmVLUUJlNUI3akZtcmhhb0htbmhVYTE5Und2ampYeHQxZDd2cEJDckFnMFNW?=
 =?utf-8?B?eC9jSzRmdDVsMGZZYzk3L0RiV3I0RkZTeHYwK2lhTWg0QkN5VFk4dFB6MnFS?=
 =?utf-8?B?TVIybHFhcmxCQzc5eklQa0pWNGliZG5JemxqM1FDNDhOMlI2b3lPb0VQajc0?=
 =?utf-8?B?UlVDY1hlbnhiR2FUbFBtQlBUTmQzU0RBbVA5OVJ2ZThrRDMrWGN3S05EeWs1?=
 =?utf-8?B?UFZEZGdYcFdtZUE2VFpmLy8rZk9HZlBEd3hsTnM4eDZhT2pDamZnQUVSSTdQ?=
 =?utf-8?B?Q1hVbUwzRW9ONWhJMERPWjJGQmg2cDc5S2UrcHQvczl0c3lReitxMjcrZHpN?=
 =?utf-8?B?SllJSHhoVGdFWWUyTTJ3UjB3aUxPY3l5NGVvZ0R1WmYxaUJ1R3NCSFE3Szls?=
 =?utf-8?B?SC9iUTJtQjlFOFVROHJZa0JjSTZWZWNNK2pSTndJQjljK0VCR2l0YkNNckNY?=
 =?utf-8?B?K1I3S09VQTdQZkRGbFhZQWRKNFVZNlIvQnpxWDVqQVRVLzJHbmZWRjNiZFFN?=
 =?utf-8?B?V2U0cTVHZHA5V0Qwa1R1MElSdElOMXRmRmludWhBdnRrVkI3VURqSEhiNzhq?=
 =?utf-8?B?bTI0REVES09OYmVOUDFvcW9qN0htY3p0dXNBSjljYVBuTi9mZFZEYVA3TlYz?=
 =?utf-8?B?VGlxMlZ5aFhLR1NkT3RhSGxLSWhhYlhpOG1hYmQySkVxcVZQa0lIWnNxVkhR?=
 =?utf-8?B?QkhlL1ZtUkhUWjU4OVhIZUR0NEdXdDAyQStPOXJHbVlvWTR0N0Yrc05BR0NE?=
 =?utf-8?B?eVB4eFVKaTZPRTNSeEJiMythaTJXK0xLS2R6bXAycUVKZlNwc1ZTOGtWaWQx?=
 =?utf-8?B?Y2dJS283NzkxYWxoNGJpOFh3b3g3eTRweU1ZbDN5bGk2MjBuZnZ6L1JTNEdP?=
 =?utf-8?B?N2RpczRLL3dlZFNDdzEyTE95YjB1WWFxbXhobGVWNUh5UmtPQkQ5YmdsNlFi?=
 =?utf-8?B?cUNEejJ1M1pRenh6OHkvOEN1akZGdU5zaThiL1V1NEVYZ21VTklueTQ2WGVz?=
 =?utf-8?B?cnZzNU1ZRUpIRmRNRXpsNWVDY1NZTjJtZE5EZmc0aEppV0pQQ0hnWkJKSmZq?=
 =?utf-8?B?V0I5VmdkNXk1K3RvV0V3T00rU0lWalZmc0o1Z3VHcG52T3JpZC9jREd6Ym43?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7812763-5153-4e15-eb06-08dc3dcdb759
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 11:08:13.7041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGKKkK4SVQQcdQ9TXC3J1d7vbUCc5BZsRHkfmzeeooleGf7feAVddO8svZZIFUbgNSPRh45DKS7Zp0vLv3E31aTqq8G0ztrLbcySF2PYX/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7156
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


On 06-03-2024 04:12 pm, Lisovskiy, Stanislav wrote:
> On Wed, Mar 06, 2024 at 12:33:47PM +0200, Lisovskiy, Stanislav wrote:
>> On Wed, Mar 06, 2024 at 03:41:26PM +0530, Joshi, Kunal1 wrote:
>>> Hello Stan,
>>>
>>> On 3/6/2024 3:23 PM, Lisovskiy, Stanislav wrote:
>>>> On Wed, Mar 06, 2024 at 10:55:09AM +0530, Kunal Joshi wrote:
>>>>> big joiner outputs are statically assigned to pipe,
>>>>> rewrite to assign dynamically
>>>>>
>>>>> v2: Don't change license (Bhanu)
>>>>>       Add documentation for generate_combinations (Bhanu)
>>>>>       Print the pipe name (Bhanu)
>>>>>       Remove unwanted commit (Bhanu)
>>>>>       Move combine output logic to igt_fixture (Bhanu)
>>>>>       split revamp and force joiner (Bhanu)
>>>>>
>>>>> Cc: Karthik B S<karthik.b.s@intel.com>
>>>>> Cc: Bhanuprakash Modem<bhanuprakash.modem@intel.com>
>>>>> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
>>>>> ---
>>>>>    tests/intel/kms_big_joiner.c | 391 +++++++++++++++++------------------
>>>>>    1 file changed, 187 insertions(+), 204 deletions(-)
>>>>>
>>>>> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
>>>>> index 28678b958..ba4097d8b 100644
>>>>> --- a/tests/intel/kms_big_joiner.c
>>>>> +++ b/tests/intel/kms_big_joiner.c
>>>>> @@ -43,16 +43,19 @@
>>>>>     *
>>>>>     * SUBTEST: basic
>>>>>     * Description: Verify the basic modeset on big joiner mode on all pipes
>>>>> - *
>>>>> - * SUBTEST: 2x-modeset
>>>>> - * Description: Verify simultaneous modeset on 2 big joiner outputs
>>>>>     */
>>>>> -
>>>>>    IGT_TEST_DESCRIPTION("Test big joiner");
>>>>> -struct bigjoiner_output {
>>>>> -	uint32_t output_id;
>>>>> -	drmModeModeInfo mode;
>>>>> +#define MAX_OUTPUTS 256
>>>>> +#define MAX_COMBINATIONS 1000
>>>>> +#define INVALID_TEST_OUTPUT 2
>>>>> +typedef struct {
>>>>> +    int combination[MAX_OUTPUTS];
>>>>> +} Combination;
>>>>> +
>>>>> +enum joiner_type {
>>>>> +	BIG_JOINER = 1 << 1,
>>>>> +	INVALID_JOINER = -1,
>>>>>    };
>>>>>    typedef struct {
>>>>> @@ -60,273 +63,253 @@ typedef struct {
>>>>>    	igt_display_t display;
>>>>>    	struct igt_fb fb;
>>>>>    	int n_pipes;
>>>>> -	enum pipe pipe1;
>>>>> -	enum pipe pipe2;
>>>>> -	struct bigjoiner_output output[2];
>>>>> +	uint64_t big_joiner_outputs[IGT_MAX_PIPES];
>>>>> +	uint64_t non_big_joiner_outputs[IGT_MAX_PIPES];
>>>>> +	uint64_t combined_outputs[IGT_MAX_PIPES];
>>>>> +	int big_joiner_output_count;
>>>>> +	int non_big_joiner_output_count;
>>>>> +	int combined_output_count;
>>>>> +	int output_count;
>>>>> +	enum pipe pipe_seq[IGT_MAX_PIPES];
>>>>>    } data_t;
>>>>>    static int max_dotclock;
>>>>> -static void test_invalid_modeset(data_t *data)
>>>>> +/*
>>>>> + * The generate_combinations function generates combinations of pipe allocations
>>>>> + * for a given number of outputs
>>>>> + *
>>>>> + * @output_count: Number of outputs to allocate pipes for.
>>>>> + * @pipe_count: Total number of available pipes.
>>>>> + * @pipes_per_output: Number of pipes to be allocated for a single output.
>>>>> + * @combinations: Array to store generated combinations.
>>>>> + * @num_combinations: Pointer to a variable that stores the number of generated combinations.
>>>>> + *
>>>>> + * Example (output_count=2, pipe_count=4, pipes_per_output=2):
>>>>> + * Combination 1: 0 2
>>>>> + * Combination 2: 1 3
>>>> I think this might be a bit overcomplicated - just for your information, we can't deliberately
>>>> choose which pipes can be used for bigjoiner. On some platforms even only certain pipes, can be
>>>> used for bigjoiner.
>>>> Moreover the way how driver decides, which pipes are going to be used for bigjoiner is basically
>>>> this code in intel_dp.c:
>>>>
>>>> if (intel_dp_need_bigjoiner(intel_dp, adjusted_mode->crtc_hdisplay,
>>>> 			    adjusted_mode->crtc_clock))
>>>>            pipe_config->bigjoiner_pipes = GENMASK(crtc->pipe + 1, crtc->pipe);
>>>>
>>>> Means if you try to do a modeset with resolution > 5K or exceed max_dot_clock on crtc->pipe,
>>>> then _always_ pipe + 1, going to be used for bigjoiner.
>>>>
>>>>
>>>> Stan
>>>>
>>> Thanks for the inputs,
>>> Goal here is to try various combination possible,
>>> Suppose a platform supports 5 pipes(A-E) and we have 1 bigjoiner output
>>> (DP-1) then we want to try
>>> DP-1 on PIPE_A
>>> DP-1 on PIPE_B
>>> DP-1 on PIPE_C
>>> DP-1 on PIPE_D
>>>
>>> Suppose a platform supports 5 pipes(A-E) and we have 2 bigjoiner output
>>> (DP-1, DP-2) then we want to try
>>> DP-1 on PIPE_A and DP-2 on PIPE_C
>>> DP-1 on PIPE_B and DP-2 on PIPE_D And so on, Going forward this will be
>>> useful we introduce any feature which can allow having more pipes per output
>>> also.
>>
>> That won't work. BSpec and current driver code allows to use only _adjacent_ pipes.
>> I.e if you modeset PIPE_A with 5K resolution, then bigjoiner_pipes mask would be
>> PIPE_A | PIPE_B. If you modeset PIPE_B with 5K resolution it will take PIPE_C as a
>> slave and so on.
>> So for instance of you had DP-1 assigned to PIPE_A and DP-2 assigned to PIPE_C by test,
>> _driver_ will still reassign PIPE_B to DP-2, in order for bigjoiner to work.
> 
> Meant "will still reassign PIPE_B to DP-1" to make > 5K resolution possible on DP-1.
> So basically anyway we can't have all possible combinations, but only those which are
> allowed by spec.
> 
> In this case it can be either
> DP-1 bigjoiner on PIPE A|PIPE B
> DP-2 bigjoiner on PIPE C|PIPE D
> or vice versa
> DP-1 bigjoiner on PIPE C|PIPE D
> DP-2 bigjoiner on PIPE A|PIPE B

Also, we need to takecare of fused pipes.
Example: If PIPE B is fusedoff, then we can't use PIPE A for bigjoiner.

- Bhanu

> 
> Stan
> 
> 
>> That logic is implemented in intel_dp.c, as I mentioned above.
>> Also you can check the BSpec Bigjoiner programming description.
>>
>> Stan
>>
>>
>>>
>>>>
>>>>> +*/
>>>>> +static void generate_combinations(int output_count, int pipe_count,
>>>>> +				  int pipes_per_output,
>>>>> +				  Combination combinations[MAX_COMBINATIONS],
>>>>> +				  uint64_t *num_combinations)
>>>>>    {
>>>>> -	igt_output_t *output;
>>>>> -	igt_display_t *display = &data->display;
>>>>> -	int ret;
>>>>> +	int i, index;
>>>>> +	int current_combination[MAX_OUTPUTS];
>>>>> -	igt_info("Bigjoiner test on ");
>>>>> -	for_each_connected_output(display, output){
>>>>> -		enum pipe p = output->pending_pipe;
>>>>> -		drmModeModeInfo *mode;
>>>>> -		igt_pipe_t *pipe;
>>>>> -		igt_plane_t *plane;
>>>>> +	for (i = 0; i < output_count; ++i)
>>>>> +		current_combination[i] = i * pipes_per_output;
>>>>> -		if (p == PIPE_NONE)
>>>>> -			continue;
>>>>> -
>>>>> -		mode = igt_output_get_mode(output);
>>>>> -		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
>>>>> -		kmstest_dump_mode(mode);
>>>>> +	while (*num_combinations < MAX_COMBINATIONS && current_combination[0] <= pipe_count - output_count * pipes_per_output) {
>>>>> +		for (i = 0; i < output_count; ++i)
>>>>> +			combinations[*num_combinations].combination[i] = current_combination[i];
>>>>> -		pipe = &display->pipes[p];
>>>>> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>>> +		(*num_combinations)++;
>>>>> -		igt_plane_set_fb(plane, &data->fb);
>>>>> -		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>>>>> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>>>>> -	}
>>>>> +		index = output_count - 1;
>>>>> +		while (index >= 0 && current_combination[index] == pipe_count - (output_count - index) * pipes_per_output)
>>>>> +			index--;
>>>>> -	igt_assert(!igt_check_bigjoiner_support(display));
>>>>> +		if (index < 0)
>>>>> +			break;
>>>>> -	/* This commit is expectd to fail as this pipe is being used for big joiner */
>>>>> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
>>>>> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>>>> +		current_combination[index]++;
>>>>> +		for (i = index + 1; i < output_count; ++i)
>>>>> +			current_combination[i] = current_combination[i - 1] + pipes_per_output;
>>>>> +    }
>>>>> +}
>>>>> -	igt_display_reset(&data->display);
>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>> +static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t output_id)
>>>>> +{
>>>>> +	igt_output_t *output;
>>>>> -	igt_assert_lt(ret, 0);
>>>>> +	for_each_connected_output(&data->display, output) {
>>>>> +		if (output->id == output_id)
>>>>> +			return output;
>>>>> +	}
>>>>> +	igt_assert("Output not found\n");
>>>>> +	return NULL;
>>>>>    }
>>>>> -static void test_basic_modeset(data_t *data)
>>>>> +static void test_invalid_modeset_two_joiner(data_t *data, bool combined)
>>>>>    {
>>>>> +	int i, j, ret;
>>>>> +	igt_output_t *output;
>>>>> +	uint64_t *outputs;
>>>>> +	igt_plane_t *primary[INVALID_TEST_OUTPUT];
>>>>> +	igt_fb_t fb[INVALID_TEST_OUTPUT];
>>>>>    	drmModeModeInfo *mode;
>>>>> -	igt_output_t *output, *bigjoiner_output = NULL;
>>>>> -	igt_display_t *display = &data->display;
>>>>> -	igt_pipe_t *pipe;
>>>>> -	igt_plane_t *plane;
>>>>> -	igt_display_reset(display);
>>>>> -
>>>>> -	for_each_connected_output(display, output) {
>>>>> -		if (data->output[0].output_id == output->id) {
>>>>> -			bigjoiner_output = output;
>>>>> -			break;
>>>>> +	outputs = combined ? data->combined_outputs : data->big_joiner_outputs;
>>>>> +
>>>>> +	for (i = 0; i < data->n_pipes-1; i++) {
>>>>> +		igt_display_reset(&data->display);
>>>>> +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
>>>>> +			output = get_output_by_id_or_assert(data, outputs[j]);
>>>>> +			igt_assert(output);
>>>>> +			igt_output_set_pipe(output, data->pipe_seq[i + j]);
>>>>> +			mode = igt_output_get_mode(output);
>>>>> +			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
>>>>> +				 kmstest_pipe_name(data->pipe_seq[i + j]),
>>>>> +				 igt_output_name(output), mode->hdisplay,
>>>>> +				 mode->vdisplay, mode->vrefresh,
>>>>> +				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
>>>>> +			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>>>> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>>>>> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>>>>> +			igt_plane_set_fb(primary[j], &fb[j]);
>>>>>    		}
>>>>> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>>>> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>>>>>    	}
>>>>> -
>>>>> -	igt_output_set_pipe(bigjoiner_output, data->pipe1);
>>>>> -
>>>>> -	mode = &data->output[0].mode;
>>>>> -	igt_output_override_mode(bigjoiner_output, mode);
>>>>> -
>>>>> -	pipe = &display->pipes[data->pipe1];
>>>>> -	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>>> -
>>>>> -	igt_plane_set_fb(plane, &data->fb);
>>>>> -	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>>>>> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>>>>> -
>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>> -
>>>>> -	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
>>>>> -	igt_plane_set_fb(plane, NULL);
>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>>    }
>>>>> -static void test_dual_display(data_t *data)
>>>>> +static void tets_big_joiner_on_last_pipe(data_t *data)
>>>>>    {
>>>>> +	int i, ret;
>>>>> +	uint64_t *outputs;
>>>>> +	igt_output_t *output;
>>>>> +	igt_plane_t *primary;
>>>>> +	igt_fb_t fb;
>>>>>    	drmModeModeInfo *mode;
>>>>> -	igt_output_t *output, *bigjoiner_output[2];
>>>>> -	igt_display_t *display = &data->display;
>>>>> -	igt_pipe_t *pipe;
>>>>> -	igt_plane_t *plane1, *plane2;
>>>>> -	int count = 0;
>>>>> -
>>>>> -	igt_display_reset(display);
>>>>> -
>>>>> -	for_each_connected_output(display, output) {
>>>>> -		if (data->output[count].output_id == output->id) {
>>>>> -			bigjoiner_output[count] = output;
>>>>> -			count++;
>>>>> -		}
>>>>> -		if (count > 1)
>>>>> -			break;
>>>>> +	outputs = data->big_joiner_outputs;
>>>>> +	for (i = 0; i < data->big_joiner_output_count; i++) {
>>>>> +		igt_display_reset(&data->display);
>>>>> +		output = get_output_by_id_or_assert(data, outputs[i]);
>>>>> +		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
>>>>> +		mode = igt_output_get_mode(output);
>>>>> +		igt_info("Assigning pipe %s to %s with mode %dx%d@%d\n",
>>>>> +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
>>>>> +				 igt_output_name(output), mode->hdisplay,
>>>>> +				 mode->vdisplay, mode->vrefresh);
>>>>> +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>>>> +		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>>>>> +							  DRM_FORMAT_MOD_LINEAR, &fb);
>>>>> +		igt_plane_set_fb(primary, &fb);
>>>>> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>>>> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>>>>>    	}
>>>>> +}
>>>>> -	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
>>>>> -	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
>>>>> -
>>>>> -	/* Set up first big joiner output on Pipe A*/
>>>>> -	mode = &data->output[0].mode;
>>>>> -	igt_output_override_mode(bigjoiner_output[0], mode);
>>>>> -
>>>>> -	pipe = &display->pipes[data->pipe1];
>>>>> -	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>>> -
>>>>> -	igt_plane_set_fb(plane1, &data->fb);
>>>>> -	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
>>>>> -	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
>>>>> -
>>>>> -	/* Set up second big joiner output on Pipe C*/
>>>>> -	mode = &data->output[1].mode;
>>>>> -	igt_output_override_mode(bigjoiner_output[1], mode);
>>>>> -
>>>>> -	pipe = &display->pipes[data->pipe2];
>>>>> -	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>>> -
>>>>> -	igt_plane_set_fb(plane2, &data->fb);
>>>>> -	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
>>>>> -	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
>>>>> -
>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>> +static void test_basic_modeset(data_t *data, int num_outputs,
>>>>> +			       Combination combinations[MAX_COMBINATIONS],
>>>>> +			       uint64_t num_combinations)
>>>>> +{
>>>>> +	int i, j, ret;
>>>>> +	igt_display_t *display = &data->display;
>>>>> +	igt_output_t *output[num_outputs];
>>>>> +	igt_plane_t *primary[num_outputs];
>>>>> +	igt_fb_t fb[num_outputs];
>>>>> +	drmModeModeInfo *mode;
>>>>> -	/* Clean up */
>>>>> -	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
>>>>> -	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
>>>>> -	igt_plane_set_fb(plane1, NULL);
>>>>> -	igt_plane_set_fb(plane2, NULL);
>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>> +	for (i = 0; i < num_combinations; i++) {
>>>>> +		igt_display_reset(display);
>>>>> +		for (j = 0; j < num_outputs; j++) {
>>>>> +			output[j] = get_output_by_id_or_assert(data,
>>>>> +						     data->big_joiner_outputs[j]);
>>>>> +			igt_info("Assigning pipe %s to %s%s",
>>>>> +				 kmstest_pipe_name(data->pipe_seq[combinations[i].combination[j]]),
>>>>> +				 output[j]->name, j == num_outputs - 1 ? "\n" : ", ");
>>>>> +			igt_output_set_pipe(output[j], data->pipe_seq[combinations[i].combination[j]]);
>>>>> +			primary[j] = igt_output_get_plane_type(output[j], DRM_PLANE_TYPE_PRIMARY);
>>>>> +			mode = igt_output_get_mode(output[j]);
>>>>> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>>>>> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>>>>> +			igt_plane_set_fb(primary[j], &fb[j]);
>>>>> +		}
>>>>> +		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>>>>> +		igt_assert_f(ret == 0, "Commit failed\n");
>>>>> +    }
>>>>>    }
>>>>>    igt_main
>>>>>    {
>>>>> +	int i, j;
>>>>>    	data_t data;
>>>>>    	igt_output_t *output;
>>>>> -	drmModeModeInfo mode;
>>>>> -	int valid_output = 0, i, count = 0, j = 0;
>>>>> -	uint16_t width = 0, height = 0;
>>>>> -	enum pipe pipe_seq[IGT_MAX_PIPES];
>>>>> +	drmModeModeInfo default_mode;
>>>>> +	i = j = 0;
>>>>>    	igt_fixture {
>>>>>    		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>>>>>    		kmstest_set_vt_graphics_mode();
>>>>> -
>>>>>    		igt_display_require(&data.display, data.drm_fd);
>>>>>    		igt_require(data.display.is_atomic);
>>>>> -
>>>>>    		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>>>>> +		data.big_joiner_output_count = 0;
>>>>> +		data.non_big_joiner_output_count = 0;
>>>>> +		data.combined_output_count = 0;
>>>>> +		data.output_count = 0;
>>>>>    		for_each_connected_output(&data.display, output) {
>>>>>    			bool found = false;
>>>>>    			drmModeConnector *connector = output->config.connector;
>>>>> -
>>>>> -			/*
>>>>> -			 * Bigjoiner will come in to the picture when the
>>>>> -			 * resolution > 5K or clock > max-dot-clock.
>>>>> -			 */
>>>>>    			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock);
>>>>> -
>>>>>    			if (found) {
>>>>> -				data.output[count].output_id = output->id;
>>>>> -				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
>>>>> -				count++;
>>>>> -
>>>>> -				width = max(width, mode.hdisplay);
>>>>> -				height = max(height, mode.vdisplay);
>>>>> +				data.big_joiner_outputs[data.big_joiner_output_count++] = output->id;
>>>>> +				igt_output_override_mode(output, &connector->modes[0]);
>>>>> +			} else {
>>>>> +				data.non_big_joiner_outputs[data.non_big_joiner_output_count++] = output->id;
>>>>> +				kmstest_get_connector_default_mode(data.drm_fd, connector, &default_mode);
>>>>> +				igt_output_override_mode(output, &default_mode);
>>>>>    			}
>>>>> -			valid_output++;
>>>>> +			data.output_count++;
>>>>> +		}
>>>>> +
>>>>> +		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count > 0) {
>>>>> +			data.combined_outputs[data.combined_output_count++] = data.big_joiner_outputs[0];
>>>>> +			data.combined_outputs[data.combined_output_count++] = data.non_big_joiner_outputs[0];
>>>>>    		}
>>>>>    		data.n_pipes = 0;
>>>>>    		for_each_pipe(&data.display, i) {
>>>>>    			data.n_pipes++;
>>>>> -			pipe_seq[j] = i;
>>>>> +			data.pipe_seq[j] = i;
>>>>>    			j++;
>>>>>    		}
>>>>> -
>>>>> -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
>>>>> -
>>>>> -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
>>>>> -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>>>>>    	}
>>>>>    	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>>>>>    	igt_subtest_with_dynamic("basic") {
>>>>> -		for (i = 0; i < data.n_pipes - 1; i++) {
>>>>> -			data.pipe1 = pipe_seq[i];
>>>>> -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
>>>>> -				test_basic_modeset(&data);
>>>>> +		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
>>>>> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>>>>> +
>>>>> +		for (i = 0; i < data.big_joiner_output_count; i++) {
>>>>> +			uint64_t num_combinations = 0;
>>>>> +			Combination combinations[MAX_COMBINATIONS];
>>>>> +
>>>>> +			generate_combinations(i+1, data.n_pipes, BIG_JOINER, combinations, &num_combinations);
>>>>> +			igt_info("Number of combinations for %d outputs and %d pipes are %ld\n",
>>>>> +					 i+1, data.n_pipes, num_combinations);
>>>>> +
>>>>> +			if (num_combinations > 0)
>>>>> +				igt_dynamic_f("%dx-big-joiner", i+1)
>>>>> +					test_basic_modeset(&data, i+1, combinations, num_combinations);
>>>>> +			else
>>>>> +				break;
>>>>>    		}
>>>>>    	}
>>>>> -	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>>>>> -		     "when the pipe is active with a big joiner modeset");
>>>>>    	igt_subtest_with_dynamic("invalid-modeset") {
>>>>> -		data.pipe1 = pipe_seq[j - 1];
>>>>> -
>>>>> -		igt_display_reset(&data.display);
>>>>> -		for_each_connected_output(&data.display, output) {
>>>>> -			if (data.output[0].output_id != output->id)
>>>>> -				continue;
>>>>> -
>>>>> -			mode = data.output[0].mode;
>>>>> -			igt_output_set_pipe(output, data.pipe1);
>>>>> -			igt_output_override_mode(output, &mode);
>>>>> +		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
>>>>> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>>>>> -			igt_dynamic_f("pipe-%s-%s",
>>>>> -				      kmstest_pipe_name(data.pipe1),
>>>>> -				      igt_output_name(output))
>>>>> -				test_invalid_modeset(&data);
>>>>> -		}
>>>>> +		if (data.big_joiner_output_count >= 1)
>>>>> +			igt_dynamic_f("big_joiner_on_last_pipe")
>>>>> +				tets_big_joiner_on_last_pipe(&data);
>>>>> -		if(valid_output > 1) {
>>>>> -			for (i = 0; i < data.n_pipes - 1; i++) {
>>>>> -				igt_output_t *first_output = NULL, *second_output = NULL;
>>>>> -
>>>>> -				data.pipe1 = pipe_seq[i];
>>>>> -				data.pipe2 = pipe_seq[i + 1];
>>>>> -
>>>>> -				igt_display_reset(&data.display);
>>>>> -				for_each_connected_output(&data.display, output) {
>>>>> -					if (data.output[0].output_id == output->id) {
>>>>> -						first_output = output;
>>>>> -						mode = data.output[0].mode;
>>>>> -
>>>>> -						igt_output_set_pipe(output, data.pipe1);
>>>>> -						igt_output_override_mode(output, &mode);
>>>>> -					} else if (second_output == NULL) {
>>>>> -						second_output = output;
>>>>> -						igt_output_set_pipe(output, data.pipe2);
>>>>> -
>>>>> -						break;
>>>>> -					}
>>>>> -				}
>>>>> -
>>>>> -				igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
>>>>> -					      kmstest_pipe_name(data.pipe1),
>>>>> -					      igt_output_name(first_output),
>>>>> -					      kmstest_pipe_name(data.pipe2),
>>>>> -					      igt_output_name(second_output))
>>>>> -					test_invalid_modeset(&data);
>>>>> -			}
>>>>> -		}
>>>>> -	}
>>>>> +		if (data.big_joiner_output_count > 1)
>>>>> +			igt_dynamic_f("invalid_combinations_with_two_bigjoiner")
>>>>> +				test_invalid_modeset_two_joiner(&data, false);
>>>>> -	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
>>>>> -	igt_subtest_with_dynamic("2x-modeset") {
>>>>> -		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
>>>>> -		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
>>>>> -		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
>>>>> -			data.pipe1 = pipe_seq[i];
>>>>> -			data.pipe2 = pipe_seq[i + 2];
>>>>> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
>>>>> -				test_dual_display(&data);
>>>>> +		if (data.combined_output_count) {
>>>>> +			igt_dynamic_f("invalid_combinations_with_bigjoiner_non_bigjoiner")
>>>>> +				test_invalid_modeset_two_joiner(&data, true);
>>>>>    		}
>>>>>    	}
>>>>>    	igt_fixture {
>>>>> -		igt_remove_fb(data.drm_fd, &data.fb);
>>>>>    		igt_display_fini(&data.display);
>>>>>    		drm_close_driver(data.drm_fd);
>>>>>    	}
>>>>> -- 
>>>>> 2.25.1
>>> Thanks and Regards
>>> Kunal Joshi
