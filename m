Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CC5D5CCB4
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 14:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674DB10E7AA;
	Wed, 30 Oct 2024 14:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="noJ4nN8K";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951C210E7AA
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 14:35:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqG1MjinOrYixFK1QHTYA3jKqdGI0FVouAQQUR2wZa26nVPYP7cayt8p1JzsO3ql13fBJ1+A8pLRHs//+zSTSzotkj6Qdwd/iAk34qL4Gujq6qspxqSoZqfu16qjPsRnkLLbRn8bPZ//tyxsz5G/peutKG2htaoJ8vcZOoMeajm9jxbRB57ZkOqSt7kjFXscPNPt6pPt0y7xHB/ufRBCw1vUlEVDGQgoUO8zJSXmnYgiF/6nUtcNUsZpHjdlF/6LoAsHRFALBXYUSV/qkO2JlQ0MnBS6orjHPPHPtWcF69l4Ay6dETyzwvIXGEx91t4bPJkcbNq/P046ss9mWjcUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBc7wovYRgTHo3eHp/C/+bFoLKYTqRTd2hdVWJwa/+g=;
 b=MNiTJY27Epuf2EY5YDRKkKn4zvGkKIhbaEFzaUBgJ4Fc6sOSH/n38TMl6ySDUsuJxbfU6XG/jZWjmZRQJMsBloYkLCKd60YqCDvdNW5ityZ0uu19TbtWX7wIvOI2+RMyoXs4aS+i21rBKUvhD/Qh1E5YXFW8ss/g5srrGTOPOF+9RrhtjO+XA1sfhdRwY/iINiAkijfZWENuI8djWxluAr+JI4Iod3pgTw9qvt6Jp48bM5DLc/xcbyp0XYhlmhKJAatlJEdqWsxTt5T1KtMfi0Fehl2MpayVx0bO8l0wymTk4ZXbRKGT5BgVYwQJ78CrGvYnxzsCTG5/gbkDwekh6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBc7wovYRgTHo3eHp/C/+bFoLKYTqRTd2hdVWJwa/+g=;
 b=noJ4nN8KzeBNlDxG59xb8XsX2E/mbE9pUf9/yrBMcANqaJZ9WzxLSQCA4wSkJ9Mbu6OV3weArYNijaeZHNu6nZMMvJIb/5/EhVdiVSAcJ5E+X6hlFSfAYcJQWxsZ9hIOyIBLUdxemVLYiIKPmL1kz2hmVnmlb7SCs9oBpJDXMrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 DS0PR12MB7993.namprd12.prod.outlook.com (2603:10b6:8:14b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.20; Wed, 30 Oct 2024 14:35:49 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 14:35:49 +0000
Message-ID: <abdc4800-26aa-47cb-8c11-5ff03fe9a650@amd.com>
Date: Wed, 30 Oct 2024 10:35:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_replay: Add some page flips before
 test start
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: Rodrigo.Siqueira@amd.com, alex.hung@amd.com
References: <20241030095301.11671-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20241030095301.11671-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::42) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|DS0PR12MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 0338b892-4470-46b0-f56b-08dcf8f025ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1F1L3lEenBZT2dnbThmcE1oMEN4bEgzemNBMWcyajhRTHhtVmRJbWE2Ykhs?=
 =?utf-8?B?eFFiU1VFWlRoT0dZMjFNaXZ5Z3puelIxcCtlanVWNVlhZFErMFUvWm02US9E?=
 =?utf-8?B?a0JKbnU3aVNvL21JRWlwYVhMOHdCUjlvcVY1d1lBakZvZGl0QTBmem1FQlls?=
 =?utf-8?B?RmhsUFZLL0gxRmptK1FzRDZlVWpoS2V1ZEpyaHR6NGNZYjlTcnJkNmN4LzJ4?=
 =?utf-8?B?QWZmSU5KelVFRHB2UzBLVk1mL2p4dTI4MVZMdFppSHptc1hhRVg5dFJCaXZS?=
 =?utf-8?B?TzBOSUNEbWNkWXk2YW82eUNIR21QL2V3UnF1TXpWTENDV29Mc1IwL1RCaTI0?=
 =?utf-8?B?WG1STUJPaU13eGw3eHpZN2s4Sml3blhZQzhFbHBFelg1bmZ0L0llYmpnL0da?=
 =?utf-8?B?MVpVVC94dTk2WmRzM0VnblU3MjFwTlRoRkM5b2FVMlplVXdaMTNvRjc2WWpE?=
 =?utf-8?B?LytqUGhQK1FXQkQ4VEtCdzlhU0JkeFNKdDJRTTB5OTM5SjFza1pQcktOZm91?=
 =?utf-8?B?Sjl1Nm5GY3hWZUYxdTZzTncvUm1GSUU4WmUveXd6eDQ2SGQzZ1lMT2I1NWI0?=
 =?utf-8?B?aUp5eXc2OWRUVk9pZTBrS0trc2hpaDJHVFBWdTA1WEhiVHVqRDBLWGtFVU5O?=
 =?utf-8?B?RWhIZldPQ045L0hPSVBSQ2lrRGtwbDczdmtJaG9QSDF1N2Njd25ubWVDMkJv?=
 =?utf-8?B?b3JVYVMyWU5vM0k1S2FkOEJ1UExNM1ZqMmY2bU5MOUx1TThzN0xtOXNxMzBy?=
 =?utf-8?B?eEU5Mjg2NjJBMWxmeHNLbGpjUFdIUjVSZ2w0SUJmVEpSOGw0ODRrOHRjVTIy?=
 =?utf-8?B?WDVDNU82a3BCZUVrSlBpb3VKYzJvQUszamZDU0MxWElXK3h2Y0dBOXpCZVB0?=
 =?utf-8?B?R2dmd3pzSVc3b0hsc1N1c1ZIOTdSQVlEMWRVdGJhUTR5N2JuSVhBYy95TzVP?=
 =?utf-8?B?UjhNbDIwMmxOTmdaR0FWL282M3BKd3dTZW00SXFJc2k3aWExTmt6UGpkTTUx?=
 =?utf-8?B?Z1g2UW5FazNKaW5CT3F4S2xwcWUrb2MxNjFOYUFOL1ZnMTBUOTVjTWVmc2kw?=
 =?utf-8?B?OVNuUXZlUnJReWhVWFFJSnllNDcyWXRGOEhIK2JvaEdhdnAyUzlQQWFpemJI?=
 =?utf-8?B?S1VQem9DWkhrbDNlb2tFMTRleDYvcEh4TGJlSnlONTJ3Qks2THI0d0pQdEJR?=
 =?utf-8?B?bEhESDFwaGU1UXhUVUEvTGtlYk9vL0tlK0dIM21pUzFVRDFDY0VnUE9FNjdY?=
 =?utf-8?B?ckxPM29JTUVrQkk3UitoTzU2VFI4OXJ0NlprSWltQkpzTHVPUUtQS1ROZldk?=
 =?utf-8?B?aDNyckd6NjVEYTMrZHpDWWJJSUhxTys5YTVRZGNlNnQ3UmJhMTBqbkhmRXI5?=
 =?utf-8?B?aGovUzlGNEJQNnZ0WWdtelAwT0JGRVMvcElHN3B6Si8wWnVDNkkzVE4waXE4?=
 =?utf-8?B?WWpaZGNlRnpnTDdWbVBpdUhJOFpTaW9LY0lacW1MUWdUM1BxcVZWcTVKZ2N3?=
 =?utf-8?B?dmFCQTFJL3BTQ0UwTk9jMVNBNFpxTCs5MUtZMmVyOG83ZEhWeC94OGRlN1hj?=
 =?utf-8?B?WkRDVzN3L09yTmVFZUZkSEJCRWpHbGdqeTc1ZEw5Q3R0M2RPTGpqSUpLZ0ht?=
 =?utf-8?B?b3Q4T0crZlh1SUcvNXRKbU1OTFQ4UGNBSzErU0xGZlFMWUdhaTdMQTFwN2d2?=
 =?utf-8?B?WWhJa1pKVnZPU1FSV1RlbnBJS1FDNGR6eDY0ZXBFa2tSbUJoNXlKNzkwYlBB?=
 =?utf-8?Q?mCE0eHDNQkwp4SOX0pdpfV0WmQ3NM+6DwqHLdBp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnUzcXpnSEZrbGdGU2xTZ0JhYk1sNm0xVXNnb0NacnVvWHo0SFJEb01KOVlY?=
 =?utf-8?B?OU9qUE84eGdOdmpmWVhTYVFYT0FMYkFDSzFMUm9FT2FvRWRRM3pjYWhNeXZs?=
 =?utf-8?B?ZDd2VU1hRVM4aTRlby9mM2ZXb0ErdVo1aGlsa3p5cDF2TGxZcWJTbnhNMXF0?=
 =?utf-8?B?NGsvcFZLYm5BdXJmZDdhakNpWmRCZUt2QUZUU1QyVVp4TFdNanE2TThkMUw1?=
 =?utf-8?B?S0MzWVBjT2UvVVE4RUJqbU9hekdERVNZWFltNXdvalA5NnV2U1pmSEoyUzA0?=
 =?utf-8?B?ajQ1WW1rRW1FbzFWL2hoMXRubjFMOEdrUUJJRlBTTEY0Z2NWV1AxeTl6akdn?=
 =?utf-8?B?UUpUVmhsb05YeTJFc2ZnTjA4UFc4WFlKZytidm1FTHZjdEFZQVdlUnprNXRS?=
 =?utf-8?B?MkJla0RQZWZnYUxvb043U3MvVjc1eUdKT3RWYnlyWjlRSm9BQUZuM1dqanFM?=
 =?utf-8?B?UWk0NHlRMWp3bkJPV0g3V0hrTE5CckovL1lYRDY1MUo0S2FFK0xvNWZ2TUlw?=
 =?utf-8?B?ZXdYSTB6aVhvdW5RaUE1ejBGMUZBLzd0MkNhQTExTG1JOWdGbkVpNGlRWDJr?=
 =?utf-8?B?aWt1NW5GbVNQUmQ0eGlaNGtINDFneEJZdnF6M0dKa2FXeEYzK0lwYTlDbUhz?=
 =?utf-8?B?bU1hUUtKdFdZRWhEYWpRdVRYNEFRaGVOZ0I0R2VQZUdzWXlsR21XdGY0YjBV?=
 =?utf-8?B?dVFUTW56QzZ6b2VTdGRjeVpGenh6TTd6a21xNXNqVXRiZFhjQVB6L2E5L2Nn?=
 =?utf-8?B?aVBtMVhMNytGSXdSc3hQbjBVdm45VkRxRjhSTDJDaks3UDdFcVZaUWJGbjlR?=
 =?utf-8?B?OWI0MVZNVUZ2SkVHL1ZCMTNpdndyeno2Uk1JV3ZBVG42RXBFaW96YldidFFj?=
 =?utf-8?B?YTlyb0kyRkpoUjVnR0RPTlZVM1lKS3pVek9oUnlCTmpkTEJHNlVHcTBXa1pT?=
 =?utf-8?B?enQrTldiQXN4RFNKQ005cVV6ME5lVjNJWUJXNW0rYXE0eHNrTVd6TmIxTWwz?=
 =?utf-8?B?TXFHcEVlbjZuY1M5WWVHY3RPLzBnc0pNaTJyMlVoeEFySVNwcy9MZ2dqbzhi?=
 =?utf-8?B?N0xFbWZCVlJ4RElkWmtBdmJQUWgrSkFkZ1ptUnh3YnhLTXVBZG5OTUZtSlJ2?=
 =?utf-8?B?WVNKSC9iVGxUVTJOSDhhUTBZS1VDbGdRUHV5UU5HWitLYStQNjZvMUphaG9u?=
 =?utf-8?B?Mkkyd2JPRWNpQ1crL2tUR2F4bXNubWxwRzBjTVlNbkp1TFNpYkpyaDFoaVg5?=
 =?utf-8?B?RjJRNUF1WmcvM1EvNDVXVGZqV09MdW5LLzNveXNyUW1xWFAyMEJHampib2Ix?=
 =?utf-8?B?aXhuTFFvYkVZS2h3T1RLRDFIeDY5eDIrWkN1SUF6QWxVYkI2KzBiY3FEUVNJ?=
 =?utf-8?B?WFBGU3FiejdybHhzL2J0UWtjVTBQMklKZTRVTTVwbkYvMS8zYytFYy9Ca2Rh?=
 =?utf-8?B?TzFtZXBaMzBlT0p5enB4amhJRkFLb25RL0N5VzJ4aCtDdEZLZWpsMmNCbEpE?=
 =?utf-8?B?ZGh2ZGcyVnduYVVJVUNJbEJUdU5sYjU0eHJwYkVmVm5vUzdaWXZQM0lpQ1N6?=
 =?utf-8?B?M0NwVUJldVpsWGxYenFyb0VBc1Nqc01lMDBWREp1L1ZDSkI2UjBZTy9JWEtj?=
 =?utf-8?B?UjJoZVhOTERaemJXWFF5bWZ0VDFHd2tVYTBpRGtEYzk0UEp0UHdiSUk5ZzNT?=
 =?utf-8?B?emUwdFpVZ0k2Q1A4Q25OSEtaYm8zcVlDaEdQK010OHNzd05VL05yeW9QMWQy?=
 =?utf-8?B?ZHg1OFl4Yzl0emh6dmVYdDZMVjdvSkt2dEk0L3JkS3BzdzlaQ1NPazFOdmRj?=
 =?utf-8?B?T09xZ3BrZ21MaU9RcWdVWmNvOHAybjRHc05Lb3g5amZpR0VsVWhzbythRTc2?=
 =?utf-8?B?SjErTHU5ZGFMY3I2RlR3UUJkVzEyRm5HWDI2VUJXUlZUZ0xPL3BzSWNUMzk1?=
 =?utf-8?B?QXdPczlsQXRaNkU3U2hQaUJRZ2pQUk9GUEt1b1VnRk5Kc0ZBbVBpQlRpTDRB?=
 =?utf-8?B?Z2Ivc1NKakFVR1ZJTmJDSjVBQmFueHNLWk9PRmM1bTBVZ0pORGJobHZKNEJY?=
 =?utf-8?B?TE1YQlFQeTNoMVcvbkxJODZDUUJRaVkvckZ4SjBlRlUvOEFXMS94Mmo5V2xS?=
 =?utf-8?Q?dTU1CUrpiwa3k/64sMGtgghfQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0338b892-4470-46b0-f56b-08dcf8f025ce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 14:35:49.8591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cbhpt4WTLFYckdqSnf/9o+CjgBp2D9K/JaFv0e6gtNqz4bC3S7CFGZb1wJ9yH9nf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7993
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




On 2024-10-30 05:51, Tom Chung wrote:
> [Why]
> New panel replay driver behavior skip some atomic commits before
> enable the panel replay.

Let's add here the reason for future readers:

This is because a kms client needs to submit fb updates via kms in order for
amdgpu to flush updates to the panel. If a client updates the fb without going
through kms (by directly blitting to it, for example), then any panel self-
refresh feature needs to be disabled. Therefore, the driver vets the client by
counting an adequate amount of atomic updates before enabling self-refresh features.

With that, this is

Reviewed-by Leo Li <sunpeng.li@amd.com>

Thanks,
Leo

> 
> [How]
> Add some page flips before test to let the panel replay can be
> enabled first.
> (This change can be backward compatible with old driver)
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
>   tests/amdgpu/amd_replay.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> index b5bb10b34..db2ac2de9 100644
> --- a/tests/amdgpu/amd_replay.c
> +++ b/tests/amdgpu/amd_replay.c
> @@ -14,6 +14,7 @@
>   IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
>   
>   #define REPLAY_SETTLE_DELAY 10
> +#define FLIP_FRAME_BEFORE_TEST 60
>   
>   /* Common test data. */
>   struct test_data {
> @@ -50,6 +51,7 @@ enum test_mode {
>   	TEST_MODE_INTERMITTENT_LIVE,
>   	TEST_MODE_CONSTANT_LIVE,
>   	TEST_MODE_SUSPEND,
> +	TEST_MODE_FLIP_ONLY,
>   	TEST_MODE_COUNT
>   };
>   
> @@ -282,6 +284,9 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
>   			 data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
>   		kmstest_wait_for_pageflip(data->fd);
>   
> +		/* Do some page flips and let the replay enable */
> +		page_flip_test(data, output, TEST_MODE_FLIP_ONLY, FLIP_FRAME_BEFORE_TEST);
> +
>   		/* Panel Replay state takes some time to settle its value on static screen */
>   		sleep(REPLAY_SETTLE_DELAY);
>   
> @@ -366,7 +371,7 @@ static void run_check_replay_suspend(struct test_data *data)
>   		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
>   
>   		/* Do some page flip and let the replay go into live mode */
> -		page_flip_test(data, output, TEST_MODE_SUSPEND, 10);
> +		page_flip_test(data, output, TEST_MODE_SUSPEND, FLIP_FRAME_BEFORE_TEST);
>   
>   		/* Panel Replay state takes some time to settle its value on static screen */
>   		sleep(REPLAY_SETTLE_DELAY);

