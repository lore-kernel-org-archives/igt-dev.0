Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45064C25B78
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 22:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B700110E21C;
	Mon, 13 May 2024 22:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bKCslpzp";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AC510E21C
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 22:41:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4Sj5Tlv6B2SJPRZFWpJ1MvJ3ogg8GZnS/Zn9FQ2pg2eaxMa85etcKz1UFxsY58EnB7O2w/HHFtH6gajksWV/3RNHupgTQzGHrffFNfYVv6+/LFDyon8wTDPGGYRF+U2j1I6AppJFO8V2SBPW6hhmGLQGWJAIvb40L5omzntk8gIBNEOByf86/nBDTMc3rJ0ruf3Ik4SOZwc+GMZu4Rkc15oJDdXsbn2r8KfAEBlV2V3X8oc5GoXxkrQQAhQEBehowRu0seymegbINYNQBCCkjLDSwGi7OBwDAsOjkqQUwKwPK7sHa/MBS2IEfqdky+rFyZQSLayr8LnLSPbpbptmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=It4o8fTaecofoY9hgYk61S6uvUJdhUzAi2NYP9uL41Y=;
 b=Cz4JSZTDcgNwaOTFurLNqzKq8faYZwLS++SCexmL4ofL0BcxW3Jo3uQ54tAwfEusP+CJjkdayZg9gdZ1v9Qz4c8bqeus/YEHQ1zh1fY+Xda/W22yiTcdBCTQLLYM9+VR6M+i01lKrcwmkdXMkL6G33wuIUS14znRXDj+XzoVqy2EIueUMHCZj1cVEy2Aowp8JeUnGqlGu59Of7Ujqrdd1C0xUIaxlryqzPGoElsNlmtGLRsfjOvVZes61ijAYlUfCrB1sgafojgsRFJoxXZ/ooJIdQCAPJFtGYlMS6BQBj+JGPc5WuMXUu6VdojQmfPj2OrNPuL7zLOfz1rveyu/+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=It4o8fTaecofoY9hgYk61S6uvUJdhUzAi2NYP9uL41Y=;
 b=bKCslpzpksh9Epqs2bBBA47SeZS9/Q3Jnn0Ay8QsDYTl//3zCPSadrsnE2yf0TAFdT0o9tq0INO0UngAqMs5UN+Iq7fAwwNFW6d/ZYJ7ys6RyGIpPNxXtNN+7QGq5zYHZqID/dM8RmDgG+Rc7w824121bm/zx7m7iYgRQDvUKzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:314::18)
 by IA0PR12MB7529.namprd12.prod.outlook.com (2603:10b6:208:431::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 22:41:41 +0000
Received: from SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::71c5:ea8:a3c7:4c77]) by SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::71c5:ea8:a3c7:4c77%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 22:41:40 +0000
Message-ID: <4af4b1b7-3afa-499d-8efa-e55fa80b721f@amd.com>
Date: Mon, 13 May 2024 16:41:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_writeback: refresh to expose writeback output
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, igt-dev@lists.freedesktop.org, 
 harry.wentland@amd.com, hersenxs.wu@amd.com
References: <20240513213041.583437-1-alex.hung@amd.com>
 <3b525e79-8387-9cbf-7e96-8092ffc757a8@quicinc.com>
 <07e5ac71-1be0-4ad9-bab1-e403db1eb59d@amd.com>
 <d35e42e6-74c6-58cb-dc10-b4be37d2bbcd@quicinc.com>
 <31bef15f-b58f-4442-aca6-eb8ff5e924c1@amd.com>
 <5d2427cc-5ded-ea1f-abd4-f746576cee8d@quicinc.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <5d2427cc-5ded-ea1f-abd4-f746576cee8d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:303:b4::30) To SA3PR12MB8802.namprd12.prod.outlook.com
 (2603:10b6:806:314::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8802:EE_|IA0PR12MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: a1364bab-d228-43f2-1e56-08dc739ddaf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1JvR3o0NWdydmNZdDhNRGcvaHlFQVFtc2lUcnhBaUNsa1hqL0QrYmlEM3Bt?=
 =?utf-8?B?c2FzOUpXakNFTVJBN0dyd2VBVUNEVVJiRVV6QThWMWlSTzBGbVEvNUZPYkhL?=
 =?utf-8?B?R1FyYUNMbnlndVRaZks3dWpRRGExaEd3VC9ocjgxenk0MkJNQlFHa2pYS2M2?=
 =?utf-8?B?R3VYOXhEazIxcVUwbnRhWXAzTkhHV2w3Ym5CWVd5anpIUTc1RVZrQ0lUR2l3?=
 =?utf-8?B?eEpYT29XTEY1RVZ0SUhBaEFYdVFXRmdMM2ZLSnRSZ1dHelZIOHp2YkRWcnZn?=
 =?utf-8?B?OGlsa200aWJqaU1OMUJNU0svaFFRM1RCVVFkKzZwUm5lVDBrRjZmZDJuOExp?=
 =?utf-8?B?ZEpuTGhoRTZsMXRkOU9QWjQwM2NHcWxJUldqUmpBMHp1R3V0UE9oeERmUFls?=
 =?utf-8?B?Y3hsSlFFbEVUN3NOMHRmS0J5MGkyTlNTNWlsV2EvRG4raWRPSEpjOXlLT09I?=
 =?utf-8?B?dHdjNG9sQUlLOCswUjNjQW1hYkQrNW1mc3FWcHA0MllrNW1sUDExWTVZN24x?=
 =?utf-8?B?T2tKMzM3VHlpVGplTkYwVjE0SDBTenlOeWRuUTJBTDhSYTdNS1VtR0w1UGcr?=
 =?utf-8?B?bXRkSW1aaFpmdXE0NW90cVZaVFlWYmcxR2hlUzAwNUNLV3lXR2IzU0hZbGJW?=
 =?utf-8?B?bEo3Nit0RC9JaklJdE5zMlhCMW9SNGhHNy80cjRTM2hvWGo3d1RwVnZ2UHhP?=
 =?utf-8?B?K2lCWVZlNS9UVnMxK056ZFhzR3NCQkNXYlBhanY4TGlHcHhON2x1Qjh4Wkw4?=
 =?utf-8?B?MGxRcHVZeVg4MnpNSUp4RC9RbDkrcjlYb2tCQXpHK1VCaFJuVFhxTWZrUXNY?=
 =?utf-8?B?YUxlZHJzWElvNU80WWt6OUZiZFZEdUZjSU0wZWZHZ2lMSnNhVWljUW9iWmRo?=
 =?utf-8?B?SDE5azhGeUxzMkFVZWtqdTlpZjdaN1JXTTNsZVJhZkk4YXZxMmhmekdndDdF?=
 =?utf-8?B?Z0JuYlRPU1QwcXdxdm1tb3NUTkpsWGtWU3I3OWtTaUNVWXo5MWVEYkF1Y3Zt?=
 =?utf-8?B?MkZMN0R6ZWNGeWRVaHJFWTBXMmtqb1lKOFdoaS9LVDh2RDEzTCttTHoxUHdi?=
 =?utf-8?B?UU0ybjZmRTM5dFIrUkRzRW93ZUtQc0VaMUlSclJwb014SW9Bb3RBbGJxRkcx?=
 =?utf-8?B?cTZ5MG4rTDhwYlc0SXd0cmdVMGVLTEJTaDFjZGkydTE3R2RvWWtEWFpZUlpi?=
 =?utf-8?B?UndxdnpUM0JWOVM3c0owckZNYkwzMUkrTmE0RHVVaDQwdG1qcFhJeitzNjBm?=
 =?utf-8?B?NVdoQ3RIcWh6Rll0Skx5Vk9pMndUaTFUMXFHb2FHWFBUVThSNExjdzVjeHg1?=
 =?utf-8?B?cmdHdjh3aVhML1V3bFRValFVa2xiVEYxdzFwQlRXYVp2UER4TkFIRmpnWm5Q?=
 =?utf-8?B?bmZ1VWJuaDFGVWhQQmU1ZGtXakdua2FpQ0ovc3k0UFFmOS9NbDRrU1dTRWhn?=
 =?utf-8?B?cVJXT3ZySHFYUUNXNkZvemk2ell2d1BsUUc2c2czYXE3VHI4cG1DS2hXa1ZI?=
 =?utf-8?B?RUxxLzd5c2JQUi9wVTdub3plQ01hTnkwZzFxNEFFbW16dWJnZURvcno2N2Fi?=
 =?utf-8?B?U29iYnd5ZjV3aEhzVm5QVFNmMFE3RzUyenA3WXlFMDA1SG4rQS9BK2hMc3BK?=
 =?utf-8?B?bFFpeTVZSWJOby8vVDZHaXBhb0RlSE9OQ2kyQm9Yd0hRZ0lNVDgweGdjYWgy?=
 =?utf-8?B?UU9NeGQ0STZiN0U5eklwTExZbTlobXN5UkQvbG1YdzJ6ZlpWSy9CcEx3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR12MB8802.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yi81V1UvNnU3Yi9xSjllbEdKWDhjMEtFUStkUlJ2R3laajAwT3BtQTRFSFRz?=
 =?utf-8?B?ZFZ3bEExWkRoc0xoVWxSbkFja1REOVJuMzljUW85TmVnVDdYS3RNUDIrZ3N2?=
 =?utf-8?B?WUl3RzE4d21jK2VGZW5GdWUxa1N3WTdCc2RKTnJmbXlOMnRSZ0U5Q2VuaVdW?=
 =?utf-8?B?Q1pCWDBuVjBjcVo3MjJ4STdqYXJEZzlPRllqVUt2NnYzRXBhRDUxWndJMjBQ?=
 =?utf-8?B?d1U0SFJpTjVweTR6NUpEeTdxeTRncEpsU3NlVzJCNHhsemlaSlR5UXd0TVdo?=
 =?utf-8?B?OUFhbnYzY1dLOWZBc3JZQnZxQVpBL0NTTWowdWhKTzJqTThRb3BnWDIzV0xX?=
 =?utf-8?B?TVJOb1dyL1ZKN3plZDdpdFI1dklhNzRKWHI2UjhqdnlBVlIzTUtLQnJQb0pT?=
 =?utf-8?B?RjVEWkJGMlZGTzJ5KzkvRWh5NUYvV1gvQlptTFdEbmV1cTVGQUZpK28rVGh2?=
 =?utf-8?B?SE9Cb0RIUW5GVWQrRksyUk1NbEVhOGViOVNpbnFJWGo1QmRDajQyeXNMU1Q2?=
 =?utf-8?B?OFY1RkQ2a24xV3pVUXUvcEFiOFowcFBMbC9DaEZOTHVnMTBjT1dTaG1HM1F2?=
 =?utf-8?B?UkxvbURxVG0zZmpTZ1RnblByRlVPVk5ob2hjTkZmbFBOb25xN1Y3SGM4amhp?=
 =?utf-8?B?SW5MWld3MEg0dXF6L3d5ek92VC9Tc1JLekw0VmwxY0pyekczSlBMYWx4OEpY?=
 =?utf-8?B?bmt3REFLbTBiRnQ4U0Y5dzMrL1EzaEh2akhBN2dycUkzM09xSDhoaGNqWmNY?=
 =?utf-8?B?TnpGeFNwL3ozZWlUZ0NGMWtGMGVRUzN5dnN4clhTbmordGZ6ejJvMmdPUnZH?=
 =?utf-8?B?V1pnMlR6TXJQb3R5R0xjckFqQXNhcWluenlBQ2Rpa0RXZUUxMExId01OUEpu?=
 =?utf-8?B?c2g5VkhrY0dteW9aZ3BTZDdoZmJ4Qnl1UitLdUQ1UHcxVHcyMUQzcS9qZmtM?=
 =?utf-8?B?Qk1vTERhZ292SGhGTWRaTXY0R09kS0RwcWJKNVFCOTA4Q1lGcklnTEdRbFho?=
 =?utf-8?B?SnZ0MEFhMGprZlpOTVVhUXcxOFdkNDMvQldWa3lUa29LNnUwMUs1WGZEcXJY?=
 =?utf-8?B?bVAzVVdzS1IwdXd1UTM2UnVmNnYrdFd1ejRtOWhTZVgweUJZZzBGVW5lMmN5?=
 =?utf-8?B?a3FVM25sWmhubXJxZno1ZmVPejRETDNSN2Zyazl3SEZzaHpGTnZmSEtiZEtZ?=
 =?utf-8?B?NXV4b20za3F2bWtsSUd0b2pWQ0xVN0ttSWllUWp6MklwaXBQWC8zQTZxNVVm?=
 =?utf-8?B?ekw2NnA2SklMTTNMbC9QSGp3Y0pFWHdiL3JLeG05VlQ3VHZRdjhTZ0QrUGxJ?=
 =?utf-8?B?bVlTMWd2WXJtb0JpQ2dTTktIclFYbmwwUlNKN3BDMmlkVHBleGFuN3cyT2FG?=
 =?utf-8?B?MllzMisrNEhudG1jTUZ0S2JXa1c1NWdTaWR6UFgzYlI2bXVXSEUvUjdYK1lN?=
 =?utf-8?B?c2tTMmJyZjlIYmtyVEtpWDZaVlJqdWprdktJMlpiN25wUVY1WlpDeXFST2J1?=
 =?utf-8?B?SXNBTURLQlh6RXNRdlVxUWthanBFU3piSGNWMGs3Z2dIaUpxVTZQdmRxb0Jw?=
 =?utf-8?B?dHF6YUVNbDBjb09xUHEyeTBPMTZ5cnlOT0pxTFBmc2pzMDd3OUYwL2orczE0?=
 =?utf-8?B?VDFXaTlEZHRBTTkvZ090cllLWFpMVldCbDBzcmNmdTE1cThkSXdjb0RMSG45?=
 =?utf-8?B?V0l0dWludDF6MU9ncXRPMDdGMUZXdlQ0aWF1Z1lCNCs2OTJNV0lQY1BhMm5M?=
 =?utf-8?B?WUo2V2lTRHVsVkFVcDVjbFNHM0JqTWJNUE0xN29ObGI4RzEzWFlySStId1pW?=
 =?utf-8?B?N29xSWovRU9sWHNDRFpjcU40SC9GYUJ0OXRlakkzSUJRRldkVFhGNEttalhO?=
 =?utf-8?B?TWw5ZnN6Tkl1cmtEUVhZWnBmRHcwN1dRS1BHKys4V3k3T01YdGtsc05JVWFN?=
 =?utf-8?B?MVFiV29pMUFFZVRXaThuZEMrZFJLTGZxaE1SOGRyMFpHdUdMaUFPZ1oxRmdt?=
 =?utf-8?B?ODdORmlhSGV2MytFQ1FBKzVkNWkwZ3FSTmthRGRWdnJLSlpMS3VsNFdRSkpZ?=
 =?utf-8?B?bGRZQlVUdzRQTHFqRzVodUxVTXUrazhDQTd2VW1hcFAvTlE0V0ROd0dCenpa?=
 =?utf-8?Q?anYH2JesDlScNwpoZyuEKwG+I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1364bab-d228-43f2-1e56-08dc739ddaf9
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 22:41:40.1697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jocg75T2mh4gbKwHBzWVY4qGoZP1lnaUbdI5a+pptp8PAPseGFoPK9xpciWpVxim04XaHTU8WnwbCyiQfIGJCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7529
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



On 2024-05-13 16:37, Abhinav Kumar wrote:
> 
> 
> On 5/13/2024 3:32 PM, Alex Hung wrote:
>>
>>
>> On 2024-05-13 16:20, Abhinav Kumar wrote:
>>>
>>>
>>> On 5/13/2024 3:06 PM, Alex Hung wrote:
>>>>
>>>>
>>>> On 2024-05-13 15:48, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 5/13/2024 2:30 PM, Alex Hung wrote:
>>>>>> With dc2d7fb4f978, all kms_writeback subtests are skipped.
>>>>>>
>>>>>> Refresh the outputs to grab all supported connectors,
>>>>>> the writeback output that is just enabled.
>>>>>>
>>>>>
>>>>> Can you please help to explain how the tests are getting skipped 
>>>>> due to setting the client_cap?
>>>>>
>>>>> And also why calling igt_display_reset_outputs() is fixing this issue?
>>>>
>>>> Without the igt_display_reset_outputs(), the result is
>>>>
>>>> IGT-Version: 1.28-gbe9b99928 (x86_64) (Linux: 6.7.0-rc5-99-custom 
>>>> x86_64)
>>>> Using IGT_SRANDOM=1715637543 for randomisation
>>>> Opened device: /dev/dri/card0
>>>> Test requirement not met in function __igt_unique____real_main553, 
>>>> file ../tests/kms_writeback.c:579:
>>>> Test requirement: output
>>>> Last errno: 95, Operation not supported
>>>> Subtest writeback-pixel-formats: SKIP (0.000s)
>>>> Subtest writeback-invalid-parameters: SKIP (0.000s)
>>>> Subtest writeback-fb-id: SKIP (0.000s)
>>>> Subtest writeback-fb-id-XRGB2101010: SKIP (0.000s)
>>>> Subtest writeback-check-output: SKIP (0.000s)
>>>> Subtest writeback-check-output-XRGB2101010: SKIP (0.000s)
>>>>
>>>>
>>>> It looks like the below "output = 
>>>> kms_writeback_get_output(&display)" will return null as it cannot 
>>>> find any connector type with DRM_MODE_CONNECTOR_WRITEBACK.
>>>>
>>>> The igt_display_reset_outputs() is able to re-initialize the output 
>>>> and therefore includes the writeback output.
>>>>
>>>
>>> Thanks for the details, I understand the issue now.
>>>
>>> But rather than calling igt_display_reset_outputs(), I think better 
>>> way will be to set the cap before calling igt_display_require()
>>>
>>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>>> index f89b2d62fcc9..6ecab46e440b 100644
>>> --- a/tests/kms_writeback.c
>>> +++ b/tests/kms_writeback.c
>>> @@ -567,14 +567,13 @@ igt_main_args("b:c:f:dl", long_options, 
>>> help_str, opt_handler, NULL)
>>>
>>>                  kmstest_set_vt_graphics_mode();
>>>
>>> +               ret = drmSetClientCap(display.drm_fd, 
>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>>> +               igt_require_f(!ret, "error setting 
>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>> +
>>>                  igt_display_require(&display, display.drm_fd);
>>>
>>> Let me know if that works for you.
>>>
>>
>> This works if DRM_CLIENT_CAP_ATOMIC is also set as below:
>>
>> Is this preferred?
>>
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -567,14 +567,18 @@ igt_main_args("b:c:f:dl", long_options, 
>> help_str, opt_handler, NULL)
>>
>>                  kmstest_set_vt_graphics_mode();
>>
>> -               igt_display_require(&display, display.drm_fd);
>> -
>> -               igt_require(display.is_atomic);
>> +               if (drmSetClientCap(display.drm_fd, 
>> DRM_CLIENT_CAP_ATOMIC, 1) == 0)
>> +                       display.is_atomic = 1;
>>
>>                  ret = drmSetClientCap(display.drm_fd, 
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>>
>>                  igt_require_f(!ret, "error setting 
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>
>> +               igt_display_require(&display, display.drm_fd);
>> +
>> +               igt_require(display.is_atomic);
>> +
>> +
>>
> 
> Yes, looks correct to me because drm driver expects both to be set.
> 
> 357     case DRM_CLIENT_CAP_WRITEBACK_CONNECTORS:
> 358         if (!file_priv->atomic)
> 359             return -EINVAL;
> 360         if (req->value > 1)
> 361             return -EINVAL;
> 362         file_priv->writeback_connectors = req->value;
> 363         break;

Thanks. Let me send a V2

>>
>>
>>
>>>>>
>>>>>> Fixes: dc2d7fb4f978 ("lib/igt_kms: move setting 
>>>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback")
>>>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>>>> ---
>>>>>>   tests/kms_writeback.c | 4 +++-
>>>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>>>>>> index f89b2d62f..4c54f3b89 100644
>>>>>> --- a/tests/kms_writeback.c
>>>>>> +++ b/tests/kms_writeback.c
>>>>>> @@ -572,9 +572,11 @@ igt_main_args("b:c:f:dl", long_options, 
>>>>>> help_str, opt_handler, NULL)
>>>>>>           igt_require(display.is_atomic);
>>>>>>           ret = drmSetClientCap(display.drm_fd, 
>>>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>>>>>> -
>>>>>
>>>>> Is this part needed for this patch?
>>>>
>>>> No, but I think they are related and thus grouping them together is 
>>>> easier to read.
>>>>
>>>>>
>>>>>>           igt_require_f(!ret, "error setting 
>>>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>>>>> +        /* Refresh the outputs to grab all supported connectors.*/
>>>>>> +        igt_display_reset_outputs(&display);
>>>>>> +
>>>>>>           output = kms_writeback_get_output(&display);
>>>>>>           igt_require(output);
