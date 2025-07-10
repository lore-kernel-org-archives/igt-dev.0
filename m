Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDAAC83F17
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 18:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2368D10E940;
	Thu, 10 Jul 2025 18:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CVv4bFHS";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F5E10E940
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 18:10:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhyXMrZKORojq1/sdWbvJTWyQuL4T8T1c3CkfmDkno2leAAVksskFE5AG3hhxCI23+xV780A9TfEsH7l0MEq15PS1g2GSBpKVmvrhQafnUb97TqNLLzJMH1a6BxlYjUq/Zj/i8OuQgR3RHvh8wLdIn/Rqbw1tUj2+aThL06mf08v+Zy7Fw7JWaZbvDj1JGArH+mWbpj6vhfCTxf9XAnfRvwcGXk+zBaybJC1CguASabxKN4UtSbKlXdPhY5TJMTD8aO7SL1ILvMWg0IjvY/IrRYy12CkdK2WxEbaYemJ0WFtBZst8xAY++cOlRLsKNlUcg5votSlUAXf8Ztspxrq7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlNhzKGArm8+M27GoTQ0riS+AsCMvdi+jdjJ0Yx+z7A=;
 b=EtzkLFlMyUYWpKuusjVsQm5MSmiqFKZKRx+Y7GhhzsNvN4A0ewYFoENycEChu5sAhPHogAqlulCjVRupPbPicbo8gfYBJB+kW0FRwGDJjODHSFmsiG9hhAKXj6lMV4kR4VAthxkG2OoHUB4Jxsdmn6KkCKDuPSpCBXJyDjk+rFGLkJ5CoWAQsCYRUaa1CVoElTQ9KLjUbrTw/D/+/v/s36Xs8+v21Qck9On0DtsRr8MOBRvI2y1r2NBvikkonZDfm1JVZptP6vM8efortIejiNFZVCZvl7HLkBBjFUGTznKjS2FY675s7V5bFhr8wAYmkaNltM/vQFPbIQ+WRwiR1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlNhzKGArm8+M27GoTQ0riS+AsCMvdi+jdjJ0Yx+z7A=;
 b=CVv4bFHS3uAFjX9ecVxz1V4m4lqEf7FhB2QGBoCd84sn4v1peEfCBRkRLsSWoFoJ5ExUXrO9uCgr7EzDFdJDqyv5Q0D9pKkodwFnKhRkl+TE90A3b9AEvjBeC3+hFY0Qnq7Md/Vzq1dEN2ShqeNmXX6jYjFW3+b3dlZLCDUj8s0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CH3PR12MB8657.namprd12.prod.outlook.com (2603:10b6:610:172::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 18:10:08 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 18:10:08 +0000
Content-Type: multipart/alternative;
 boundary="------------Zjh1f4k7Eiy7ru38BwLNrlq4"
Message-ID: <ef3c9b08-57ea-4305-993f-c901373d207b@amd.com>
Date: Thu, 10 Jul 2025 14:10:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5,resend i-g-t 3/6] tests: Add kms_debugfs
To: Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
 <20250708144039.53482-4-peter.senna@linux.intel.com>
 <20250710101339.mobt7uyicfm7webf@kamilkon-DESK.igk.intel.com>
 <71154125-b7e0-43a4-8732-607ff2ac82f5@intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <71154125-b7e0-43a4-8732-607ff2ac82f5@intel.com>
X-ClientProxiedBy: YT4PR01CA0470.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::17) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CH3PR12MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 6619f65b-a240-4153-db39-08ddbfdd011e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|921020|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFpneFNVaTBLVFlwUk1wODFYSzJIdTd5VzFwdG5oOGpydytnQ0YzSjZ5VWpj?=
 =?utf-8?B?Q3FXQ3kzNVV1SExhQmpXOGNOWHh1UWNzVFdzWFBJcjYxOElmOTRnVXV2cUth?=
 =?utf-8?B?ajd0S2Mzb2hhQXZFc25YRGpJOE5vcGpuQ0YrQVJ1R0VBTXFhZ3g4NmlSUWhn?=
 =?utf-8?B?YnNGWnd0UzZsQWRkRExydFk0QmFXYXdIanA3SjBLcUdVUjJFSk84SGV5MW9i?=
 =?utf-8?B?UE9xOENjNzdsVUJ6MjMxeFhFVTJ6VjcvMDk5YnNQMGZOanREK2NIL3ZoVHFD?=
 =?utf-8?B?MFVlVW10MXN5SkJJSGJ5VEM4WG9UZndNczRrSjNRMGl6aWtLVU4vODY0MmRN?=
 =?utf-8?B?a3l3SStzNkg5dUFISm91SDg2VmV1dmd4QTFjQXVLMTVNSkZoaXp5UmFnbDFl?=
 =?utf-8?B?UU9RNkxXajRUWllpeVI1alhkbjY4bi9mZDMweThTczk4VHR4dHZMTXpWZ0hS?=
 =?utf-8?B?THB0Y3o2bVBSTHVWWTZEd3FlMkRrL0VBTnRPKzlyNGhHUFk5bytsSlNvcVAx?=
 =?utf-8?B?WE95R1RpQmhGVTd1OFFRQmt3ODNOVFNnNVh3TFdJY0xnV2hweUdLSzlIYlV5?=
 =?utf-8?B?V1ZFQS8xMjNTRW1mMXRwbGdENlhNb2VqcjZydTMxK2p4V0xsMWtodTcyaUZN?=
 =?utf-8?B?V1hiNW1OeU9hQ3JnbGxFQlFvc0d1NTFaeEFQc0cvbXRMN2QyZ1NPNFQyUGR2?=
 =?utf-8?B?ZWtZS0E5clVnYlFzV1J3SFloMGNHNTdwNTE2WlZSc1EyblVBUnJlelovOEZu?=
 =?utf-8?B?MkNoS0pNRlBBbVY0TWZJaWlzR3ZqRTBxOCtrbGM2c0cwSFNtWVg1MkhTVjFh?=
 =?utf-8?B?NXJrZTdjcmpsRGErNlVwWnFObXdUb2tQbDhLNmVvNlNENkZZdDhsVURHa1Z0?=
 =?utf-8?B?VnRFV1NMWVVSeUtaUitNRFprZEJBMm9HeHFFK0VZM2hTcytzZ21jZUp2aVl4?=
 =?utf-8?B?SFVTWjJLQmx0VGZoSHRiNzJhNGt4d2MvT0l1UUlhYUxvVldkaE9KSmQreEhp?=
 =?utf-8?B?cUltNzFRMnNoTE8yR2Q1U3pWM3FRWDFDdExLS2o3dG9PNGMzRVdUWFRLTDVW?=
 =?utf-8?B?dGpkQkRFazlKa1FETnpPUGhsNGRjcTk1NDZJc1hHaVA3Q0dIbVNNNFlMMUFw?=
 =?utf-8?B?YnFJT2ZpYjlOUU9xK2YvcEs0d3ozMnk3d0ZUWDZHNTJVZDBPcVJtOVJnUGZr?=
 =?utf-8?B?WHJxYWo5V1ZxUGdXL3I2KzdUQmxWT3pSd09LL281WmY3ZzQ2dWxOZU9Ycmo3?=
 =?utf-8?B?QTBIeUNnblVvN0dFd0dKcU9tczZ4S25wWk5VSThoNmt3VUI1MXc3QmhyZUtR?=
 =?utf-8?B?eE5LbDg0enBCMUtyYll6UGZsUHQ5QTNjRjR4ZUlZZllXSkhENlNLbUNSM29R?=
 =?utf-8?B?bFUwam02Zkh5QTk5K1NoaDZWUFB2RHR3K2ZKeXJOMU9zRkdTYXJCMmVlL2Vm?=
 =?utf-8?B?RVZzYlVndE1nemViblAwUjNITWx3QTNsbFl5c2pZdDc2M1c5QlVybHlKbzRt?=
 =?utf-8?B?cC8waHhid3RvSWhFNDZUdG1YT0Ira1F6bzBsY3NIZHNLSU1MOWFOcWk0UTRW?=
 =?utf-8?B?Z3ZSQ2kxbGdaSGU0Y281ZGIxWThqV0daam14eHExWHNJSUdpUTBkbnZIZmNh?=
 =?utf-8?B?NW5MUnBNZ3VXWDVtelBCNkNTWG9BRDBRZnpsSTNWM1NqU1E0OVdkdzh1akt0?=
 =?utf-8?B?bU03NSswMGx1c1BZMVY0RTcyYzNVUUhZbXJFa01VMmF2VW9NZllkeHdHVkFZ?=
 =?utf-8?B?WEdOOVN1YkJkbE1yZ28ra0tSbVV0QXFvdTNPMUUvb2JCVWZBVnhFdy9uRTVO?=
 =?utf-8?B?QWcrVERxLzJVa0FaRUVpYmhZckZlVUxoTk9QWWFUcmZoUE5HTkNrTjZiblhj?=
 =?utf-8?B?OG5kU1MwZ3c1QytZSzJpNUsrSGQ3RlkvVC8rdUNsSDVzTzJGclc0K1B1dXkz?=
 =?utf-8?B?U2hMV3dwVGswOUVNbk9RNUVZd3Vhelo3VEtkaFdjVGdQV2pNRUJTV3F2MU5E?=
 =?utf-8?B?WXIxS0Rpd3Z3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(921020)(8096899003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkM5YlYxcDFLd2ZXRGNCanVHL1VFd1oxQkZtbEgrQ3pxcXRaZWFsMHZOMHBI?=
 =?utf-8?B?TlRXSVdlOThqVHNycmlOK1lIOFBTZ3p6ZTBQTGtiQTZ0N2dlYlZTOFZpTzhr?=
 =?utf-8?B?TzArRzNBNW4xQzhQUUFxTDJ2OGZFbmozMC9vc2NqOHFTZTNzVkx6V2V2RUR2?=
 =?utf-8?B?eDhUTHY3c2xyRjFSbDBrN0g5b1B0MWR0b25zYy9zUGxsbWFjQ0lEVTBCd0h5?=
 =?utf-8?B?aGtmbnMrYkdiSkdvVkVtdlJwekdZZy9HdGRhUFpWT3JkS05DYkEwcnhWQXM3?=
 =?utf-8?B?VkZHZFE1cWRmV0FtN1NyUXNZVTREcUl2YzZlc0FlM0FGeTFFaDIrYmlwY3lL?=
 =?utf-8?B?U1k4QWtIQ0NhWXdYYXBFcmgwbVZLaHdXdUJLTERwTzY0aW1TZjJVb3pYczZQ?=
 =?utf-8?B?UUFNdTdzejgwbjEySmMrTDdtZzRUazZhSXY3bFdiTFJkaDJoU3ZVQjdpbTZN?=
 =?utf-8?B?dElCRGxnWWZzTWFMYXRVeE1zT1puWjlVb1pNOERjYytLdHhqaGFDR0pCdTdO?=
 =?utf-8?B?YUlmb1UrS3oxRE9SdXhmQmd6dnBlbFB1Yy9JWngvL1pNYlgvTFZqY2k1L25q?=
 =?utf-8?B?NzVxMlNLTThDTEM1UWFOWS90aGZIV0ZzSTNqZ0lGQVRwSmFrdGJBTjA3MWwv?=
 =?utf-8?B?NUtOeTVNNW1UdWxFZHplUWJHbU5xdWx1UzNySHpCVmRKUjd5UHVpeC9RckVZ?=
 =?utf-8?B?bXRTWWtMbWRwL0RHemFhSnR2R2lNL2tUQnVDVFY3WithTmJTS1l6ZDAwQzN5?=
 =?utf-8?B?azBybkRwdkcwUGNkMWRDNXBBSmF6clR5SGJXbEhEN1NkTDg1TTJGQWJYelR4?=
 =?utf-8?B?RXlhTTRwUlZqNTM5eVcxUHhtWWtZOFZZby94U3FZN0I0cm1xQTBoc0VGa1Az?=
 =?utf-8?B?UWFhTFgraEVQOWgwVDZ1NldpVk9xUXBvRUEwZlRtczkwcm52emVPZzJLSklq?=
 =?utf-8?B?bXgxR3JzYU1nY3RWVklIMzBEVjNaUm5GY21CamFIM1g2YllBdVVuSm5kUmQy?=
 =?utf-8?B?Q3pjS3lsYlg3clFWKy9EZS9hZEIvUVVJRDA1dG9OcUlMTU9aR2FDTUR3Yk4r?=
 =?utf-8?B?ZkR0d3NvS1RsK3hlM2QxM1RuMUJxOS9Yb0tqMkNXOHp0TExya2w3bEEreU05?=
 =?utf-8?B?ckIzcXZocCt6L0V2TE9PS0xMUjBFM0d3ZlNaK0dJQVB0czNsU0xvSW1BMDda?=
 =?utf-8?B?THJDT0pUNkwyR1JaeDZKZ3gvNFF3c2h4N2wwNXNQS1FJMU00Mzk4cnZNRHlq?=
 =?utf-8?B?Qk9UenErSHNhcDF5ZXpTQVJZRjlndnJvRjBJdXBoMTlDdkt0WUV3aFc5eDd3?=
 =?utf-8?B?bGR6ZHkvSWE3cmNGckQwR1BvbDdnbXd1amIwd0NURnhoOUVwOUthcXVYNHJj?=
 =?utf-8?B?eG94OUYzOTNTTHhMekRpSHJZanZMZFN6SEZxK1pFVzRXcVpuODZyYUJIMkg1?=
 =?utf-8?B?YllWQy9Jb3JITEVNMk9xdmJ5VWtVVS8vdEhCZEtYSmFKWG1PL3JrS2hsa0xM?=
 =?utf-8?B?Z0ZvY2lkbE9mb0dQQmRRK3JYUDRVMS9FWnljUXpodEt6bFVXRzl5NVcwb1Bj?=
 =?utf-8?B?MGRiVm1YNTdwWXlneUdsTHZVbGJjeHB6M1E2TFZyTFdtMUxudkNoNGYrMVVY?=
 =?utf-8?B?clludkpWZWNlZVBCZ0tVVkhGQ3NVa2lhQXFLOWlKS3JkbmllWFhZYXlnODlU?=
 =?utf-8?B?dmZEd3RhQlBKMk8yVGJ0TGdzaDdYSVMyTXBDRytoNnVCczlnYkhYTDlhVWcw?=
 =?utf-8?B?MW1vTlZ5Qm5XamRhSFRHT3JKM3dFZUFGN1Q1dkxxS2g4Tk5pQldiTTZteUo4?=
 =?utf-8?B?U09wU2l1RjdITWFjaXRMNkNiL1RMMlgyL0g1a0tHd2RqbzJtd0dSdnRwREhy?=
 =?utf-8?B?YnNXQzZoaUZlUTFHZzVnSlZBTktpd0UxRUNSVzkrdE5HVW1kYU9JeHY3ZEdv?=
 =?utf-8?B?aEVwRGtHMWNwSGNQR0NjRGFsTUZmS0J1dnBNbzdyc1FRMjM5NlJWcVI0MzFu?=
 =?utf-8?B?bEdLYThqQjA2OTBxMmZneGUvZFM3YXI5ZE9kUGtWOHljSERGOEVEeHdHM1B6?=
 =?utf-8?B?aGtQMW42SHJhUlE2V1VMVkRUMTBPMjhhVURZemI4WUtOT0IvT0lnWE9panVJ?=
 =?utf-8?Q?RflWn+ZTA8ZWa1nwmlG3fsr+m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6619f65b-a240-4153-db39-08ddbfdd011e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 18:10:08.6269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2zKxxnZrHwXQhswIsku2TDI/kLpoDWLHBKF4RvVtMigd1LWODogyX++3RHgG5/Fxd6omgSwE1BCUl7eaPZ2pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8657
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

--------------Zjh1f4k7Eiy7ru38BwLNrlq4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 2025-07-10 12:09, Karthik B S wrote:
>
> Hi Peter,
>
> On 7/10/2025 3:43 PM, Kamil Konieczny wrote:
>> Hi Peter,
>> On 2025-07-08 at 16:40:35 +0200, Peter Senna Tschudin wrote:
>>> Introduce kms_debugfs that is expected to work with any GPU, not limited
>>> to i915 and Xe. The test powers off all available displays before
>>> reading debugfs files, and then powers on all displays before reading
>>> the files again.
>>>
>>> Cc: lucas.demarchi@intel.com
>>> Cc: rodrigo.vivi@intel.com
>>> Cc: kamil.konieczny@linux.intel.com
>>> Cc: katarzyna.piecielska@intel.com
>>> Cc: zbigniew.kempczynski@intel.com
>>> Cc: michal.wajdeczko@intel.com
>>> Cc: karthik.b.s@intel.com
>>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> +Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> Vitaly, could you help us and forward this to your CI testing
>> team and ask them to test this on amdgpu + display connected?
>> This should pass as it is a simple debugfs reading.

Hi Kamil,

Yes, I’ve forwarded the request to the display team CI and asked them to run the tests. Thanks for keeping us informed!

Best regards,
Vitaly

>>> ---
>>> v5:
>>>  - use igt_dir_process_files_simple()
>>>
>>> v4:
>>>  - change test name to kms_debugfs
>>>  - use the wrapper function igt_fit_modes_in_bw()
>>>  - use igt_display_require_output() to ensure there is at least one display
>>>
>>> v3:
>>>  - renamed the test
>>>  - Removed reference to sysfs from comments  (thanks Kamil)
>>>  - Updated description to match the display part (thanks Kamil)
>>>  - Moved from "display" to "heads". Our CI uses "headless" to refer
>>>    to a DUT without display and it is shorter
>>>  - renamed subtests for shorter names (thanks Kamil)
>>>  - fixed comments style (thanks Kamil)
>>>  - updated CC list
>>>  - changed the order to test first with all heads off then with all heads on
>>>    to prevent the need from powering on the heads at the end of the test
>>>    (thanks Kamil)
>>>  - removed snprintf from test names (thanks Kamil)
>>>  - removed subtest group (thanks Kamil)
>>>  - deleted kms_tests() and moved the code to igt_main (thanks Kamil)
>>>
>>> v2:
>>>  - changed style of comparison to NULL
>>>  - moved to a separate patch
>>>
>>>  tests/kms_debugfs.c | 151 ++++++++++++++++++++++++++++++++++++++++++++
>>>  tests/meson.build   |   1 +
>>>  2 files changed, 152 insertions(+)
>>>  create mode 100644 tests/kms_debugfs.c
>>>
>>> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
>>> new file mode 100644
>>> index 000000000..7e10c4bca
>>> --- /dev/null
>>> +++ b/tests/kms_debugfs.c
>>> @@ -0,0 +1,151 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +#include "igt.h"
>>> +#include "igt_debugfs.h"
>>> +#include "igt_dir.h"
>>> +
>>> +/**
>>> + * TEST: kms debugfs test
>>> + * Description: Read entries from debugfs with all displays on and with
>>> + *		all displays off.
>>> + *
>>> + * Category: Core
>>> + * Mega feature: General Core features
>>> + * Sub-category: uapi
>>> + * Functionality: debugfs
>>> + * Feature: core
>>> + * Test category: uapi
>>> + *
>>> + * SUBTEST: display-off-read-all
>>> + * Description: Read all debugfs entries with display off.
>>> + *
>>> + * SUBTEST: display-on-read-all
>>> + * Description: Read all debugfs entries with display on.
>>> + */
>>> +
>>> +/**
>>> + * igt_display_all_on: Try to turn on all displays
>>> + * @display: pointer to the igt_display structure
>>> + *
>>> + * Returns: void
>>> + */
>>> +static void igt_display_all_on(igt_display_t *display)
>>> +{
>>> +	struct igt_fb fb[IGT_MAX_PIPES];
>>> +	enum pipe pipe;
>>> +	int ret;
>>> +
>>> +	/* try to light all pipes */
>>> +retry:
>>> +	for_each_pipe(display, pipe) {
>>> +		igt_output_t *output;
>>> +
>>> +		for_each_valid_output_on_pipe(display, pipe, output) {
>>> +			igt_plane_t *primary;
>>> +			drmModeModeInfo *mode;
>>> +
>>> +			if (output->pending_pipe != PIPE_NONE)
>>> +				continue;
>>> +
>>> +			igt_output_set_pipe(output, pipe);
>>> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>> +			mode = igt_output_get_mode(output);
>>> +			igt_create_pattern_fb(display->drm_fd,
>>> +						mode->hdisplay, mode->vdisplay,
>> Align here.
>>
>>> +						DRM_FORMAT_XRGB8888,
>> Same.
>>
>>> +						DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
>> Same.
>>
>>> +
>>> +			/* Set a valid fb as some debugfs like to
>>> +			 * inspect it on a active pipe
>>> +			 */
>>> +			igt_plane_set_fb(primary, &fb[pipe]);
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	if (display->is_atomic) {
>>> +		bool found = igt_fit_modes_in_bw(display);
>>> +
>>> +		ret = found ? 0 : -1;
>>> +		igt_require_f(found, "No valid mode combo found.\n");
>>> +	} else
>>> +		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>> Add braces for 'else' here:
>> 	} else {
>> 		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>> 	}
>>
>> You could see it yourself with checkpatch.pl with options from
>> CONTRIBUTING.md:
>>
>> 0003-tests-Add-kms_debugfs.patch:99: CHECK:BRACES: braces {} should be used on all arms of this statement
>> #99: FILE: tests/kms_debugfs.c:69:
>> +       if (display->is_atomic) {
>> 	[...]
>> 	+       } else
>> 	[...]
>>
>> 0003-tests-Add-kms_debugfs.patch:104: CHECK:BRACES: Unbalanced braces around else statement
>> #104: FILE: tests/kms_debugfs.c:74:
>> 	+       } else
>>
>>> +
>>> +	if (ret) {
>>> +		igt_output_t *output;
>>> +
>>> +		for_each_connected_output(display, output)
>>> +			igt_output_set_pipe(output, PIPE_NONE);
>>> +
>> Please add some counter and abort on reaching max_retry
>> to prevent infinite loop here. Something like:
>>
>> 		++cnt_retry;
>> 		igt_assert_f(cnt_retry < MAX_IGT_PIPES, "Too much retries %d\n", cnt_retry);
>>
>> Karthik or Swati: I am not sure if this is needed, could you comment
>> on this here?
>
> |I think we don't need a retry at all here. If there is a fail with the first commit just try if we're able to go ahead after using 'igt_fit_modes_in_bw' and if it doesn't allow just skip the test here. That was my motivation to suggest to use the wrapper on the previous revision of the patch.|
>
> |The only issue currently I see(that I just observed) is in 'igt_fit_modes_in_bw' the try_commit we're doing is using atomic commit by default, although there is no reason to have this restriction. So ideally we would want to fix that in lib and then just have something like below in this test.|
>
> |if (atomic)|
>
> |    ret = igt_display_try_atomic_commit|
>
> |else|
>
> |    ret = igt_display_try_commit2(legacy)|
>
> |if (ret)|
>
> |    igt_require(||igt_fit_modes_in_bw(display))|
>
> |igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);|
>
> |Regards,|
> |Karthik.B.S|
>> Overall code looks good.
>>
>> Regards,
>> Kamil
>>
>>> +		goto retry;
>>> +	}
>>> +
>>> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>> +}
>>> +
>>> +/**
>>> + * igt_display_all_off: Try to turn off all displays
>>> + * @display: pointer to the igt_display structure
>>> + *
>>> + * Returns: void
>>> + */
>>> +static void igt_display_all_off(igt_display_t *display)
>>> +{
>>> +	enum pipe pipe;
>>> +	igt_output_t *output;
>>> +	igt_plane_t *plane;
>>> +
>>> +	for_each_connected_output(display, output)
>>> +		igt_output_set_pipe(output, PIPE_NONE);
>>> +
>>> +	for_each_pipe(display, pipe)
>>> +		for_each_plane_on_pipe(display, pipe, plane)
>>> +			igt_plane_set_fb(plane, NULL);
>>> +
>>> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>> +}
>>> +
>>> +IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
>>> +
>>> +igt_main
>>> +{
>>> +	int debugfs = -1;
>>> +	igt_display_t *display;
>>> +	int fd = -1;
>>> +
>>> +	igt_fixture {
>>> +		fd = drm_open_driver_master(DRIVER_ANY);
>>> +		debugfs = igt_debugfs_dir(fd);
>>> +		igt_require(debugfs >= 0);
>>> +
>>> +		kmstest_set_vt_graphics_mode();
>>> +
>>> +		display = calloc(1, sizeof(*display));
>>> +		igt_display_require(display, fd);
>>> +
>>> +		/* Make sure we have at least one output connected */
>>> +		igt_display_require_output(display);
>>> +	}
>>> +
>>> +	igt_subtest("display-off-read-all") {
>>> +		igt_display_all_off(display);
>>> +
>>> +		igt_dir_process_files_simple(debugfs);
>>> +	}
>>> +
>>> +	igt_subtest("display-on-read-all") {
>>> +		/* try to light all pipes */
>>> +		igt_display_all_on(display);
>>> +
>>> +		igt_dir_process_files_simple(debugfs);
>>> +	}
>>> +
>>> +	igt_fixture {
>>> +		igt_display_fini(display);
>>> +		close(debugfs);
>>> +		drm_close_driver(fd);
>>> +	}
>>> +}
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index 99d7d95be..1009bef2e 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -29,6 +29,7 @@ test_progs = [
>>>  	'kms_cursor_crc',
>>>  	'kms_cursor_edge_walk',
>>>  	'kms_cursor_legacy',
>>> +	'kms_debugfs',
>>>  	'kms_dither',
>>>  	'kms_display_modes',
>>>  	'kms_dp_aux_dev',
>>> -- 
>>> 2.43.0
>>>
--------------Zjh1f4k7Eiy7ru38BwLNrlq4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2025-07-10 12:09, Karthik B S wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:71154125-b7e0-43a4-8732-607ff2ac82f5@intel.com">
      
      <p>Hi Peter,</p>
      <div class="moz-cite-prefix">On 7/10/2025 3:43 PM, Kamil Konieczny
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20250710101339.mobt7uyicfm7webf@kamilkon-DESK.igk.intel.com">
        <pre class="moz-quote-pre" wrap="">Hi Peter,
On 2025-07-08 at 16:40:35 +0200, Peter Senna Tschudin wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Introduce kms_debugfs that is expected to work with any GPU, not limited
to i915 and Xe. The test powers off all available displays before
reading debugfs files, and then powers on all displays before reading
the files again.

Cc: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:lucas.demarchi@intel.com" moz-do-not-send="true">lucas.demarchi@intel.com</a>
Cc: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:rodrigo.vivi@intel.com" moz-do-not-send="true">rodrigo.vivi@intel.com</a>
Cc: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:kamil.konieczny@linux.intel.com" moz-do-not-send="true">kamil.konieczny@linux.intel.com</a>
Cc: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:katarzyna.piecielska@intel.com" moz-do-not-send="true">katarzyna.piecielska@intel.com</a>
Cc: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:zbigniew.kempczynski@intel.com" moz-do-not-send="true">zbigniew.kempczynski@intel.com</a>
Cc: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:michal.wajdeczko@intel.com" moz-do-not-send="true">michal.wajdeczko@intel.com</a>
Cc: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:karthik.b.s@intel.com" moz-do-not-send="true">karthik.b.s@intel.com</a>
Signed-off-by: Peter Senna Tschudin <a class="moz-txt-link-rfc2396E" href="mailto:peter.senna@linux.intel.com" moz-do-not-send="true">&lt;peter.senna@linux.intel.com&gt;</a>
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">+Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com" moz-do-not-send="true">&lt;vitaly.prosyak@amd.com&gt;</a>

Vitaly, could you help us and forward this to your CI testing
team and ask them to test this on amdgpu + display connected?
This should pass as it is a simple debugfs reading.
</pre>
      </blockquote>
    </blockquote>
    <br>
    <p data-start="66" data-end="79"><span data-start="66" data-end="79">Hi
        Kamil,</span></p>
    <p data-start="81" data-end="200">Yes, I’ve forwarded the request to
      the display team CI and asked them to run the tests. Thanks for
      keeping us informed!</p>
    <p data-start="202" data-end="224" data-is-last-node="" data-is-only-node="">Best regards,<br data-start="215" data-end="218">
      Vitaly</p>
    <blockquote type="cite" cite="mid:71154125-b7e0-43a4-8732-607ff2ac82f5@intel.com">
      <blockquote type="cite" cite="mid:20250710101339.mobt7uyicfm7webf@kamilkon-DESK.igk.intel.com">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">---
v5:
 - use igt_dir_process_files_simple()

v4:
 - change test name to kms_debugfs
 - use the wrapper function igt_fit_modes_in_bw()
 - use igt_display_require_output() to ensure there is at least one display

v3:
 - renamed the test
 - Removed reference to sysfs from comments  (thanks Kamil)
 - Updated description to match the display part (thanks Kamil)
 - Moved from &quot;display&quot; to &quot;heads&quot;. Our CI uses &quot;headless&quot; to refer
   to a DUT without display and it is shorter
 - renamed subtests for shorter names (thanks Kamil)
 - fixed comments style (thanks Kamil)
 - updated CC list
 - changed the order to test first with all heads off then with all heads on
   to prevent the need from powering on the heads at the end of the test
   (thanks Kamil)
 - removed snprintf from test names (thanks Kamil)
 - removed subtest group (thanks Kamil)
 - deleted kms_tests() and moved the code to igt_main (thanks Kamil)

v2:
 - changed style of comparison to NULL
 - moved to a separate patch

 tests/kms_debugfs.c | 151 ++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build   |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 tests/kms_debugfs.c

diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
new file mode 100644
index 000000000..7e10c4bca
--- /dev/null
+++ b/tests/kms_debugfs.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include &quot;igt.h&quot;
+#include &quot;igt_debugfs.h&quot;
+#include &quot;igt_dir.h&quot;
+
+/**
+ * TEST: kms debugfs test
+ * Description: Read entries from debugfs with all displays on and with
+ *		all displays off.
+ *
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: debugfs
+ * Feature: core
+ * Test category: uapi
+ *
+ * SUBTEST: display-off-read-all
+ * Description: Read all debugfs entries with display off.
+ *
+ * SUBTEST: display-on-read-all
+ * Description: Read all debugfs entries with display on.
+ */
+
+/**
+ * igt_display_all_on: Try to turn on all displays
+ * @display: pointer to the igt_display structure
+ *
+ * Returns: void
+ */
+static void igt_display_all_on(igt_display_t *display)
+{
+	struct igt_fb fb[IGT_MAX_PIPES];
+	enum pipe pipe;
+	int ret;
+
+	/* try to light all pipes */
+retry:
+	for_each_pipe(display, pipe) {
+		igt_output_t *output;
+
+		for_each_valid_output_on_pipe(display, pipe, output) {
+			igt_plane_t *primary;
+			drmModeModeInfo *mode;
+
+			if (output-&gt;pending_pipe != PIPE_NONE)
+				continue;
+
+			igt_output_set_pipe(output, pipe);
+			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			mode = igt_output_get_mode(output);
+			igt_create_pattern_fb(display-&gt;drm_fd,
+						mode-&gt;hdisplay, mode-&gt;vdisplay,
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Align here.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+						DRM_FORMAT_XRGB8888,
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Same.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+						DRM_FORMAT_MOD_LINEAR, &amp;fb[pipe]);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Same.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+			/* Set a valid fb as some debugfs like to
+			 * inspect it on a active pipe
+			 */
+			igt_plane_set_fb(primary, &amp;fb[pipe]);
+			break;
+		}
+	}
+
+	if (display-&gt;is_atomic) {
+		bool found = igt_fit_modes_in_bw(display);
+
+		ret = found ? 0 : -1;
+		igt_require_f(found, &quot;No valid mode combo found.\n&quot;);
+	} else
+		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Add braces for 'else' here:
	} else {
		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
	}

You could see it yourself with checkpatch.pl with options from
CONTRIBUTING.md:

0003-tests-Add-kms_debugfs.patch:99: CHECK:BRACES: braces {} should be used on all arms of this statement
#99: FILE: tests/kms_debugfs.c:69:
+       if (display-&gt;is_atomic) {
	[...]
	+       } else
	[...]

0003-tests-Add-kms_debugfs.patch:104: CHECK:BRACES: Unbalanced braces around else statement
#104: FILE: tests/kms_debugfs.c:74:
	+       } else

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+	if (ret) {
+		igt_output_t *output;
+
+		for_each_connected_output(display, output)
+			igt_output_set_pipe(output, PIPE_NONE);
+
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Please add some counter and abort on reaching max_retry
to prevent infinite loop here. Something like:

		++cnt_retry;
		igt_assert_f(cnt_retry &lt; MAX_IGT_PIPES, &quot;Too much retries %d\n&quot;, cnt_retry);

Karthik or Swati: I am not sure if this is needed, could you comment
on this here?</pre>
      </blockquote>
      <p><code>I think we don't need a retry at all here. If there is a
          fail with the first commit just try if we're able to go ahead
          after using 'igt_fit_modes_in_bw' and if it doesn't allow just
          skip the test here. That was my motivation to suggest to use
          the wrapper on the previous revision of the patch.</code></p>
      <p><code><span class="">The only issue currently I see(that I just
            observed) is in 'igt_fit_modes_in_bw' the try_commit we're
            doing is using atomic commit by default, although there is
            no reason to have this restriction. So ideally we would want
            to fix that in lib and then just have something like below
            in this test.</span></code></p>
      <p><code><span class="">if (atomic)</span></code></p>
      <p><code><span class="">&nbsp; &nbsp; ret = igt_display_try_atomic_commit</span></code></p>
      <p><code><span class="">else</span></code></p>
      <p><code><span class="">&nbsp; &nbsp; ret = igt_display_try_commit2(legacy)</span></code></p>
      <p><code><span class="">if (ret)</span></code></p>
      <p><code><span class="">&nbsp; &nbsp; igt_require(</span></code><code><span class="">igt_fit_modes_in_bw</span><span class="">(display))</span></code></p>
      <p><code><span class="">igt_display_commit2(display,
            display-&gt;is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);</span></code></p>
      <code><span class="">Regards,</span></code><br>
      <code><span class="">Karthik.B.S</span></code>
      <blockquote type="cite" cite="mid:20250710101339.mobt7uyicfm7webf@kamilkon-DESK.igk.intel.com">
        <pre class="moz-quote-pre" wrap="">Overall code looks good.

Regards,
Kamil

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+		goto retry;
+	}
+
+	igt_display_commit2(display, display-&gt;is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+}
+
+/**
+ * igt_display_all_off: Try to turn off all displays
+ * @display: pointer to the igt_display structure
+ *
+ * Returns: void
+ */
+static void igt_display_all_off(igt_display_t *display)
+{
+	enum pipe pipe;
+	igt_output_t *output;
+	igt_plane_t *plane;
+
+	for_each_connected_output(display, output)
+		igt_output_set_pipe(output, PIPE_NONE);
+
+	for_each_pipe(display, pipe)
+		for_each_plane_on_pipe(display, pipe, plane)
+			igt_plane_set_fb(plane, NULL);
+
+	igt_display_commit2(display, display-&gt;is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+}
+
+IGT_TEST_DESCRIPTION(&quot;Read entries from debugfs with display on/off.&quot;);
+
+igt_main
+{
+	int debugfs = -1;
+	igt_display_t *display;
+	int fd = -1;
+
+	igt_fixture {
+		fd = drm_open_driver_master(DRIVER_ANY);
+		debugfs = igt_debugfs_dir(fd);
+		igt_require(debugfs &gt;= 0);
+
+		kmstest_set_vt_graphics_mode();
+
+		display = calloc(1, sizeof(*display));
+		igt_display_require(display, fd);
+
+		/* Make sure we have at least one output connected */
+		igt_display_require_output(display);
+	}
+
+	igt_subtest(&quot;display-off-read-all&quot;) {
+		igt_display_all_off(display);
+
+		igt_dir_process_files_simple(debugfs);
+	}
+
+	igt_subtest(&quot;display-on-read-all&quot;) {
+		/* try to light all pipes */
+		igt_display_all_on(display);
+
+		igt_dir_process_files_simple(debugfs);
+	}
+
+	igt_fixture {
+		igt_display_fini(display);
+		close(debugfs);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 99d7d95be..1009bef2e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -29,6 +29,7 @@ test_progs = [
 	'kms_cursor_crc',
 	'kms_cursor_edge_walk',
 	'kms_cursor_legacy',
+	'kms_debugfs',
 	'kms_dither',
 	'kms_display_modes',
 	'kms_dp_aux_dev',
-- 
2.43.0

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Zjh1f4k7Eiy7ru38BwLNrlq4--
