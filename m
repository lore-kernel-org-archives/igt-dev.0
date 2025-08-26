Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46420CA0FE9
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 08:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E882E10E2EC;
	Tue, 26 Aug 2025 08:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zEVrMPBR";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF54E10E2EC
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 08:43:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBxOA7gYHUQAnJAkpnmZ3Y4/YWlHjM+7nv2NuhWI6NcAbbSpKL4kBsBwWXxOY340fOoGcklSbEqtdIO8XYVkfxrlxdf7a9kQl4bOel4CylMU8gNpnJ6Om6X3HKC4j9XbEz+DKY7ozbdE6N6QQwHDpTjEfhYVdFmnunZy4eFNRZS3fPc9SlYeHt71ClQX95v8iL/QKzqDQtRzBmuHaZkHqvMEKP3FaR4tUvXSw7cfSyC3h3mzHlzy6F7guoCEptHMNcI5jcUAWp+xTiWyPzjpjdwN6TcqjaKBhOuj/raB5z7pzKUOn2Ygykb1oDaH7v+QsszYBHJOCj+w+o/ropSDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xg+P1h5V13v75jS4PkgMSfKH7TF8k6dgIOZ7PT86bvU=;
 b=JZeNGHW1TRCyQy/kZxYD4Sv+jjWSEwZ9ZH/ru1ltnN6MQO/4abrgwk1FqPw+PxmjP7vrdhoA+qsenaEuzwXEJJP2aPoM8Pxd5Lx1te9V8BuyaqMbmLfnRMPEbFTYZNoMJ7GOQIy334xGVMkbjMmqmzXLJlCbmdvuZOM2Z1JYteGHCs1Npo+DDEQth1j9CmuMQC44MOSAhfV2DRKNX37U2/9mBWy/CAPL1K/SM0aG89IOhqUOHlj2Tvb6EQlY6vWeg37AlklsSyfHj2vwzeDI1Tz74K3DkHijIHJBk1g3IRgFxvU1lgh/ZXWC790wkdDm4mzc4+Q/5qcbXkLnbg31oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xg+P1h5V13v75jS4PkgMSfKH7TF8k6dgIOZ7PT86bvU=;
 b=zEVrMPBRyN73TdPylKAcss7LwfI02PvT/+eeEiWWvKT0jTi1/W3Tg6pF8e45ImibX+B1HY6x6WcfXwM0ON9FlKcM0m9bhO3jdq8QucrpUoRIlvwU4JW+E3M1Woe1Wqwf31sz1aagXc2jsFv17gAJiZVEZiF0AEUk8C5EUXOw6Zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8815.namprd12.prod.outlook.com (2603:10b6:8:14f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Tue, 26 Aug
 2025 08:43:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 08:43:31 +0000
Message-ID: <982eef5f-6237-4d92-a954-13830941d6a7@amd.com>
Date: Tue, 26 Aug 2025 10:43:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu/tests: make amdgpu_sync_dependency_test work on
 gfx12
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20250825181047.45203-1-vitaly.prosyak@amd.com>
 <DM4PR12MB515260D67BCA40FBC02A6E27E339A@DM4PR12MB5152.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM4PR12MB515260D67BCA40FBC02A6E27E339A@DM4PR12MB5152.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR19CA0027.namprd19.prod.outlook.com
 (2603:10b6:208:178::40) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6ecfac-e01c-47c3-db15-08dde47ca2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWZqY3gyNjFWT0I4YTlTMFZOb0F6L1RxQVJZSnJRWENUUlJIaksxL0RTbnRy?=
 =?utf-8?B?bk4ramIwaEh5clN3SUMrKzZIa0ZkV2FRSFhlT09zU1A1OGVXYS9tNEVqalkz?=
 =?utf-8?B?dU9YYzdDQUR5dXVXOXMxZG9HNno0VUpkeHZtR1owNUcvR3B0c0VnY0FPVHo4?=
 =?utf-8?B?YndPNm8vN2tGY3FoTHRQa0lKRXNhYnBua2hRWnJwK3NvOGJKMlo1cERQNW1T?=
 =?utf-8?B?UmZzSUYvZXVzamVkSXNmdTFRbi9BdjlpUkEvQkxpYjBwUEtRUUlDUS9FR0lB?=
 =?utf-8?B?aWM1ZTA0b1VSaTR3Zkg3MjU5RzFWNmxaYUpyRVprenIwcnZSbkdxUFhUTnlS?=
 =?utf-8?B?NFptcUV4VzlEZ3FIM0kyd0tIZDc2QUFXZlZYbXUwcEpqb0Q0S3hxVlBxYTdG?=
 =?utf-8?B?bVpoMG05WDFDbm8wMFJkdFNzclhPRVMvcVF0VTM4eW9ITXd6Z1o1bGZObUVU?=
 =?utf-8?B?LzQrdXlQQytKcXo4TzQ0TXJTSkt2RHNqL0o2UURPT3dSdUVBQy9jUGZIK1dq?=
 =?utf-8?B?ZU16dk5vT3MzQUJsb0VTYjI4UUY4bjJ6M0VtSmVkendYV3pZM1FMQUVSYW5j?=
 =?utf-8?B?anFnZ0RuelRqS203WmQ2WHE4VTdnalRwVzN2V0hyT1dhRmxpTE84dU41a1c3?=
 =?utf-8?B?VVJlWENRUG5nNjlaV1BMeHRrK1BaR3JobDQweXFCRXVEd2U5b1hrQ0Rub1hx?=
 =?utf-8?B?VDFaL25VdTVKYUlVK3NPTmNWWVdrdWphWjc4VmozZWJvd0hPV2tGdnJKdWNO?=
 =?utf-8?B?dzcwR2xpZnR4c1NxQ3E1MWx3MDg4TFFUNkNNQ1lBSlFvUlNHNDBjdFdEZzQ5?=
 =?utf-8?B?NkRtV0FQN0k3dVdhOE9LQ1RjVm9vY0ZvK1JPVk53R01qbno5WlFyN2NWMnFk?=
 =?utf-8?B?SnlCK3BDeEp2NW5tcjNYcjZpcExZV3pZbDByS2l0M1JQcU4yK0hPWWNiOTNx?=
 =?utf-8?B?ZW1kWHN1ZDloUHpTbG5od3YzMXVRRUpVY1V5UDYrMkNGSWZVVE5ySHFtbHNk?=
 =?utf-8?B?OTdaUGRuRWV1N3JJNTVIWHpDNFR6c3JoQUw1a3IyRHVhQ09SR3hrSzZCMDJS?=
 =?utf-8?B?ZlpGdi92N1NlYk5zUVJhT3lRS0l5R1lRNVlpWC9Qcm01TjJ5NkZOQVlMcXVZ?=
 =?utf-8?B?Z1NldVlCeDUzSHdYSmFvd1NxU3ZaSVVJUnd5bEVsdkJ1cUN3QVJZN3J6NEZF?=
 =?utf-8?B?REluRlhPOXRyS1VOYUJuZWxDT2c3L0hKT05aSVY4ZzkyTEI1TlY1dzlkM3c4?=
 =?utf-8?B?cUZFM3hVUnIwQzAwbTNoVmhFbVc5UnBQeERFaUU2UHhxbkFSOWY4S1BJaDdl?=
 =?utf-8?B?SXdNTnV4YmlkTGhuQlI4ZzZteWtoQzFBUkpWRnJXTEduTEZEdndKZmZFelRz?=
 =?utf-8?B?ODJ5UUhHY1FpZk9ZSC9sQm1EOS9DTkRmWWl4N2Z2Wjh0UzFZMUdna3g4WFNX?=
 =?utf-8?B?ZlRGMGh3aHY2c0V2S2oxQ3pUQTFyYWEyNXpKWkJuMmdxNm42cnpEaTd5TXE5?=
 =?utf-8?B?WVNuVUw1VnFPRVJ6Z2szZTJwanR2RDErN0gwL3hHZTVuV242OFpzcFZ3eVFy?=
 =?utf-8?B?NEc0NzVBNG5tMk9NeTRub3hueDFhNjNNY0JLK2dxOEVDM3l5VThYV1k3ZXJK?=
 =?utf-8?B?ZXBxYk1VRlRSenVJMmZYQTJWNUhRc0d6dWRPZ0diL3gwUHoyTEVWcmJmaWYr?=
 =?utf-8?B?TG1ubUZIRWtjQTA0bUVDTkwzNk5TU2l0WDBVamxtek9iQVBFU0VnMTBST3Vl?=
 =?utf-8?B?UTg0TDcxNVo4OW1pWDFJb1ZLbFpWcGU4Vys1NDFleHgvY3BsYU1lbHhibUVw?=
 =?utf-8?B?YnJzRWo1aGR2TFFjb0VhWkhYMjdTdUtKbkNqakVlNkRjbzhORzQ4REZOTVJa?=
 =?utf-8?B?QnVETjRlK1piL2tFOXdqVDZseFhrQWFpWkdwTUtyRW9mR1ZiMlFhZ3VnM080?=
 =?utf-8?Q?DgUgq2DuK5o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b25aK3R0c2tIRmdwUnZLWFpsVXRkajFJaHkxcUF4RW50VmJoczVKcGdWd3Bo?=
 =?utf-8?B?Q2I5b2hEcEwrQzcxNEZsZ2V3WjF5R24yVGlhZDR6QWNvV1greEh2eHY4REdW?=
 =?utf-8?B?Mlk1NkluSzhaVHZQRjIybERFd3dmY3JHbm9Ua0dtWFRKa3VwbW5EZGlNdEVk?=
 =?utf-8?B?cTQwUzAwaisvMVF5d01saW5ES3pjYUpROFd5RktxdWFRNEsrTDdnZDY4aWUr?=
 =?utf-8?B?UXFSUUtTMnpXWmRCSmxOdDZkT2pjSFpsZG1xekRrMzF0OHYvc0h2a29VUHB4?=
 =?utf-8?B?cUw0dWNVUkRDRE5pSUtrZWNVMnQraWJlVTMwQVJMeHNwL0tzdlVlV3g0dFJI?=
 =?utf-8?B?Kys2cStwQkdtdktpeFdRQjliNjl4ODJseTAxVkJDUDJHNWtqMDJwdG45ajcz?=
 =?utf-8?B?NFVaN1VEc0N2R3FBRjBZOGFtVGJoVSsrb3hBMmM2THNhTEovTk05N2c0WWRB?=
 =?utf-8?B?VFhHbEdzcVlSSzVhZ2IxaEVFcUM2Y2xSRlZQRjhHYjBhVGdETFp5YjRKb240?=
 =?utf-8?B?QnVid3JncHR1ZlFNbXVaWGNDOXY2QklxbWNVdU1nS1NUSFJGb3BrbmNsM2U3?=
 =?utf-8?B?K3pyd211L0ZvelRReHBWRVA2ZVlQakhQMDlqQnNsc3pKSCs2amt6OS90c2Ru?=
 =?utf-8?B?SHQ0N05jUUZKeUVrUTVHUGt5Q1g3ZGdKeGZkZ2FDWjFabmlMdzNDVm1kZEk2?=
 =?utf-8?B?UmtqeWtOS3pOQWJZU1VYWW92aklUb09wejBIUHQ4NXVsQzNHOHZEVlhuTE0w?=
 =?utf-8?B?R21venA0WFl4bDZIR0RiVnQrcWZkeUNIWURhYm5rbDJISzFvU0ZpSWV6bWhq?=
 =?utf-8?B?OGZyRXpQNmhtZlUvMms3bnJYMTY3bXhhczZHaHp3UmNQRm8zU0Q5VTJLT3pp?=
 =?utf-8?B?VkhUdUQ4WC8rZTVXNkYzL09KeU5lZVNtSTdhOCs0R21GVUJ2MWxMSUx2S09i?=
 =?utf-8?B?VityeWV6RmRGNkdZWWc0QjlGRjNla1lYUHZBVWVVeFdmb1NlTE1IaDRSalVl?=
 =?utf-8?B?R1pFbDZwSTNoTTVTQ2VjbjFRamQ2NFFIT0taV1E2VytHb3g5L0lzUnZjRUJS?=
 =?utf-8?B?bEM4bVU2R0N6N2pBdmNLQmxZa2VUbmtZeUxwMkxkWndkcGpRTUFScHpWUVVV?=
 =?utf-8?B?RkJxYU1kdXUzbmlGblliN0xYVkRmYWh1cFFCbDhpRWtQTG5Kc1R4b3U3clEw?=
 =?utf-8?B?Rm4wMTlXSk1sYzZXTnZaNUg4Rm40M1NBcndBZ0N0ZU9BaTRvNkJYSWdvbVNS?=
 =?utf-8?B?TE1uQWtZUlo4UnVKNGE5c0lnc05QOFI1M0lxQWo1K3Z5WkxWNzlZc2ZiM0dZ?=
 =?utf-8?B?STlsQlRHNEZIM3JxZGJIclc2MmxxMWU2UUp3UlhaaE5UTGFQbE9WZzJiZkk0?=
 =?utf-8?B?RkV2UUFidVZSblpySWdxRXRiZ2RNWmxkSnJkZTJSMEc4dnRsa3FjNUU2dXFl?=
 =?utf-8?B?cnhOcHFKaE54RmxJdWZHN2JpV0dTdlh4aXhDeGVSV0Y0aUk3U0dJbVl2MFdw?=
 =?utf-8?B?V05aRFNBTlNUdy93a0IvMmxKU1BsTG10RUVRMlBuOWdpYXJkOXZaWUZPeWtT?=
 =?utf-8?B?cExhS0xZOXNXY2NmZHpqVWt3NGQyU09COEdLeUQrYkpHcXJRUTJHa2xBYVM5?=
 =?utf-8?B?Qm50YTIyMzlTT2FubVd1bWJNelFJWmo1L1NJZ1F6RUFsUmNQdG9DT0p2L210?=
 =?utf-8?B?QkpvUStaRjJUbWEvdkxpTTBNb3J1WFhyUXdzWWdQTDhDdTZtbCtycDh4Vk0v?=
 =?utf-8?B?dnJmMC9NeGdiUWZPOU16aGY5NTBxbFBGWDRTbWw4STIyQ2VSdGFkQ01MUVdr?=
 =?utf-8?B?UTR4bVZocUZtaUJLVTczK0h1bUNKWGpISnpWclp5ZHExVDFSaXFPNWRja1ph?=
 =?utf-8?B?L2Jsb2kxQ0d4OHJxU0NGSmlHM3Y2RzNaWmNSbEdBKzg4SW90endrMG13VmtM?=
 =?utf-8?B?L01ZMFQxeTdTMStnME05MlN6b1E1U0Nrdm9oSk94bW5mcUhVMUZ5Vlhvcytn?=
 =?utf-8?B?WUhWczMrUklxRGUzMVNZakEraDdtWmV1cFB0Y1J1VnVqTkhhcXFvaGNLeG5L?=
 =?utf-8?B?RWRGY3hQamQwQk82UzZNOTR0UWtSUFBjY3BjWkpLUnBEbXlEQWhyZHVmRVBI?=
 =?utf-8?Q?SVcgtKJT9HbJg8UUxilqVweRg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6ecfac-e01c-47c3-db15-08dde47ca2f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:43:31.9169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A79g+i4xcs6jiLaBteJu8vcYaKUa5xZTi1BMh8NeoHpWJXJT2PA/dJ/hSfPoNNFT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8815
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

Acked-by: Christian König <christian.koenig@amd.com>

Good to have that fixed.

Thanks,
Christian.

On 26.08.25 02:37, Zhang, Jesse(Jie) wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> This patch is good for me,
> Reviewed-by: "Jesse.zhang@amd.com"
> 
> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: Tuesday, August 26, 2025 2:11 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Pelloux-Prayer, Pierre-Eric <Pierre-eric.Pelloux-prayer@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> Subject: [PATCH] amdgpu/tests: make amdgpu_sync_dependency_test work on gfx12
> 
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> drop CLEAR_STATE and fix malformed preamble
> 
> On GC 12.0.0 (RX 9070/ gfx12) the amdgpu_sync_dependency_test reliably timed out and was canceled (amdgpu_cs_query_fence_status() -> -ECANCELED).
> Root cause was a bad PM4 preamble:
> 
>   1) We emitted PKT3_CLEAR_STATE (0-dword packet) and then incorrectly
>      wrote an extra dword 0x80000000. That stray word is a TYPE2 packet
>      and wedges the parser on gfx12.
> 
>   2) Even when well-formed, CLEAR_STATE is a graphics packet and is not
>      accepted in the paths we use on gfx12. The ucode/queue is stricter
>      and the job stalls.
> 
> This change removes CLEAR_STATE from the GFX12 and fixes the malformed emission. We keep CONTEXT_CONTROL (harmless across gens).
> 
> The test logic is unchanged: IB#1 launches a tiny kernel that spins and stores 42 to data_addr; IB#2 depends on IB#1’s fence and then WRITE_DATA
> (WR_CONFIRM) writes 99 to the same location. Seeing 99 proves the kernel completed and the dependency was honored.
> 
> With these fixes the test completes on gfx9/gfx10/gfx11 as before and now passes on gfx12 without GPU reset.
> 
> Fixes: spurious -ECANCELED due to hangcheck after malformed/illegal PM4 preamble on gfx12
> 
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_family.h       |  1 +
>  lib/amdgpu/amd_ip_blocks.c    | 74 +++++++++++++++++++++++------
>  lib/amdgpu/amd_ip_blocks_ex.c | 41 +++++++++++++++-
>  lib/amdgpu/amd_shaders.c      | 88 +++++++++++++++++++++++++++--------
>  4 files changed, 169 insertions(+), 35 deletions(-)
> 
> diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h index 60190c639..4514fff2a 100644
> --- a/lib/amdgpu/amd_family.h
> +++ b/lib/amdgpu/amd_family.h
> @@ -128,6 +128,7 @@ enum chip_class {
>         GFX10,
>         GFX10_3,
>         GFX11,
> +       GFX12,
>         NUM_GFX_VERSIONS
>  };
> 
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c index d8d7efbef..6955ba7dc 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -1031,13 +1031,21 @@ amdgpu_device_ip_block_add(struct amdgpu_ip_block_version *ip_block_version)
> 
>         amdgpu_ips.ip_blocks[amdgpu_ips.num_ip_blocks++] = ip_block_version;
> 
> +       return 0;
> +}
> +
> +static int
> +amdgpu_device_ip_block_ex_setup(struct amdgpu_ip_block_version
> +*ip_block_version) {
> +       if (amdgpu_ips.num_ip_blocks >= AMD_IP_MAX)
> +               return -1;
> +
>         if (ip_block_version->funcs &&
>                 (!ip_block_version->funcs->gfx_program_compute ||
>                  !ip_block_version->funcs->gfx_dispatch_direct ||
>                  !ip_block_version->funcs->gfx_write_confirm )) {
>                 amd_ip_blocks_ex_init(ip_block_version->funcs);
>         }
> -
>         return 0;
>  }
> 
> @@ -1221,9 +1229,11 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>                 {"GFX10",                               GFX10},
>                 {"GFX10_3",                             GFX10_3},
>                 {"GFX11",                               GFX11},
> +               {"GFX12",                               GFX12},
>                 {},
>         };
>         struct chip_info *info = &g_chip;
> +       int i;
> 
>         g_pChip = &g_chip;
> 
> @@ -1318,7 +1328,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>         igt_info("amdgpu: %s (family_id, chip_external_rev): (%u, %u)\n",
>                                 info->name, amdinfo->family_id, amdinfo->chip_external_rev);
> 
> -       if (info->family >= CHIP_GFX1100) {
> +       if (info->family >= CHIP_GFX1200) {
> +               info->chip_class = GFX12;
> +       } else if (info->family >= CHIP_GFX1100) {
>                 info->chip_class = GFX11;
>         } else if (info->family >= CHIP_SIENNA_CICHLID) {
>                 info->chip_class = GFX10_3;
> @@ -1348,30 +1360,62 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>         case GFX10:/* tested */
>         case GFX10_3: /* tested */
>         case GFX11: /* tested */
> +       case GFX12: /* tested */
> +               /* extra precaution if re-factor again */
> +               igt_assert_eq(gfx_v8_x_ip_block.major, 8);
> +               igt_assert_eq(compute_v8_x_ip_block.major, 8);
> +               igt_assert_eq(sdma_v3_x_ip_block.major, 3);
> +
> +               /* Add three default IP blocks: GFX, Compute, and SDMA.
> +                *
> +                * These represent the base hardware engines available on the ASIC.
> +                * - gfx_v8_x_ip_block: graphics + compute pipeline control
> +                * - compute_v8_x_ip_block: dedicated compute support (user queues, shaders)
> +                * - sdma_v3_x_ip_block: asynchronous DMA engine for buffer transfers
> +                */
>                 amdgpu_device_ip_block_add(&gfx_v8_x_ip_block);
>                 amdgpu_device_ip_block_add(&compute_v8_x_ip_block);
>                 amdgpu_device_ip_block_add(&sdma_v3_x_ip_block);
> -               /*
> -                * The handling of a particular family _id is done into
> -                * each function and as a result the field family_id would be overwritten
> -                * during initialization which matches to actual family_id.
> -                * The initial design assumed that for different GPU families, we may
> -                * have different implementations, but it is not necessary.
> -                * TO DO: move family id as a parameter into IP functions and
> -                * remove it as a field
> +
> +               /* Assign the actual hardware identifiers to all registered IP blocks.
> +                *
> +                * These fields are taken from amdinfo (queried from the kernel):
> +                * - family_id: ASIC family (gfx9/gfx10/gfx11/gfx12, etc.)
> +                * - chip_external_rev: revision exposed to firmware
> +                * - chip_rev: internal revision used by HW-specific hooks
>                  */
> -               for (int i = 0; i <  amdgpu_ips.num_ip_blocks; i++) {
> +               for (i = 0; i < amdgpu_ips.num_ip_blocks; i++) {
>                         amdgpu_ips.ip_blocks[i]->funcs->family_id = amdinfo->family_id;
>                         amdgpu_ips.ip_blocks[i]->funcs->chip_external_rev = amdinfo->chip_external_rev;
>                         amdgpu_ips.ip_blocks[i]->funcs->chip_rev = amdinfo->chip_rev;
>                 }
> -               /* extra precaution if re-factor again */
> -               igt_assert_eq(gfx_v8_x_ip_block.major, 8);
> -               igt_assert_eq(compute_v8_x_ip_block.major, 8);
> -               igt_assert_eq(sdma_v3_x_ip_block.major, 3);
> 
> +               /* Configure ASIC-specific function hooks.
> +                *
> +                * Depending on family_id, each IP block installs the correct
> +                * callback implementations for:
> +                * - PM4 packet encoding (e.g., gfx10/gfx11/gfx12 differences)
> +                * - Register offsets (PGM_LO/PGM_RSRC, etc.)
> +                * - Compute and dispatch programming
> +                *
> +                * This ensures that test code emits commands in the correct
> +                * hardware-specific format for the active GPU.
> +                */
> +               for (i = 0; i < amdgpu_ips.num_ip_blocks; i++)
> +                       amdgpu_device_ip_block_ex_setup(amdgpu_ips.ip_blocks[i]);
> +
> +               /* Sanity-check the initialized IP blocks to ensure the family_id matches
> +                * the ASIC info from the kernel. If these assertions fail, it usually
> +                * means that:
> +                * - IP block registration order changed, or
> +                * - amdinfo data mismatches the active hooks, or
> +                * - future refactoring broke expected initialization paths.
> +                */
>                 igt_assert_eq(gfx_v8_x_ip_block.funcs->family_id, amdinfo->family_id);
>                 igt_assert_eq(sdma_v3_x_ip_block.funcs->family_id, amdinfo->family_id);
> +
> +
> +
>                 break;
>         default:
>                 igt_info("amdgpu: GFX11 or old.\n");
> diff --git a/lib/amdgpu/amd_ip_blocks_ex.c b/lib/amdgpu/amd_ip_blocks_ex.c index 21c4d952c..aab9a2a4a 100644
> --- a/lib/amdgpu/amd_ip_blocks_ex.c
> +++ b/lib/amdgpu/amd_ip_blocks_ex.c
> @@ -139,6 +139,44 @@ static void gfx_program_compute_gfx11(
>         base->emit(base, tz);
>  }
> 
> +static void gfx_program_compute_gfx12(
> +       const struct amdgpu_ip_funcs *f,
> +       struct amdgpu_cmd_base *base,
> +       uint64_t code, uint64_t udata0,
> +       uint32_t rsrc1, uint32_t rsrc2,
> +       uint32_t tx, uint32_t ty, uint32_t tz) {
> +       base->emit(base, PACKET3(PKT3_CONTEXT_CONTROL, 1));
> +       base->emit(base, 0x80000000);
> +       base->emit(base, 0x80000000);
> +
> +       base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
> +       base->emit(base, f->get_reg_offset(COMPUTE_PGM_LO));
> +       base->emit(base, (uint32_t)(code >> 8));
> +       base->emit(base, (uint32_t)(code >> 40));
> +
> +       base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
> +       base->emit(base, f->get_reg_offset(COMPUTE_PGM_RSRC1));
> +       base->emit(base, rsrc1);
> +       base->emit(base, rsrc2);
> +
> +       base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
> +       base->emit(base, f->get_reg_offset(COMPUTE_USER_DATA_0));
> +       base->emit(base, (uint32_t)udata0);
> +       base->emit(base, (uint32_t)(udata0 >> 32));
> +
> +       base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
> +       base->emit(base, f->get_reg_offset(COMPUTE_RESOURCE_LIMITS));
> +       base->emit(base, 0);
> +
> +       base->emit(base, PACKET3(PKT3_SET_SH_REG, 3));
> +       base->emit(base, f->get_reg_offset(COMPUTE_NUM_THREAD_X));
> +       base->emit(base, tx);
> +       base->emit(base, ty);
> +       base->emit(base, tz);
> +}
> +
> +
>  static void gfx_dispatch_direct_gfx11(
>         const struct amdgpu_ip_funcs *f,
>         struct amdgpu_cmd_base *base,
> @@ -172,7 +210,8 @@ void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
>                 funcs->gfx_dispatch_direct = gfx_dispatch_direct_gfx11;
>                 break;
>         case AMDGPU_FAMILY_GC_12_0_0:
> -               /*TODO*/
> +               funcs->gfx_program_compute =gfx_program_compute_gfx12;
> +               funcs->gfx_dispatch_direct = gfx_dispatch_direct_gfx11;
>                 break;
>         default:
>                 break;
> diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c index e4931961c..adc4fc051 100644
> --- a/lib/amdgpu/amd_shaders.c
> +++ b/lib/amdgpu/amd_shaders.c
> @@ -30,27 +30,77 @@
>  #define DATA_OFFSET 1024
> 
>  #define SWAP_32(num) (((num & 0xff000000) >> 24) | \
> -                     ((num & 0x0000ff00) << 8) | \
> -                     ((num & 0x00ff0000) >> 8) | \
> -                     ((num & 0x000000ff) << 24))
> -/**
> +                               ((num & 0x0000ff00) << 8) | \
> +                               ((num & 0x00ff0000) >> 8) | \
> +                               ((num & 0x000000ff) << 24))
> +/*
> + * C equivalent of the shader_bin below. This tiny compute kernel
> +performs a
> + * busy-wait loop, then writes the constant value 42 into a GPU virtual
> + * address passed via COMPUTE_USER_DATA_0..1. This shader is
> +intentionally
> + * simple and designed to work across all GFX generations.
>   *
> - *s_mov_b32 s2, 0
> - * s_cmp_gt_u32 s2, 0x98967f
> - * ;;
> - * s_cbranch_scc1 4
> - * s_add_i32 s2, s2, 1
> - * s_cmp_gt_u32 s2, 0x98967f
> - * ;;
> - * s_cbranch_scc0 65532
> - * s_mov_b32 s3, 0xf000
> - * ;;
> - * s_mov_b32 s2, -1
> - * v_mov_b32_e32 v0, 42
> - * buffer_store_dword v0, off, s[0:3], 0
> - * ;;
> - * s_endpgm
> + * Host-side logic equivalent in C:
> + *
> + *     static void gpu_shader_standalone(volatile u32 *dst, u64 iters)
> + *     {
> + *             Busy loop comparable to the ISA spin, prevents compiler optimization.
> + *             for (u64 i = 0; i <= iters; i++)
> + *                     asm volatile("" ::: "memory");
> + *
> + *             After spin completes, write sentinel value 42.
> + *             *dst = 42;
> + *     }
> + *
> + * The binary shader blob generated below executes equivalent logic on the GPU.
>   */
> +
> +/*
> + * Shader ISA: spin_store_flat.s
> + *
> + * This kernel expects a 64-bit flat/global address provided in s[0:1]
> + * (passed via COMPUTE_USER_DATA_0..1) and behaves as follows:
> + *
> + *     1) Initialize a counter register (s2 = 0).
> + *     2) Increment s2 until it exceeds 0x0098967f (~10 million).
> + *     3) When the loop completes, store the literal 42 at *(u32 *)(s1:s0).
> + *     4) Terminate with s_endpgm.
> + *
> + * Notes:
> + *     - Uses flat/global addressing — no buffer SRD required.
> + *     - Works with 1x1x1 dispatches; single work-item.
> + *     - Safe for all GFX generations; no HW-specific instructions.
> + *
> + * Annotated assembly:
> + *
> + *     .text
> + *     .p2align 8
> + *     .globl spin_store_flat
> + *     .type   spin_store_flat,@function
> + *
> + * spin_store_flat:
> + *     s_mov_b32 s2, 0                         Initialize loop counter.
> + *
> + *     s_cmp_gt_u32 s2, 0x0098967f             Early exit if counter exceeds limit.
> + *     s_cbranch_scc1 .Lexit
> + *
> + * .Lloop:
> + *     s_add_i32 s2, s2, 1                     Increment counter.
> + *     s_cmp_gt_u32 s2, 0x0098967f             Continue looping if below threshold.
> + *     s_cbranch_scc0 .Lloop
> + *
> + *     v_mov_b32_e32 v0, 42                    Load value 42 into v0.
> + *     v_mov_b32_e32 v1, s0                    Load address low bits into v1.
> + *     v_mov_b32_e32 v2, s1                    Load address high bits into v2.
> + *
> + *     flat_store_dword v[1:2], v0             Store 42 to *(u32 *)(s1:s0).
> + *
> + * .Lexit:
> + *     s_endpgm                                End program.
> + *
> + *     .size spin_store_flat, .-spin_store_flat
> + */
> +
> +
>  static  const
>  uint32_t shader_bin[] = {
>         SWAP_32(0x800082be), SWAP_32(0x02ff08bf), SWAP_32(0x7f969800), SWAP_32(0x040085bf),
> --
> 2.34.1
> 

