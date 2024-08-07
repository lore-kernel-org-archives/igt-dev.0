Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF94C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Aug 2024 18:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D16510E141;
	Wed,  7 Aug 2024 18:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gBUpWmBd";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837C110E141
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Aug 2024 18:18:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmOMcWTh6EvdjeXHGuddZvFkVyKDGbkEGow57+j1jXZXcYUrnWnfzLkSvxoC6puxWzzjda/EJo+hd+u8h/ado64hQDbuIydQ1aOZAnZA0m7m8z3ZWax3bWiHipb8oe89JmvGfS5LGEky8JuCn7RdUthEfEGlL6v1ijrVwc6xI/U6wVXAZAI+Or782mmMRza7G15IoW4KhjWEHYaqaKJU6i2ZttTX2++UUXXEBS1bi+IndStYN9oUxL38Ku2M3foYxtl/DBrMQwZbHl/pKVJOT7wpxKSwfORREuMy0VbvCfhGdhzqc22RSr4JWBtwn32//eD40rjBSQVKahs0P+coHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIwj7i6ELmTxgkZqaSaR/3DY48+sXdTi3vaA4NJahwU=;
 b=jXn7oD0AAnYowZTLUOKGKpZcLIzRXRlwao9NqLnHUYpWm0NlPJ/jOk9rV/31TNlWfxw4Neh+cEm1T8MxWFfBFd4U/Y90nGX0MbsyeCScOhoqp5gY4oVuELbAB8qStcrn8f7kAFkcQzRhz0HV0Nn56Pg6Betrk9Enuq9O8A8R2liNGcW4kiZiOJa0rNy4jhbpKRGl2g1xlHTaBuCMEmcp2zHa8cXmtK/EDm0O9Y+HbZXTJ0TNRX7REjy5qnVwfwOdI65LE536J5cYd3s7VEliXFUFiITrplM4Z+uFCcbdMvLJE0boi+TpKr98i76Ga2c0Vx2/EUZTfCZGkOl+AQ+btg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIwj7i6ELmTxgkZqaSaR/3DY48+sXdTi3vaA4NJahwU=;
 b=gBUpWmBdFg4qzm5LANS6uU2qPwP3yInoj3V/fhgpjyFo4ald+1h6IAuqQ4mGXbK22UFqP3oStouH2YG/PIROkue0+RNeXtO0sCbWUuO3r4fJ2CfatufJBH1T/6Q8ef0HokEzAu3o9G0bcaRynWJJnunZ2rptXwVoWJ7i+eUV4RE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 CY8PR12MB7515.namprd12.prod.outlook.com (2603:10b6:930:93::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.13; Wed, 7 Aug 2024 18:18:30 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%3]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 18:18:30 +0000
Message-ID: <40c400d2-aa10-4a4e-80c4-71695700c81d@amd.com>
Date: Wed, 7 Aug 2024 14:18:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v5] tests/amdgpu/amd_replay: Add amd_replay IGT test
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: Rodrigo.Siqueira@amd.com, alex.hung@amd.com, hamza.mahfooz@amd.com
References: <20240807071745.1864-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240807071745.1864-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0271.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::18) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|CY8PR12MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b96774-e634-4702-a3c3-08dcb70d56f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjkwVFI1N1ZoS2FRcWRhczh3MmhMNCs2Vk1UOWRJOXI0YVFEOHF0YW5UNDFB?=
 =?utf-8?B?SExjV1lnV25UVGZjSk5OeEtJOC9NVVVPY2hsQTVCd21uOWtaekZla0xGV0tK?=
 =?utf-8?B?M1VLMEJya0ozcWI4dis4VW1UaEppNi9hN2J5VGVTaU0yS0hNVlBNK1dLMi84?=
 =?utf-8?B?Y2tKaHpnRGk2ZVdtNFZjMFlBVWNic1hndklrRlA4alFIR3d4RWJlcitaNWds?=
 =?utf-8?B?WWYwQVJJMVc3ZTMyaXNTTi9sa2EzcTBxTlA2Q25OWVRNdUZMT2RjcWlOZi9S?=
 =?utf-8?B?ckYwck1Ybzc1MHNESXNMRGtHTkcyQXArNVI1UzFVcUJXU3FNMGR0ZDdEWU1n?=
 =?utf-8?B?bVVIUHlLSVRzM3Y2SlFIc2RqMHhvMzdGMENvc0h3M29sdE1YeEs2S2wzRzRo?=
 =?utf-8?B?VFRvcHBNMUxzckxPVytEVEpBSktNUjN2dkVSMThaN2NXOUQwL3JkY2lPenZr?=
 =?utf-8?B?emdXY2tkWFdTRmdiM1NyeFl6QTljQ2pURWxOb0dwV3ZJT2RJNC9vZDFnRlBO?=
 =?utf-8?B?enUrS2tEL2NjU294T1ROZzJ5QWxqTDVEd29iQW5tMndlWGY5dzNrRU1BV1Uy?=
 =?utf-8?B?Ymk5TnFIcGxzNU5Lam9WaDBhYjNPZXBYazcwd3R1Ukl4UjR6NjV6bVMxcGlM?=
 =?utf-8?B?dEhrYTc3VmdzWU5jWG8yT1lrZFpZSmRWSEg5RXFkTk1TS2lHaXJxQURXQXdu?=
 =?utf-8?B?RE8ySm5GWFh1RWduejRsVWFPZUZwc1lOaXBYek1tZGYxdlBoS2d4R1E2eUNk?=
 =?utf-8?B?YWJyUXB1TituVFc0YWw5MG1aOUt1aUVXYWhHQ2szTVVLTm10bnJ5V2FtN0dJ?=
 =?utf-8?B?NUJ1Ti96TFR2UkRLaEErZUZPL1BQZ3QzK0JWVXc2SUhxZmo5Nzl6ODJuTTgw?=
 =?utf-8?B?cnF5U1Urdjd4bjBYaWg0OWg0eWFBMGRkdTNwUm1QV1JVMFE4WUZ1RTY5Z3Ey?=
 =?utf-8?B?UFFUSldzUUlwckJtQzYyQVVGYmlHNCtaRzRBWnV5Vlp6S1pJQktrQnUyK25K?=
 =?utf-8?B?cUhlTUdta1M5ZEd1Y0hzcGtsNjdQdytwWDJJM1lsY1hiYm1SVFMwRERwQTlw?=
 =?utf-8?B?M2ZDaTlOVVFlTlNJRGI0QVFTNkNzMllhY1gxMkdwNWRWbGVzZWYwSU9vWmlz?=
 =?utf-8?B?K0VXZmwwb00wMUNyeGJhSnRLaU5yQU1OQUFhSGhLdTZxZFRPaFZiVi9ZKzl2?=
 =?utf-8?B?NGFxcjNuWkIwNGpGaEVCS1djalFTWVVpMnhmUk1SZktwbVBITW5yWm1vRXRR?=
 =?utf-8?B?ekc2WExtbVB2a2lJWEcxWUpLWW1ENWtVSDBRamlETGhmNEZBQjlzQWtBaUZW?=
 =?utf-8?B?cWNLY0s5OHpnY3BiVWVxSFVzdnNzZ3ZQYStPYjVGbCtuYW8rS1ViMUU5Zlc4?=
 =?utf-8?B?Q2EvWkkwL1FBSU8vUXZNQWlid3duOVhEeEFhbmE4dTUxRTR4TXJNVmErb2pr?=
 =?utf-8?B?V0RxSzByVUdrNkJ3TFJJV1hvUG1vb1RCM3RjeEFMYWlYSWxUejNIcnBrODZC?=
 =?utf-8?B?K2VxS2hpSHE3bFdoNEYvcW5BWW5IWE8xZTUrTm5rZGg5MEsvOWpNRTFpVlhT?=
 =?utf-8?B?UFY3a2pwNXBkVld6YjhubUN0ZDB3aWVSUUdVUHptRXd0a1RjMndLK0VTQW1R?=
 =?utf-8?B?ZnRhdi9IUStyNGNRVXdiS3hqa1M5dnhJeGJ5MVZHbWNORWxkK1JtbE9PQkhS?=
 =?utf-8?B?NUxISGlaWHVVVWRoYXFpenI5VGJSUE1VcjlpQ09UaHBvUUYxak9sY2hIRHJx?=
 =?utf-8?B?cnNDVmFqTitjcWZTNjZTbVZxSW90T1ZvOVM0bDJsbEJ3VEsxWE5tVFBTMkds?=
 =?utf-8?B?S0tpZEdMcnU3THV2aHduQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlFZVytVaUpHeXVzMWZBeCthdWtBUjNDakRSZ00vT3hNcHVSN3VvSmh1T0VC?=
 =?utf-8?B?bEgyaVhwd0NtYXFUQTExVlZUcUxVZ1BSUjVnSVpTOEl1Nmd6aGgxT3lJd01j?=
 =?utf-8?B?RTdXOWVhd0hmVE5YN0hLVG1NRGNqNTdUMHh0WEhFYTQrcElLa2FRcFcyL2p0?=
 =?utf-8?B?M3hWTEo5aEtCdFkzeGpkcVVraFJ1Tkl6WWZyTTRRUkFxd0VNSUErUGMrc0tM?=
 =?utf-8?B?bWovdlc4amNMcjM2N0NiNlNDa2xZM1ZVc2oyeUFhOFZnU2JhcXY5V1JKS1pp?=
 =?utf-8?B?dkFuQWlYRC85SDZINjZwZXJVM0p2WGZLODduSlhoSzZzSDk3V1lPd2hCcFlr?=
 =?utf-8?B?R2RicThRdUgwYnpraXlDOXplQlFkekxhSmloaHlVTlovWkYrYUczVmxmTzBj?=
 =?utf-8?B?NmkzRW9HTkJHWmlyYzRNNkhVRUxxY1cvOURQOFdUZk1TaGlWbUpLblQ4WjBh?=
 =?utf-8?B?bDZucHFlc0o2dDN2N1NmVHM5T3ZBZUdrUGl4K3NtRC9EMVZOS3NBOU5OZ0k1?=
 =?utf-8?B?VUNHbTB0bXBIWmx5R0JKMWJNb1gxdkQ2YnltbW9meUpvN3BOZUZRcmlJMUFp?=
 =?utf-8?B?UXZabklJTUxqQ2JqVUJxaGJVMlp3eWkzdkRWNmRodHB0Vk4wOFFBejllM2RL?=
 =?utf-8?B?YjhEVFJhZEtJVm1jem1QMVFiMys5WC9TSFRycTF6MlVQQWZWZ2FscC9uaTJR?=
 =?utf-8?B?U3FidmlKTzVRRXFIOW14dEdGWmVFTFB6VXFselVqbkg1YlRXbVV0bnZ5dlQ3?=
 =?utf-8?B?c1ZiR3FHd29oSW1MaGlkaUFZd3pldXhpVGFnam1OV1ExS2hXT2JOUUFGS2FT?=
 =?utf-8?B?aEVyNzUrU0FFUG5xZGZmOUp3eUdZOHdWNEhFK3lEQS9COUw4bzRubHhHRE9v?=
 =?utf-8?B?S2lTdmhTUzg5SDJwKzkvaGdCVUJ6ZVlrQWk3QVluRzdQc0JPTnFpSUFZbXpQ?=
 =?utf-8?B?UDFYSzVmb25oQWY3WUZML1lBeU0yYkZnaHhEcFRjSFIrSlBMOXpoNVNOcHNT?=
 =?utf-8?B?VUVVSVVOYWtKZDJEQ1dqYVlJdVlDcjRNVFk5a3pnQTZwWE5rM05iKzFVQlZ5?=
 =?utf-8?B?c0MxTmpGMzNNZ3E2TEZuVjA4WG1lYzkwdHNFcVdsZDRCbUlMcEh4ejNYS1ZJ?=
 =?utf-8?B?Qm5kblpwRGpIWVNTVDFQWFlTNFBhdHlCVmJOMmx6ZUQ5ZURIYjBpaUZjVFNS?=
 =?utf-8?B?WjNsbDlvUUtUZ3F1eWxxdnM2SGxRQ1A5alFKd29DWHVPdW0rM2wvQ1l5Snox?=
 =?utf-8?B?eFV3OEtrd1VEeGpFY0JxcHVMcE5tbVZ1SE9uOExDZDJQeWoxS05kVW9XTFJi?=
 =?utf-8?B?U2pzTTYrVmxLdVNHeEdpbzZWRXBTWUpCd1llK3paMW9mWHFxTW5FTkl2NU9x?=
 =?utf-8?B?Z0g2Wlc1SmppanZkaXA1MElUeGJmNjUrZXljaDYwbE9rM2ludnUrOUwwVHFa?=
 =?utf-8?B?cHF5K1RYSG9GelpFb2pDVkVoOGloZTVaQzNCM3crVnNaR3RZZWVNTUpkeHBJ?=
 =?utf-8?B?VmRVMXZiVmhNbERGYVFuUldTb2JEMjVNaVhGc05EdkEvK2dta0JiaGJkWS9U?=
 =?utf-8?B?ZVl4YkZpNHVnODA2bGl1VjFNd3FiMmFndjBDTm11NHd3SVhlZXhZd0t4Vm12?=
 =?utf-8?B?VUZ4NDVGemlnOGFDakd0M3BhOWcrMXIxM25hODNjZm9HRnI3TW9sN0s5cVBs?=
 =?utf-8?B?eStnUE85SkdMMENOeHlOdjBaVGlGakdHajdtalFDVzAvUURUajdKSFMvY0lN?=
 =?utf-8?B?OFpWWW5kbk40OFp2VVdiMENzK0xHNUlrQjh2VzlMY2QranE4dk1aUUR5S1V2?=
 =?utf-8?B?SFdRWm1jK2dDdzJjajZHVTdsTG50emNPQWtndzFYQ2RxaXNzbkljUHljaFVO?=
 =?utf-8?B?SHgrSWlESHBPM0dlT3VOV1cvR2lOKzZSa1pYeHJWSUdHWkNlemFSNXBDeTR1?=
 =?utf-8?B?U0NDc09wbHpmQnBVbFlPOE1ZTU9CNnM1MHpKLzVEY1RZajFMMU9wb3lhL1ow?=
 =?utf-8?B?d2MwUFd2Y0xVWjFvQWduN0tmVUh3MWJKbHdlOHRUSkJ5YW9waVRCWVdHc0cv?=
 =?utf-8?B?Yk9jT3p0Q2lkUWJLSHVIZVZBOVB0K2Q3TERFa3phc1NhUStPN3c4VzQvY1VO?=
 =?utf-8?Q?+ugJa/NPaLYAFUvoKmtFiouRt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b96774-e634-4702-a3c3-08dcb70d56f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 18:18:30.2989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIX0BFOpytQLgfpHheeC5fxtQMtdy3JC829PSZbPSTEgWRuj0s69UCiXOkLcqmkC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7515
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



On 2024-08-07 03:17, Tom Chung wrote:
> [why]
> Add a basic IGT test for panel replay feature.
> 
> [how]
> Subtest case
> 
> a. static screen
>     1. Check if system support panel replay.
>     2. Start video flip for a while.
>     3. Stop video flip and wait for a while.
>     4. Check if replay state is in Replay mode.
> 
> b. Live mode (intermittent)
>     1. Check if system support panel replay.
>     2. Start video flip for a while.
>     3. Check if replay state is in Live mode.
>     4. Stop video flip and wait for a while.
>     5. Check if replay state is in Replay mode.
>     6. Repaet 2 to 5.
> 
> c. Live mode (constant)
>     1. Check if system support panel replay.
>     2. Start video flip for a while.
>     3. Check if replay state is in Live mode.
> 
> d. Resume from Suspend
>     1. Suspend the system and resume
>     2. Start video flip for a while.
>     3. Stop video flip and wait for a while.
>     4. Check if replay state is in Replay mode.
> 
> Cc: Leo Li <sunpeng.li@amd.com>
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>

Reviewed-by: Leo Li <sunpeng.li@amd.com>

Thanks!

> ---
> v2: Modify the include header files in tests/amdgpu/amd_replay.c
> v3: Fix some coding style issues. Add a new subtest case.
> v4: 1. Update enum replay_state and include file.
>      2. Modify the return value of igt_amd_read_replay_state()
>      3. Add a page_flip_test() to simplify the test function
> v5: Modify the bool page_flip_test() to void page_flip_test()
> 
>   lib/igt_amd.c             | 163 ++++++++++++++
>   lib/igt_amd.h             |  41 +++-
>   tests/amdgpu/amd_replay.c | 456 ++++++++++++++++++++++++++++++++++++++
>   tests/amdgpu/meson.build  |   1 +
>   4 files changed, 660 insertions(+), 1 deletion(-)
>   create mode 100644 tests/amdgpu/amd_replay.c
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 149af5151..3ddb5f403 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1014,6 +1014,169 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
>   	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_ILR_SETTING);
>   }
>   
> +/**
> + * igt_amd_output_has_replay_cap: check if eDP connector has replay_capability debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_CAP);
> +}
> +
> +/**
> + * igt_amd_replay_support_sink: check if sink device support Panel Replay
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_replay_support_sink(int drm_fd, char *connector_name)
> +{
> +	char buf[128];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);
> +
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		 DEBUGFS_EDP_REPLAY_CAP, connector_name);
> +	close(fd);
> +
> +	if (ret < 1)
> +		return false;
> +
> +	return strstr(buf, "Sink support: yes");
> +}
> +
> +/**
> + * igt_amd_replay_support_drv: check if driver support Panel Replay
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_replay_support_drv(int drm_fd, char *connector_name)
> +{
> +	char buf[128];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);
> +
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		 DEBUGFS_EDP_REPLAY_CAP, connector_name);
> +	close(fd);
> +
> +	if (ret < 1)
> +		return false;
> +
> +	return strstr(buf, "Driver support: yes") && strstr(buf, "Config support: yes");
> +}
> +
> +/**
> + * igt_amd_output_has_replay_state: check if eDP connector has replay_state debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_STATE);
> +}
> +
> +/*
> + * Convert raw panel replay state to emum panel replay state.
> + */
> +static enum replay_state convert_replay_state(uint32_t raw_state)
> +{
> +	switch (raw_state) {
> +	case 0:
> +		return REPLAY_STATE_0;
> +	case 0x10:
> +		return REPLAY_STATE_1;
> +	case 0x11:
> +		return REPLAY_STATE_1A;
> +	case 0x20:
> +		return REPLAY_STATE_2;
> +	case 0x21:
> +		return REPLAY_STATE_2A;
> +	case 0x30:
> +		return REPLAY_STATE_3;
> +	case 0x31:
> +		return REPLAY_STATE_3INIT;
> +	case 0x40:
> +		return REPLAY_STATE_4;
> +	case 0x41:
> +		return REPLAY_STATE_4A;
> +	case 0x42:
> +		return REPLAY_STATE_4B;
> +	case 0x43:
> +		return REPLAY_STATE_4C;
> +	case 0x44:
> +		return REPLAY_STATE_4D;
> +	case 0x45:
> +		return REPLAY_STATE_4E;
> +	case 0x4A:
> +		return REPLAY_STATE_4B_LOCKED;
> +	case 0x4B:
> +		return REPLAY_STATE_4C_UNLOCKED;
> +	case 0x50:
> +		return REPLAY_STATE_5;
> +	case 0x51:
> +		return REPLAY_STATE_5A;
> +	case 0x52:
> +		return REPLAY_STATE_5B;
> +	case 0x5A:
> +		return REPLAY_STATE_5A_LOCKED;
> +	case 0x5B:
> +		return REPLAY_STATE_5B_UNLOCKED;
> +	case 0x60:
> +		return REPLAY_STATE_6;
> +	case 0x61:
> +		return REPLAY_STATE_6A;
> +	case 0x62:
> +		return REPLAY_STATE_6B;
> +	default:
> +		return REPLAY_STATE_INVALID;
> +	}
> +}
> +
> +/**
> + * @brief Read Panel Replay State from debugfs interface
> + * @param drm_fd DRM file descriptor
> + * @param connector_name The connector's name, on which we're reading the status
> + * @return Panel Replay state
> + */
> +enum replay_state igt_amd_read_replay_state(int drm_fd, char *connector_name)
> +{
> +	char buf[4];
> +	int fd, ret, raw_state;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n", connector_name);
> +
> +		return -1;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_STATE, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		 DEBUGFS_EDP_REPLAY_STATE, connector_name);
> +
> +	raw_state = strtol(buf, NULL, 10);
> +	return convert_replay_state(raw_state);
> +}
> +
>   /**
>    * igt_amd_output_has_psr_cap: check if eDP connector has psr_capability debugfs entry
>    * @drm_fd: DRM file descriptor
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index 6780b99de..bce4657cb 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -47,6 +47,8 @@
>   #define DEBUGFS_EDP_ILR_SETTING "ilr_setting"
>   #define MAX_SUPPORTED_ILR 8
>   #define MULTIPLIER_TO_LR 270000
> +#define DEBUGFS_EDP_REPLAY_CAP "replay_capability"
> +#define DEBUGFS_EDP_REPLAY_STATE "replay_state"
>   #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
>   #define DEBUGFS_EDP_PSR_STATE	"psr_state"
>   #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
> @@ -100,6 +102,37 @@ enum dc_link_training_type {
>   	LINK_TRAINING_NO_PATTERN
>   };
>   
> +/*
> + * enumeration of REPLAY STATE below should be aligned to the upstreamed
> + * amdgpu kernel driver 'enum replay_state' in dmub_cmd.h
> + */
> +enum replay_state {
> +	REPLAY_STATE_0 = 0x0,
> +	REPLAY_STATE_1 = 0x10,
> +	REPLAY_STATE_1A = 0x11,
> +	REPLAY_STATE_2 = 0x20,
> +	REPLAY_STATE_2A = 0x21,
> +	REPLAY_STATE_3 = 0x30,
> +	REPLAY_STATE_3INIT = 0x31,
> +	REPLAY_STATE_4 = 0x40,
> +	REPLAY_STATE_4A = 0x41,
> +	REPLAY_STATE_4B = 0x42,
> +	REPLAY_STATE_4C = 0x43,
> +	REPLAY_STATE_4D = 0x44,
> +	REPLAY_STATE_4E = 0x45,
> +	REPLAY_STATE_4B_LOCKED = 0x4A,
> +	REPLAY_STATE_4C_UNLOCKED = 0x4B,
> +	REPLAY_STATE_5 = 0x50,
> +	REPLAY_STATE_5A = 0x51,
> +	REPLAY_STATE_5B = 0x52,
> +	REPLAY_STATE_5A_LOCKED = 0x5A,
> +	REPLAY_STATE_5B_UNLOCKED = 0x5B,
> +	REPLAY_STATE_6 = 0x60,
> +	REPLAY_STATE_6A = 0x61,
> +	REPLAY_STATE_6B = 0x62,
> +	REPLAY_STATE_INVALID = 0xFF
> +};
> +
>   /*
>    * enumeration of PSR STATE below should be aligned to the upstreamed
>    * amdgpu kernel driver 'enum dc_psr_state' in dc_type.h
> @@ -135,7 +168,8 @@ enum amdgpu_debug_visual_confirm {
>   	VISUAL_CONFIRM_HDR	= 2,
>   	VISUAL_CONFIRM_MPCTREE	= 4,
>   	VISUAL_CONFIRM_PSR	= 5,
> -	VISUAL_CONFIRM_SWIZZLE	= 9
> +	VISUAL_CONFIRM_SWIZZLE  = 9,
> +	VISUAL_CONFIRM_REPLAY = 12
>   };
>   
>   uint32_t igt_amd_create_bo(int fd, uint64_t size);
> @@ -189,6 +223,11 @@ void igt_amd_write_ilr_setting(
>   	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
>   	uint8_t link_rate_set);
>   bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
> +bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name);
> +bool igt_amd_replay_support_sink(int drm_fd, char *connector_name);
> +bool igt_amd_replay_support_drv(int drm_fd, char *connector_name);
> +bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name);
> +enum replay_state igt_amd_read_replay_state(int drm_fd, char *connector_name);
>   bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
>   bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode);
>   bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> new file mode 100644
> index 000000000..b5bb10b34
> --- /dev/null
> +++ b/tests/amdgpu/amd_replay.c
> @@ -0,0 +1,456 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +
> +#include "igt_amd.h"
> +
> +/* hardware requirements:
> + * eDP panel that supports Panel Replay
> + */
> +IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
> +
> +#define REPLAY_SETTLE_DELAY 10
> +
> +/* Common test data. */
> +struct test_data {
> +	igt_display_t display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +	igt_pipe_t *pipe;
> +	drmModeModeInfo *mode;
> +	igt_fb_t ref_fb;
> +	igt_fb_t ref_fb2;
> +	igt_fb_t *flip_fb;
> +	enum pipe pipe_id;
> +	int fd;
> +	int debugfs_fd;
> +	int w, h;
> +};
> +
> +struct {
> +	bool visual_confirm;
> +} opt = {
> +	.visual_confirm = false,	/* visual confirm debug option */
> +};
> +
> +const char *help_str =
> +"  --visual-confirm           Panel Replay visual confirm debug option enable\n";
> +
> +struct option long_options[] = {
> +	{"visual-confirm",	required_argument, NULL, 'v'},
> +	{ 0, 0, 0, 0 }
> +};
> +
> +enum test_mode {
> +	TEST_MODE_STATIC_SCREEN = 0,
> +	TEST_MODE_INTERMITTENT_LIVE,
> +	TEST_MODE_CONSTANT_LIVE,
> +	TEST_MODE_SUSPEND,
> +	TEST_MODE_COUNT
> +};
> +
> +/* Common test setup. */
> +static void test_init(struct test_data *data)
> +{
> +	igt_display_t *display = &data->display;
> +
> +	/* It doesn't matter which pipe we choose on amdpgu. */
> +	data->pipe_id = PIPE_A;
> +	data->pipe = &data->display.pipes[data->pipe_id];
> +
> +	igt_display_reset(display);
> +
> +	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
> +	igt_require(data->output);
> +	igt_info("output %s\n", data->output->name);
> +
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_assert(data->mode);
> +	kmstest_dump_mode(data->mode);
> +
> +	data->primary =
> +		 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +
> +	data->w = data->mode->hdisplay;
> +	data->h = data->mode->vdisplay;
> +
> +	data->ref_fb.fb_id = 0;
> +	data->ref_fb2.fb_id = 0;
> +
> +	if (opt.visual_confirm) {
> +		/**
> +		 * if visual confirm option is enabled, we'd trigger a full modeset before test run
> +		 * to have Panel Replay visual confirm enable take effect. DPMS off -> ON transition
> +		 * is one of many approaches.
> +		 */
> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
> +			 DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
> +			 DRM_MODE_DPMS_ON);
> +	}
> +}
> +
> +/* Common test cleanup. */
> +static void test_fini(struct test_data *data)
> +{
> +		igt_display_t *display = &data->display;
> +
> +		igt_display_reset(display);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +}
> +
> +static int check_conn_type(struct test_data *data, uint32_t type)
> +{
> +	int i;
> +
> +	for (i = 0; i < data->display.n_outputs; i++) {
> +		uint32_t conn_type = data->display.outputs[i].config.connector->connector_type;
> +
> +		if (conn_type == type)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static bool replay_mode_supported(struct test_data *data)
> +{
> +	/* run Panel Replay test if eDP panel support Panel Replay */
> +	if (!igt_amd_output_has_replay_cap(data->fd, data->output->name)) {
> +		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_CAP);
> +
> +		return false;
> +	}
> +
> +	if (!igt_amd_output_has_replay_state(data->fd, data->output->name)) {
> +		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_STATE);
> +
> +		return false;
> +	}
> +
> +	if (!igt_amd_replay_support_sink(data->fd, data->output->name)) {
> +		igt_warn(" output %s not support Panel Replay mode\n", data->output->name);
> +
> +		return false;
> +	}
> +
> +	if (!igt_amd_replay_support_drv(data->fd, data->output->name)) {
> +		igt_warn(" kernel driver not support Panel Replay mode\n");
> +
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/* Read from /dev/drm_dp_aux
> + * addr: DPCD offset
> + * val:  Read value of DPCD register
> + */
> +static bool dpcd_read_byte(int drm_fd,
> +	drmModeConnector *connector, uint32_t addr, uint8_t *val)
> +{
> +	DIR *dir;
> +	int dir_fd;
> +	uint8_t buf[16] = {0};
> +	*val = 0;
> +
> +	dir_fd = igt_connector_sysfs_open(drm_fd, connector);
> +	igt_assert(dir_fd >= 0);
> +
> +	dir = fdopendir(dir_fd);
> +	igt_assert(dir);
> +
> +	for (;;) {
> +		struct dirent *ent;
> +		char path[5 + sizeof(ent->d_name)];
> +		int fd, ret, i, j, k;
> +
> +		ent = readdir(dir);
> +		if (!ent)
> +			break;
> +
> +		if (strncmp(ent->d_name, "drm_dp_aux", 10))
> +			continue;
> +
> +		snprintf(path, sizeof(path), "/dev/%s", ent->d_name);
> +
> +		fd = open(path, O_RDONLY);
> +		igt_assert(fd >= 0);
> +
> +		k = (addr / 16) + 1;
> +		j = addr % 16;
> +
> +		/* read 16 bytes each loop */
> +		for (i = 0; i < k; i++) {
> +			ret = read(fd, buf, sizeof(buf));
> +			if (ret < 0)
> +				break;
> +			if (ret != sizeof(buf))
> +				break;
> +		}
> +
> +		close(fd);
> +
> +		closedir(dir);
> +		close(dir_fd);
> +
> +		if (ret > 0)
> +			*val = buf[j];
> +
> +		return (ret > 0);
> +	}
> +
> +	closedir(dir);
> +	close(dir_fd);
> +
> +	return false;
> +}
> +
> +static void page_flip_test(struct test_data *data, igt_output_t *output,
> +						 enum test_mode test_mode, uint32_t frame_num)
> +{
> +	int ret, frame_count;
> +	enum replay_state replay_state;
> +	uint8_t panel_dpcd = 0;
> +
> +	if (!data || data->ref_fb.fb_id == 0 || data->ref_fb2.fb_id == 0
> +	    || frame_num <= 5) {
> +		igt_skip("Page flip failed.\n");
> +	}
> +
> +	data->flip_fb = &data->ref_fb;
> +
> +	for (frame_count = 0; frame_count <= frame_num; frame_count++) {
> +		ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +				data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		igt_require(ret == 0);
> +		kmstest_wait_for_pageflip(data->fd);
> +
> +		if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
> +				&& frame_count > 5) {
> +			/* Panel Replay state needs few frame to enter the live mode */
> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +			igt_debug("replay_state live mode = 0x%X\n", replay_state);
> +			igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
> +					"State should be REPLAY_STATE_4 (Active with single frame update)\n");
> +			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +		}
> +
> +		if (frame_count % 2 == 0)
> +			data->flip_fb = &data->ref_fb2;
> +		else
> +			data->flip_fb = &data->ref_fb;
> +	}
> +}
> +
> +static void run_check_replay(struct test_data *data, enum test_mode test_mode)
> +{
> +	int edp_idx;
> +	enum replay_state replay_state;
> +	igt_output_t *output;
> +	uint8_t panel_dpcd = 0;
> +
> +	test_init(data);
> +
> +	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> +	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
> +
> +	/* check if eDP support Panel Replay. */
> +	igt_skip_on(!replay_mode_supported(data));
> +
> +	for_each_connected_output(&data->display, output) {
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6, 0.6, 0.6, &data->ref_fb);
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.4, 0.14, &data->ref_fb2);
> +
> +		igt_plane_set_fb(data->primary, &data->ref_fb);
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +		data->flip_fb = &data->ref_fb;
> +		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +			 data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		kmstest_wait_for_pageflip(data->fd);
> +
> +		/* Panel Replay state takes some time to settle its value on static screen */
> +		sleep(REPLAY_SETTLE_DELAY);
> +
> +		/* Check Panel Replay state */
> +		replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +		igt_debug("replay_state static mode before flip = 0x%X\n", replay_state);
> +		igt_fail_on_f(replay_state < 0, "Open Panel Replay state debugfs failed\n");
> +		igt_fail_on_f(replay_state < REPLAY_STATE_2,
> +			 "Panel Replay was not enabled for connector %s\n", output->name);
> +
> +		/* Do some page flip and let the replay go into live mode */
> +		page_flip_test(data, output, test_mode, 20);
> +
> +		/* Check Panel Replay state in static screen */
> +		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
> +			/* Panel Replay state takes some time to settle its value on static screen */
> +			sleep(1);
> +
> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +			igt_debug("replay_state static mode = 0x%X\n", replay_state);
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +				 "State should be REPLAY_STATE_3 (Active)\n");
> +			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +		}
> +
> +		/* Do another page flip if we do the replay_intermittent_live test */
> +		if (test_mode == TEST_MODE_INTERMITTENT_LIVE) {
> +			page_flip_test(data, output, test_mode, 30);
> +
> +			/* Panel Replay state takes some time to settle its value on static screen */
> +			sleep(1);
> +
> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
> +				 replay_state);
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +				 "State should be REPLAY_STATE_3 (Active)\n");
> +			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +		}
> +
> +		igt_remove_fb(data->fd, &data->ref_fb);
> +		igt_remove_fb(data->fd, &data->ref_fb2);
> +	}
> +
> +	test_fini(data);
> +}
> +
> +static void run_check_replay_suspend(struct test_data *data)
> +{
> +	int edp_idx;
> +	enum replay_state replay_state;
> +	igt_output_t *output;
> +	uint8_t panel_dpcd = 0;
> +
> +	test_init(data);
> +
> +	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> +	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
> +
> +	/* check if eDP support Panel Replay. */
> +	igt_skip_on(!replay_mode_supported(data));
> +
> +	for_each_connected_output(&data->display, output) {
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6, 0.6, 0.6, &data->ref_fb);
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.4, 0.14, &data->ref_fb2);
> +
> +		igt_plane_set_fb(data->primary, &data->ref_fb);
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +		data->flip_fb = &data->ref_fb;
> +		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +			 data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		kmstest_wait_for_pageflip(data->fd);
> +
> +		/* Suspend and Resume */
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +		/* Do some page flip and let the replay go into live mode */
> +		page_flip_test(data, output, TEST_MODE_SUSPEND, 10);
> +
> +		/* Panel Replay state takes some time to settle its value on static screen */
> +		sleep(REPLAY_SETTLE_DELAY);
> +
> +		replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +		dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +		igt_debug("replay_state static mode = 0x%X\n", replay_state);
> +		igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +			 "State should be REPLAY_STATE_3 (Active)\n");
> +		igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +
> +		igt_remove_fb(data->fd, &data->ref_fb);
> +		igt_remove_fb(data->fd, &data->ref_fb2);
> +	}
> +
> +	test_fini(data);
> +}
> +
> +static int opt_handler(int option, int option_index, void *data)
> +{
> +	switch (option) {
> +	case 'v':
> +		opt.visual_confirm = strtol(optarg, NULL, 0);
> +		igt_info("Panel Replay Visual Confirm %s\n",
> +			 opt.visual_confirm ? "enabled" : "disabled");
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +igt_main_args("", long_options, help_str, opt_handler, NULL)
> +{
> +	struct test_data data;
> +
> +	igt_skip_on_simulation();
> +	memset(&data, 0, sizeof(data));
> +
> +	igt_fixture
> +	{
> +		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
> +
> +		if (data.fd == -1)
> +			igt_skip("Not an amdgpu driver.\n");
> +
> +		data.debugfs_fd = igt_debugfs_dir(data.fd);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(&data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +
> +		/* check if visual confirm option available */
> +		if (opt.visual_confirm) {
> +			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
> +			igt_skip_on_f(!igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_REPLAY),
> +				 "set Panel Replay visual confirm failed\n");
> +		}
> +	}
> +
> +	igt_describe("Test whether Panel Replay can be enabled with static screen");
> +	igt_subtest("replay_static_screen") run_check_replay(&data, TEST_MODE_STATIC_SCREEN);
> +
> +	igt_describe("Test whether Panel Replay can be enabled with intermittent live mdoe");
> +	igt_subtest("replay_intermittent_live") run_check_replay(&data, TEST_MODE_INTERMITTENT_LIVE);
> +
> +	igt_describe("Test whether Panel Replay can be enabled with constant live mdoe");
> +	igt_subtest("replay_constant_live") run_check_replay(&data, TEST_MODE_CONSTANT_LIVE);
> +
> +	igt_describe("Test whether Panel Replay can be enabled after resume from suspend");
> +	igt_subtest("replay_suspend") run_check_replay_suspend(&data);
> +
> +	igt_fixture
> +	{
> +		if (opt.visual_confirm) {
> +			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
> +			igt_require_f(igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE),
> +				 "reset Panel Replay visual confirm failed\n");
> +		}
> +		close(data.debugfs_fd);
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 36d65f44b..7d40f788b 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -30,6 +30,7 @@ if libdrm_amdgpu.found()
>   			  'amd_prime',
>   			  'amd_psr',
>   			  'amd_ras',
> +			  'amd_replay',
>   			  'amd_security',
>   			  'amd_uvd_dec',
>   			  'amd_uvd_enc',
