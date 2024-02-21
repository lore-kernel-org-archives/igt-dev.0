Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13646C48BF6
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 12:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9693010E45D;
	Wed, 21 Feb 2024 12:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oot8vyFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7FC10E45D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708519015; x=1740055015;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=Qy3a/U6KtkZeyEyUEAevZ9L+vcgJjl4DU2CaqUEaL70=;
 b=Oot8vyFNLJ53tB3unRbWs/OjBTShZwiYbB7vBTSke2mCyiOs8LArQaf/
 xExPzKeun0G1ISlrLuw8LYWMDabl4Dv06tk41qs9I9Mapdb3JZuTjWrDG
 iAbt8YLpKp8gP/vMNVH8Y8Lkeoif6eB/a56kos/aTXP3sqvN/rMosVfjO
 HArVihNOORJKZSVgT86jZK2apkBUA0qhlQ9IRI0wZRT2OfJiAj33RA2Gx
 uwcJfwg23ph57BGewJvOKnoIFSYakoDX/3yFgUk/1NvXvJqvfxgv0UCil
 go8nDyXUFod/hiz0m6lhN0K/mDtjXNF8UokSCHwUgRUfAVzjg57gx9Tgt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="20215960"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="20215960"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 04:36:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="42597258"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 04:36:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 04:36:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 04:36:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 04:36:53 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 04:36:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcNoy3hyTZPscSGKiiJkL5RbeyXJEuyz59wArBCu+zMjO4Gdx8OEA0m1qHOwbMlYGGm8zZ2P+F3QG82l/HjTF1NqNbn1p9gHNUTCrKD7W1YVMpNyrNEdfbY8o4+j29dwFJ+93qgxlryL4wMQSLD6aRUFQnh88WBFS/zSoTDEi5arkiQMSzSg7u7RuYcmhMS6ZQW9IyHSwELF+X/tTIW4KUvuvheLH15/MGN4L20CiVXqlrC6j/6Tj0W0zohVlOUW8EqENHWuyG6TDTlPOTxQca9If4ed/RhPLX2HfGJiI04GoeGjA0geUDa3VEfvgOYp4LQrGr/aVXx0lQiVcfMPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVcSZQkTMmvFLZyjOuEHBjTwvmkTfdAxJQ7z3c8bIyc=;
 b=E66uXjKJVTZq1jWFfhckuGgAgg2ELi8fQgvhvmX0OjdoKazIJ+vyUHQY1zJS4ntL4RQKlkoHlibWD6cfxH4wCxsOy4AYTdlNsTqkP2vAizqAQXzgeA5WOFeXFZTLByPy4Wz9KaatgHMg3tKADXcAwVhBflBGR9zbkXaYr+EfizZrJua1HrID1Cv3wByS+cBWyhPbvkOJgfcjJSitSZlKZ8ZfUuJXtD71+b2rV1T0+JWUDLi7siH2us3e7iGD2/Olr69ObfwNQAwzf4CY8cMllnxglIPndHuAYiZaGTPbQvodBAaYSKLwDoRa794Df7uD1Q1ttNZHaA8gJNytohmhVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 12:36:51 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa%4]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 12:36:51 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cf373084-45f3-4c85-aed0-9fa97d84a3e3@intel.com>
References: <20240209135526.135380-2-gustavo.sousa@intel.com>
 <170845211015.44184.10125779397878338003@gjsousa-mobl2>
 <cf373084-45f3-4c85-aed0-9fa97d84a3e3@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Invalidate
 cached stuff
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Feb 2024 09:36:45 -0300
Message-ID: <170851900590.23070.10525095367187353126@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0070.namprd04.prod.outlook.com
 (2603:10b6:303:6b::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA3PR11MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f43682-fb4a-45a1-18d4-08dc32d9c732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DPfUzoxVJferjx3d90+Ox3EAC6JCCU2YyTCVnWvyPiiCE39j9RkM0m59ZsfrzzD02qcsh2IhCm+ShVpNW5JyS++byyhQpL3hJ9JlD9m+0JK+zaXgm6zmyRX2zeqd6me5CPYoED3Ae3CCZU6kP5CSfIKro7ZjsBFEwCInwxcZ6QQwsVR9dYG5yi/Jwp+W20tMuHffRwSWw4Q8/9RrYfWk2F2ItOEXi0UpaW13U0Mf5Knjp7+w/lKXbtz1KIvtxaSw+BxKe83zpbL2IXgLAo545HlbfCeBNDVxNo1g75c3qV6VwNAINw4g5cnMSy7zQ4FBrhxfGL37eUJ27NNOp1yqx9vsMpO4k9H7E3drRKe7HNeoMjLWS13Ln1AFnlEusmeXwIUExFZ5fwBJSS2wqURmynbIg/m705AYPogE6KApnsRqD344UvDlQoLMxCgdTmeSfmK04Rs332VUnnkpLUXrQ7x6Q9tbBxk4c6Ef5yH72o3rrCdjNGt/QEjEME2zEwY4C6s1DcJ+bm7I/huejd2MCiEVPerF4woRDvQ40fr7yUU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXZmY0kzQkdWNERLcXBMOStpZmZiYnhTU0V6d3VhRVRMYTJmQjdMWXh1Ti9r?=
 =?utf-8?B?eFBUMlJtcnYzak85SmZySTZSWnlPcjRkc1JmRHNkMmx6NVlYQVB1L3N1ZWgz?=
 =?utf-8?B?MTVUOFNwOGJZTngwSE5aYURVY3Z0YlhoWHBCM2M1TlB4NVUwMHhZZGRlQkhr?=
 =?utf-8?B?REp5RXlwTzBOeXBIdDRFd1Y0UGVyak1OTDk5SVdCaUs2MllsS2RLQzRWOUhK?=
 =?utf-8?B?TmM2bWZ3MStSM1czWnZYRVV5MjdqRUY2bWJTV01VTUZCV1J0alBySGxYREx3?=
 =?utf-8?B?amJ6bzl6OHRianp0Y3Bwb2ZaK0k2R0djY01JU04xU0FwK0FoZGhhd0VwV1No?=
 =?utf-8?B?enJRMEtWdFFoMUJWNm4wKzNSN0F6SG9FV1haTTdERWlrSi9pWXJqRW9INUJC?=
 =?utf-8?B?WEVSNHNFQ3I2Q0s5Ym1pbjdmYXJPSms3aHh2cHBzM2pPRVZldUFTdTlIUStn?=
 =?utf-8?B?eUEvb0x1VzVFZFZqcTVDbjFIYVJyTE5idHdJYUZjblJXUnZGRTV5UkgxZGJ4?=
 =?utf-8?B?RWdxTjJoZ2JLaEQyZ1BLWFhhbkRpdURST3o1Zy9mUXF4M1lFWXBWZGVaSU13?=
 =?utf-8?B?dnlrT1hJRDJIQnZRV3Q5UG5KYTZkaUVYRzZhYkFSVUNIUXJYQlk0ek9BWnBX?=
 =?utf-8?B?QTltRzREMEZNSm12L3dRL0p3L3E0Rm93TEtKdThoRUZQRDJMd05SS0d3WDF5?=
 =?utf-8?B?SXE3M3dpWndQZHRSRGFHYkdXaXZ4ZGVpR1A5Q1RBdHh3MlpzQUFDM3pWSVp6?=
 =?utf-8?B?dm1NL1BxMkZ0L09IK2IyL21nc0VPRnhXZGFTRjlFaHlLYmY0ZE9mS0xHc1RH?=
 =?utf-8?B?Sk1ZMUdCbHdHeWkveWRwa1R5RGRrZ0Y1aUN0ZjB0UzhrM2gyQWEvR2Y0N0dL?=
 =?utf-8?B?TFJ4SXkrSm1WeTcxY1g0WUZyL2c0ZVZnWGIxTzdYRXZsWUZJSnRpMGtIazNz?=
 =?utf-8?B?ejFNSngzWXQrd0tCR2FGZUtzNmZuR2dERU1xQXoycnozdDVsdUE5akdZUnYx?=
 =?utf-8?B?NXoxb1J6UDVYd1RZOGhBYlRYZXJYSk41YzZISWZBNFlBUE9qV0k1Qk5PMDVR?=
 =?utf-8?B?SHhTb2JXbms4alA0ZEZsSklvR3c0R1p4UGNURTBsT2xjUG5jNjFSam43aWE2?=
 =?utf-8?B?WmRXYVRxaE43TGVSdEU0YW9rR3FOVjBFSTVraE0zNHJiWW5HSXdwK2wzQ0lU?=
 =?utf-8?B?bHkvYmhVaWgxYjJZZ0RJQ1FYZnF2U2c3d3dTMktOZHN0R2hPRGdXMEJZUEJv?=
 =?utf-8?B?QWo0YzVCYjk3TmtDb0ZLM2NielVIRDVQNCtQSGN6ZFE5STBuYjN3VEs4S2Jm?=
 =?utf-8?B?S3Fad2crWlZzcEFYVjNWN1A0UzJlMm44NGNUd3dJZzZhQmRDRFhveldnWTgy?=
 =?utf-8?B?N05UUHFSZlBBemR5cHVSY0JoWEhVSHJwU0RscE02bFJMS05mckp0L1BTeEtE?=
 =?utf-8?B?dld4TmF2amdJdm1uL0JocGV3a3FmekN2Y0EwNmcrZlNFaWxxejNRak9ReThu?=
 =?utf-8?B?K3pQb2VCUEFwdmlENHkranZuUEo5aUR4amtwTzA4cmtMM2pZMXBGajRBWWNt?=
 =?utf-8?B?UEJKMnRuUk1XQTF6T2lRWmJ3ajZ2dGQxQ2YwaVJyQlRLR1pPamhWMGM5czRP?=
 =?utf-8?B?Z0lTMFBTVnVZZ3B3bHVvaWFnV1pFRTdORFBJRmhEUDN1NU54eldjQTBqdTlB?=
 =?utf-8?B?SXVhMCtkKyt2MVE3RUxaRStxcHJnRWZrU1N0YVJmNnFIMGxzS1EyemFmRlQ1?=
 =?utf-8?B?TjFCNW9zd1VZd0xHbzJncUt3UmVLbEhEVmlrSEs2dG9uVTl4T3ZhSytiYUti?=
 =?utf-8?B?cDdRbFFhZldhQ3pkeVprQU4wLytNS1BwQ1hPWUxEMTh2Skdza3NVMHNDM0Vz?=
 =?utf-8?B?c081QzQ3aXpFWnNydW1NbC9BMzhWRmN0V21zeHp5MjMybzVrM2xBa0lBTVda?=
 =?utf-8?B?MVg3WkdLeDUwRXhIMHc3ZEdWUVZjTUVFSHAwYXRYb3lKK1NGOCtUQWJIdzRU?=
 =?utf-8?B?ZVdzUzlUa3hkUTBZbVN2OWFMOElEVkJOUU8zd0ZWVEVMaU9UWEpxRVd2SEVs?=
 =?utf-8?B?WkIvZ2xMUEZXaVF1VkZ2NGU3Z0hxSUxFL0JWTE9vS3ptVUhDNHhKc3I4REZJ?=
 =?utf-8?B?UWxSMlRoMEJGN3ZlMU9zSVpyZkI2cXRGVTZQK3E2VGdmVCt6YVBZZGRmSkto?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f43682-fb4a-45a1-18d4-08dc32d9c732
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 12:36:51.2251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57YvYHk8uY+URT4WpaweFVhpOvHkwkozBi1FVMQTANYtB3d0LW2QpjUBKbIFdXI/xvDj3KkUz0kwAIZOWqB7xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
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

Quoting Vodapalli, Ravi Kumar (2024-02-20 15:10:22-03:00)
>Hi Gustavo,

Hi!

>
>Below my inline comments
>
>On 2/20/2024 11:31 PM, Gustavo Sousa wrote:
>> +cc Ravi.
>>
>> Quoting Gustavo Sousa (2024-02-09 10:55:27-03:00)
>>> The test pipe-fbc-rte updates the primary mode parameters for each vali=
d
>>> dynamic test case. Because of that, we might endup with invalid cached
>>> data due to differences between the initial state of prim_mode_params
>>> defined from the beginning of the test program and the possibly changed
>>> state after pipe-fbc-rte.
>>>
>>> As an example, in a specific environment, the command
>>>
>>>   ./build/tests/kms_frontbuffer_tracking \
>>>       --run-subtest pipe-fbc-rte,fbc-1p-primscrn-pri-indfb-draw-mmap-wc
>>>
>>> would result in fbc-1p-primscrn-pri-indfb-draw-mmap-wc failing because
>>> it would try to read CRC from pipe B while the test was being actually
>>> done in pipe A.
>>>
>>> Another potential issue worth noting is that even pipe-fbc-rte could
>>> similarly fail if the set of dynamic subtests spanned across multiple
>>> pipes.
>>>
>>> Let's fix that by making sure that cached stuff that would depend on th=
e
>>> primary mode parameters gets properly invalidated when prim_mode_params
>>> is the target of init_mode_params(). This should fix the issues
>>> mentioned above and also future-proof the code for any future test that
>>> would need to modify the prim_mode_params.
>>>
>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> ---
>>> tests/intel/kms_frontbuffer_tracking.c | 13 +++++++++++++
>>> 1 file changed, 13 insertions(+)
>>>
>>> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_f=
rontbuffer_tracking.c
>>> index 912cca3f8d45..17f74990979e 100644
>>> --- a/tests/intel/kms_frontbuffer_tracking.c
>>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>>> @@ -1484,6 +1484,7 @@ static drmModeModeInfo *connector_get_mode(igt_ou=
tput_t *output)
>>> static void init_mode_params(struct modeset_params *params,
>>>                               igt_output_t *output, enum pipe pipe)
>>> {
>>> +        int i;
>can you rename variable i to cnt or any meaning full name to that the=20
>variable is used

IMO, cnt isn't very meaningful to what the variable is actually doing.
The variable i is simply being used to iterate over an array. As such, I
think the current variable name is suitable and conforms to a pattern
that is already being widely used on the code base:

    $ git grep '\<for\s*(\s*i\s*=3D\s*[^;]\+;\s*i\s*<\s*[^;]\+;\s*i++)' | w=
c -l
    1535

--
Gustavo Sousa

>>>          drmModeModeInfo *mode;
>>>
>>>          igt_output_override_mode(output, NULL);
>>> @@ -1515,6 +1516,18 @@ static void init_mode_params(struct modeset_para=
ms *params,
>>>          params->sprite.w =3D 64;
>>>          params->sprite.h =3D 64;
>>>
>>> +        /* If we endup changing the primary mode parameters, we need t=
o
>>> +         * invalidate any existing cached stuff from a previous config=
uration. */
>>> +        if (params =3D=3D &prim_mode_params) {
>>> +                if (pipe_crc) {
>>> +                        igt_pipe_crc_free(pipe_crc);
>>> +                        pipe_crc =3D NULL;
>>> +                }
>>> +
>>> +                for (i =3D 0; i < FORMAT_COUNT; i++)
>>> +                        blue_crcs[i].initialized =3D false;
>>> +        }
>>> +
>>>          free(mode);
>>> }
>>> --=20
>>> 2.43.0
>>>
>Thanks,
>Ravi kumar V
