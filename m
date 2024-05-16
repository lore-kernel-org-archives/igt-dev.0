Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF70C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 09:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3957610E49E;
	Thu, 16 May 2024 09:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r6R5XLIx";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC98010E126
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 09:11:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVhDSUWOHC1a3sb/ip/yolTMZY0gZywC76JkVdhGAGDTy0qgiBSMLuFPeWDcEsqJTqxZZZQZ0s4PBu0ZrOoOSfaGdLAUJjQn3Ny/UWt0WP4rmGqEj8CequKOgwQIcZakrVN4eV7Y6jHKA2AW9eGq5RxVazOSWgyf0wU3DqMigX0FwO6kNjraWDQZ1nua8F3Fuqf4VALkeHrwNyHgmmdXvU6fOCkO/pv3kXV7tHDzb4WHJAhwVtMRGYifY/CFyW08BolG5Y43yT0OBm4mWt/H2zilzWdjtaewYq2gJcbnUc1BXoYGD0093x4QEYyvHgDS48zfrB3QDDyhgGK+oGGPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C05winnwnZwNN+xu0leP1A0GqjHx3EMC9lR3oGxoR8U=;
 b=aS+sSOGyKLhwxI1QIp6+TxnEe+FOyNnA8y9+IhE6P5wrcstliJdqymte0y5ZlwlOAgRSfbvVzz89DKPMPPHrKUyVRGkX2V5Ym+w9yXqNJBHnqqEfPEfXHkECpOyxHk2C0wLOtMCYeJ9LtL8ZNuLFMPBnFxcKKGyEWUYgG/CBnAx/Agrb1b+PGsdz9zNCMx4feQbAd1FNMsXTp2IkOT928RSMr9K6298nFnAsVnCraclPFzx0KAh2EIPnl8ADVhgxRxTuGwOuL5WBxd+vAYI7ur/fDUlgH1fUsh+fGtPC2Cw6/eeKGvAiE0qpj3RZMrP8PW0rRr+kVx/qbP/PZue+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C05winnwnZwNN+xu0leP1A0GqjHx3EMC9lR3oGxoR8U=;
 b=r6R5XLIx/7x7ker+ZsuWKe0px36i8FNS03DwjltcjVXPOyuZcGZImCjxq7VxImwUeV/+y2zRRl7s10+n4jQcEoT4aHi4wtG3JSd/7OtSwWDTOW/ijO6sJgbLaXqvLfcmGlbrPv8fCXCQGC0HJGYy+3af0fmUXTm6dFF+mupnOyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22)
 by LV3PR12MB9233.namprd12.prod.outlook.com (2603:10b6:408:194::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 09:11:36 +0000
Received: from MN0PR12MB6293.namprd12.prod.outlook.com
 ([fe80::49ac:e84e:ea32:d743]) by MN0PR12MB6293.namprd12.prod.outlook.com
 ([fe80::49ac:e84e:ea32:d743%2]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 09:11:36 +0000
Message-ID: <3f4e5dbe-794b-46f1-8972-3a8644097b3b@amd.com>
Date: Thu, 16 May 2024 14:41:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/amdgpu: support jpeg test on gfx940
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>, Leo Liu <leo.liu@amd.com>
References: <20240513135705.2399645-1-sathishkumar.sundararaju@amd.com>
 <20240515171632.6qavel4ojvvtwcck@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sundararaju, Sathishkumar" <sasundar@amd.com>
In-Reply-To: <20240515171632.6qavel4ojvvtwcck@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To MN0PR12MB6293.namprd12.prod.outlook.com
 (2603:10b6:208:3c2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6293:EE_|LV3PR12MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: e63579c9-9bf5-4517-553a-08dc7588300e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmRtUmYzenBLZGpIZU5xMzRSSHhPQWhhdC82Mlh0cXFVbDcyZWF0dklUdk5s?=
 =?utf-8?B?VmVNdzNLZmF6QlRSc2Q3NkdoV3RYVUtkRFBLalQ0VGRheDBEVWUzSUtzN1Bk?=
 =?utf-8?B?OHdBNjkrTHdZdWdqTS9wOGNFdjN2emtEL2tPR2pVeHhuN3ViRXVwZC91OXI2?=
 =?utf-8?B?OTNwd1k0cEp0Y1J2b2pWblhtOUhHbzhtREN6VURZekNEY3NxMGdxR1ZQdlBv?=
 =?utf-8?B?ZjNMWFVJOXBOOThDR1o3d1MwSjhDdndyTVRMSGFVUEFZdis0N0txZDRSODcw?=
 =?utf-8?B?Uzk3WFJMRHhYWjloemhucm5UUnBOSXd4aVZVamxGR2RvUk1XNjlEcUJUcVlv?=
 =?utf-8?B?eWlCZmhsWHFmZ1lwQk1pTGtoakFaaldPZFhDdm5pNDVrdWhyR1h0RklHQ2s0?=
 =?utf-8?B?SW9OMWJLQjFWemFORWdWbEprV1l5ZUFJV1dLZnVDNkp5NElIcmVjcEFZN2RW?=
 =?utf-8?B?WVpYdUgvMDBaT21aalVxUlppa3pyVEI4NjBNTjNjb1Mwa3lldjNsNzVZWXpi?=
 =?utf-8?B?Z2pmVllGM2lUT3NyZ0thRmVQL05OdWRjT3YxaHRxVXhuU1FqUkw5L1R1OVFr?=
 =?utf-8?B?TXFleTA0WFNqQmRsM2p6eFM3MzZON3ZOVzBlZk9oanFFOCtmcVlLdVBvWUVD?=
 =?utf-8?B?Tk9SZ1FTbzJwRWNDT0tYTmNSNFFFenJxcGljVmVhbnEySnorNHhPdWVKSk5K?=
 =?utf-8?B?VG12QThGOTRJOGZNeTRBcXBJNitaQVIzdEZEckY4TDVBMlUrNVRxODhjdEVm?=
 =?utf-8?B?R3phcmxsWE9paUdNS1c1elRoYUxYV3BReitkK0oyNlFUU2Ixdk9kWkswY2Fx?=
 =?utf-8?B?SDRIYTdFSHVVRTFWSlBrM1RyQWk4eTNSeEUzUmhLMFF3dVN1UnVwZmNkSFlX?=
 =?utf-8?B?MGdrUjYyNFllMzVPTjEzNU9FR1hIVEo2MGd3UjFPQXlZNHRid1FSYk92cmRS?=
 =?utf-8?B?RWcvMllYUncrL0l6RFplcmxzNlNLTExJM0dBcVZSd096OXYxSi9XSUlZU3Vm?=
 =?utf-8?B?d0dPdTZmQlpvTkU3TTNVMGtwWmFEZFY4WHg5UUJRaGRsS3BBZU9Mb3BwQVBS?=
 =?utf-8?B?WjZpSEpnV1JJV0V1QWdxeWJOdmFrbkh2VnZPaUxHYWM4amZwTDl3R1hEaFh3?=
 =?utf-8?B?dXQ2eUEwZzRNSHpHTDRocGphajRUY2xpdFFpb2hFcktaQWNFMHc1djJzWXdX?=
 =?utf-8?B?QzQzditHNm9penRvRHZXRkFOWlJIUzUzL3gzUGFEeXA2UVZFdUdFTVFMUFlY?=
 =?utf-8?B?QUdLSCtZRmZVK2d2WFpjdUxDZDNhZFlOZ3F2d1J5YnhhTUVpQm1DTTJZc1A2?=
 =?utf-8?B?Z2pnK1Z2UXUrNFV2VnJZTGhSeUtuV2t2REMyR3YyMm94RTJrSTNkaWpMRHFL?=
 =?utf-8?B?Qk9kMEx6MFhMNDdDcE54SEtYc0dKelEreXg0amF5R3ZlT3BKb0VRc0N2a0ZI?=
 =?utf-8?B?cUVRZzA1bmlLdW1NSXFnNmtTai9meXljNlB3YUZHUDl3cmVyRWx1UFNTNk42?=
 =?utf-8?B?ZmJHM3RieDlKVkdlN0pUblBPejY1bmlSdUo5Wlc5cmJTY3g3RXgxRjcrMzd4?=
 =?utf-8?B?M3Z4WllLODFLaGs5TE9iUVQrd0pnVEpsZm4zWkRyQTJTd2UzTWxiL25tK2w2?=
 =?utf-8?B?WXh4WFZ0cHkrVzU5MHIxdFBOdmVtNFZOQnBYcHY4NGhuK0dDRDFwV3YycDEx?=
 =?utf-8?B?dmhSVVlTaDdjMWZJV2VrTlovN0wzSWsvRVZkUWdDZmJ3UkVnaXprMzhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6293.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk1ZT0NobjlQeGtpOFN3RDd2WGdjVzNVaHdzM09obVlKelQrTGxVTGxtRE9s?=
 =?utf-8?B?MklDZFpLdVZSWmpwdEVFT2JpU2hFSldMTkNjQ2tCeHYvQ0ZXS1dGQU5xWkNN?=
 =?utf-8?B?Y1NMNTBiNU5IUEw2VDlBdUpYdGdlZkk2YUY5T0tTRWhZZVdVYWNiRFliN1Rh?=
 =?utf-8?B?UURmVEE4K3ZycjByeVZ6VFF5MlZ3YW9CeThNbTVINXdoajVENUFuR2dXeHhl?=
 =?utf-8?B?T2FjVjEzR0Z1RWx1UDEvZUI4c0MvSkw4NU5aRUZqNVY2UTQ1Q0tYQjNzTmw2?=
 =?utf-8?B?ZFR2dFFXYU9VaU9rc1VqckZNU2VFZ3duZCsyak5pWHlOQ2NXRm9OWVdtZ1JE?=
 =?utf-8?B?OWtqa041VlViU1lMZWhSRjNIeUZaYjdOdTRHSjUxUkpQRStzMkxNdnZDa1B2?=
 =?utf-8?B?bGY4K1pUNy9hMkQ0ejJhU1lCTFltMFlSN0NwRng4Z3ozalp4Y29QZ1NDSEs5?=
 =?utf-8?B?dm9nVjBrOGQxZmtEZmdpZTZtZzNubndrQXlSNk50UkV6QjRzeGF0M3BwM1lY?=
 =?utf-8?B?SSs5ZGlRWXVIOTV3eG91UDVnLy90c3U2bk8rN2tFTndLNEo4a3hvUnJ0V2ox?=
 =?utf-8?B?N2ZlL0Q2Mld5U3kzWms2aUFmN0ozUElDdVBsQWM5TnRFMlZZUW9xZGdjcVFN?=
 =?utf-8?B?QUkvVm9ldTVxa1EyVFVnWUV2WmJ6TGRpQ2gwNzY4MnlmOHVxR1NzcXI3OGE1?=
 =?utf-8?B?SUlpQTRkMkUrU09YRzYyRnFiRXR1OGFCcGhGUDBQU2FSSmdXckpZMXY5N3lw?=
 =?utf-8?B?TFRxZDRJa3llRXJlSXNXbHpQOGFoc1VxbzFJMlo2QVNlVGJiL3I3Y0krK0ho?=
 =?utf-8?B?UGo0M3lFVWt4dXI0a2toanBLRDUrTlVFdWU5WWwvR0V5MEJHS1ZNK2VwWFZw?=
 =?utf-8?B?ME43TUJuTDdVNWdoa1lPODBSNk96emZjdmFUakRxdzFTY3hYb0grSXVNS01U?=
 =?utf-8?B?SmZPeGoyVUEwUUxWUkdRZCtJU3R5Z0dRQjFEZ2hGK0loWmFkaFN5b2FaRkpD?=
 =?utf-8?B?NHR1cWFwcGx6d0wwR3RjRE81V0VVSk9PbTBBVUdrbURPd2VWWmh5QXJIVFg5?=
 =?utf-8?B?U1FJYVVuMG1oV05XR0NyYm4zME1wY1BQc0s4RTEzVjh3ZkVOMHdNMThtOFgx?=
 =?utf-8?B?TW5Lc3phNTRRcXdWL2dWeC9CSW9LUWY5dkNqV20waTJ2Uk1CUzlSOEw3UUpo?=
 =?utf-8?B?b0VNTkFLeUtsLzIvN05xbzFYMENWNHlVU1hJMU1tc2VnRDFSdHFZNExCbVhT?=
 =?utf-8?B?WUM5SUt1eG1QdncyR1kyMFRqVDZxRUlZNmU4NXhnbnBQL2IwSFgrNml2K2U2?=
 =?utf-8?B?c3g1eGhmb0p1cjNxWGVydkc2WDhOWG83RGRBbTBIekZkM1BTb3lYRTZyN1JD?=
 =?utf-8?B?dXVGYU93S3dUbUN3QnJGc2F6UGdMblU0THhYTERVWFBkUlVaTDhTU3BId1Fv?=
 =?utf-8?B?WmZONkFITyt2aWNpVnRKbEhmQlkrUmVVOHRCaHJQaFJPMHVVZlVsaWRGWCt2?=
 =?utf-8?B?eVBpM0ZNRkdXQTEvSFl2VExINHFEYldjT1dTcEVhU3pjeTFkLzRqb3pPcTg5?=
 =?utf-8?B?Zk5UbGYrby9aOHJFUzhRaUczQ3Q5YVJwazAyVE5QQk9ScHRGZVVNaDkzOEtz?=
 =?utf-8?B?bk5nVHJwVkkxQ2tjZWpOUThjdC9pcE5MRUJXU0MybzdVR0p6ZWVFQzIrbW5r?=
 =?utf-8?B?Um1HSjV5UmhZYUFjNXFxZGVhWHJJSHhyalhGZG5aeGZpVFQxN3RRMGdVR2Jq?=
 =?utf-8?B?TjhscGZoV0ZGNmY4QlAySGp3Y1Z5ejNvK1dQWks0TWxnUG9jMUpLaUxvSC91?=
 =?utf-8?B?OTdMUVFDQThZeStGb0dodVh3VzRwSE56MEJMVmluRVcxcXJHLzI0RUhYYk9X?=
 =?utf-8?B?cHBVZGFPK3hadzNHU3hNYURTaUNJbnhIaDRuVEhFeWlXRXpWMkc2MWpwWk5a?=
 =?utf-8?B?WEJxVk9ZSlV0MTI5SlVEdXYvUG5RaHdNQnBYck9sdGxzNkNpSkZuTytnTjBi?=
 =?utf-8?B?aHFOc2xDRzJhV2lYYjJnOGdWQ2lRVGZ0QWNodXI2ZzEyczRGc1RHNHo5cXlC?=
 =?utf-8?B?ZW9zdkVmN1RRTnE1V2tlSkhkSTQ4RFJhMzNhUXMyTkl3cmR4VjNMNWZscThz?=
 =?utf-8?Q?mjijSlW8KJ6VAWBbb7T3ubUIh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e63579c9-9bf5-4517-553a-08dc7588300e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6293.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 09:11:36.5068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6DH9fiefS3CfnzEcd4WIAzTtqanNlOarHeXMHKboZhgM+9IDmeWh+a581yg/3vpA8B2QGYFyG2qST4FdneGsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9233
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

Hi Kamil,

On 5/15/2024 10:46 PM, Kamil Konieczny wrote:
> Hi Sathishkumar,
> On 2024-05-13 at 19:27:04 +0530, Sathishkumar S wrote:
>> update jpeg specific register offsets
> --^
>
> Start sentence with uppercase. No need for resend,
> this can be corrected at merge.

Noted, I will update this, thank you.

Regards,

Sathish

>
> Regards,
> Kamil
>
>> Signed-off-by: Sathishkumar S <sathishkumar.sundararaju@amd.com>
>> Acked-by: Leo Liu <leo.liu@amd.com>
>> ---
>>   tests/amdgpu/amd_jpeg_dec.c | 167 +++++++++++++++++++++++++++---------
>>   1 file changed, 127 insertions(+), 40 deletions(-)
>>
>> diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
>> index bb2a8e97e530..12f5bfcff556 100644
>> --- a/tests/amdgpu/amd_jpeg_dec.c
>> +++ b/tests/amdgpu/amd_jpeg_dec.c
>> @@ -53,6 +53,47 @@
>>   #define vcnipUVD_JPEG_RB_RPTR			0x4003
>>   #define vcnipUVD_JPEG_OUTBUF_WPTR		0x401d
>>   
>> +#define vcnipUVD_JPEG_DEC_SOFT_RST_1             0x4051
>> +#define vcnipUVD_JPEG_PITCH_1                    0x4043
>> +#define vcnipUVD_JPEG_UV_PITCH_1                 0x4044
>> +#define vcnipJPEG_DEC_ADDR_MODE_1                0x404B
>> +#define vcnipUVD_JPEG_TIER_CNTL2_1               0x400E
>> +#define vcnipUVD_JPEG_OUTBUF_CNTL_1              0x4040
>> +#define vcnipUVD_JPEG_OUTBUF_WPTR_1              0x4041
>> +#define vcnipUVD_JPEG_OUTBUF_RPTR_1              0x4042
>> +#define vcnipUVD_JPEG_LUMA_BASE0_0               0x41C0
>> +#define vcnipUVD_JPEG_CHROMA_BASE0_0             0x41C1
>> +#define vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE_1   0x4048
>> +#define vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE_1  0x4049
>> +#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH_1 0x40B5
>> +#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW_1  0x40B4
>> +#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH_1  0x40B3
>> +#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW_1   0x40B2
>> +
>> +static uint32_t jpeg_dec_soft_rst;
>> +static uint32_t jrbc_ib_cond_rd_timer;
>> +static uint32_t jrbc_ib_ref_data;
>> +static uint32_t lmi_jpeg_read_64bit_bar_high;
>> +static uint32_t lmi_jpeg_read_64bit_bar_low;
>> +static uint32_t jpeg_rb_base;
>> +static uint32_t jpeg_rb_size;
>> +static uint32_t jpeg_rb_wptr;
>> +static uint32_t jpeg_pitch;
>> +static uint32_t jpeg_uv_pitch;
>> +static uint32_t dec_addr_mode;
>> +static uint32_t dec_y_gfx10_tiling_surface;
>> +static uint32_t dec_uv_gfx10_tiling_surface;
>> +static uint32_t lmi_jpeg_write_64bit_bar_high;
>> +static uint32_t lmi_jpeg_write_64bit_bar_low;
>> +static uint32_t jpeg_tier_cntl2;
>> +static uint32_t jpeg_outbuf_rptr;
>> +static uint32_t jpeg_outbuf_cntl;
>> +static uint32_t jpeg_int_en;
>> +static uint32_t jpeg_cntl;
>> +static uint32_t jpeg_rb_rptr;
>> +static uint32_t jpeg_outbuf_wptr;
>> +static uint32_t jpeg_luma_base0_0;
>> +static uint32_t jpeg_chroma_base0_0;
>>   
>>   #define RDECODE_PKT_REG_J(x)		((unsigned int)(x)&0x3FFFF)
>>   #define RDECODE_PKT_RES_J(x)		(((unsigned int)(x)&0x3F) << 18)
>> @@ -104,6 +145,50 @@ is_jpeg_tests_enable(amdgpu_device_handle device_handle,
>>   	else
>>   		return false;
>>   
>> +	jrbc_ib_cond_rd_timer = vcnipUVD_JRBC_IB_COND_RD_TIMER;
>> +	jrbc_ib_ref_data = vcnipUVD_JRBC_IB_REF_DATA;
>> +	jpeg_rb_base = vcnipUVD_JPEG_RB_BASE;
>> +	jpeg_rb_size = vcnipUVD_JPEG_RB_SIZE;
>> +	jpeg_rb_wptr = vcnipUVD_JPEG_RB_WPTR;
>> +	jpeg_int_en = vcnipUVD_JPEG_INT_EN;
>> +	jpeg_cntl = vcnipUVD_JPEG_CNTL;
>> +	jpeg_rb_rptr = vcnipUVD_JPEG_RB_RPTR;
>> +
>> +	if (context->family_id == AMDGPU_FAMILY_AI &&
>> +		(context->chip_id - context->chip_rev) > 0x3c) { /* gfx940 */
>> +		jpeg_dec_soft_rst = vcnipUVD_JPEG_DEC_SOFT_RST_1;
>> +		lmi_jpeg_read_64bit_bar_high = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH_1;
>> +		lmi_jpeg_read_64bit_bar_low = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW_1;
>> +		jpeg_pitch = vcnipUVD_JPEG_PITCH_1;
>> +		jpeg_uv_pitch = vcnipUVD_JPEG_UV_PITCH_1;
>> +		dec_addr_mode = vcnipJPEG_DEC_ADDR_MODE_1;
>> +		dec_y_gfx10_tiling_surface = vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE_1;
>> +		dec_uv_gfx10_tiling_surface = vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE_1;
>> +		lmi_jpeg_write_64bit_bar_high = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH_1;
>> +		lmi_jpeg_write_64bit_bar_low = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW_1;
>> +		jpeg_tier_cntl2 = vcnipUVD_JPEG_TIER_CNTL2_1;
>> +		jpeg_outbuf_cntl = vcnipUVD_JPEG_OUTBUF_CNTL_1;
>> +		jpeg_outbuf_rptr = vcnipUVD_JPEG_OUTBUF_RPTR_1;
>> +		jpeg_outbuf_wptr = vcnipUVD_JPEG_OUTBUF_WPTR_1;
>> +		jpeg_luma_base0_0 = vcnipUVD_JPEG_LUMA_BASE0_0;
>> +		jpeg_chroma_base0_0 = vcnipUVD_JPEG_CHROMA_BASE0_0;
>> +	} else {
>> +		jpeg_dec_soft_rst = vcnipUVD_JPEG_DEC_SOFT_RST;
>> +		lmi_jpeg_read_64bit_bar_high = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH;
>> +		lmi_jpeg_read_64bit_bar_low = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW;
>> +		jpeg_pitch = vcnipUVD_JPEG_PITCH;
>> +		jpeg_uv_pitch = vcnipUVD_JPEG_UV_PITCH;
>> +		dec_addr_mode = vcnipJPEG_DEC_ADDR_MODE;
>> +		dec_y_gfx10_tiling_surface = vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE;
>> +		dec_uv_gfx10_tiling_surface = vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE;
>> +		lmi_jpeg_write_64bit_bar_high = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH;
>> +		lmi_jpeg_write_64bit_bar_low = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW;
>> +		jpeg_tier_cntl2 = vcnipUVD_JPEG_TIER_CNTL2;
>> +		jpeg_outbuf_cntl = vcnipUVD_JPEG_OUTBUF_CNTL;
>> +		jpeg_outbuf_rptr = vcnipUVD_JPEG_OUTBUF_RPTR;
>> +		jpeg_outbuf_wptr = vcnipUVD_JPEG_OUTBUF_WPTR;
>> +	}
>> +
>>   	return true;
>>   }
>>   
>> @@ -277,39 +362,34 @@ send_cmd_bitstream_direct(struct mmd_context *context, uint64_t addr,
>>   {
>>   
>>   	/* jpeg soft reset */
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_DEC_SOFT_RST, COND0, TYPE0, 1, idx);
>> +	set_reg_jpeg(context, jpeg_dec_soft_rst, COND0, TYPE0, 1, idx);
>>   
>>   	/* ensuring the Reset is asserted in SCLK domain */
>> -	set_reg_jpeg(context, vcnipUVD_JRBC_IB_COND_RD_TIMER, COND0, TYPE0,
>> -			0x01400200, idx);
>> -	set_reg_jpeg(context, vcnipUVD_JRBC_IB_REF_DATA, COND0, TYPE0,
>> -			(0x1 << 0x10), idx);
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_DEC_SOFT_RST, COND3, TYPE3,
>> -			(0x1 << 0x10), idx);
>> +	set_reg_jpeg(context, jrbc_ib_cond_rd_timer, COND0, TYPE0, 0x01400200, idx);
>> +	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, (0x1 << 0x10), idx);
>> +	set_reg_jpeg(context, jpeg_dec_soft_rst, COND3, TYPE3, (0x1 << 0x10), idx);
>>   
>>   	/* wait mem */
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_DEC_SOFT_RST, COND0, TYPE0, 0, idx);
>> +	set_reg_jpeg(context, jpeg_dec_soft_rst, COND0, TYPE0, 0, idx);
>>   
>>   	/* ensuring the Reset is de-asserted in SCLK domain */
>> -	set_reg_jpeg(context, vcnipUVD_JRBC_IB_REF_DATA, COND0, TYPE0, (0 << 0x10),
>> -			idx);
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_DEC_SOFT_RST, COND3, TYPE3,
>> -			(0x1 << 0x10), idx);
>> +	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, (0 << 0x10), idx);
>> +	set_reg_jpeg(context, jpeg_dec_soft_rst, COND3, TYPE3, (0x1 << 0x10), idx);
>>   
>>   	/* set UVD_LMI_JPEG_READ_64BIT_BAR_LOW/HIGH based on bitstream buffer address */
>> -	set_reg_jpeg(context, vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH, COND0, TYPE0,
>> +	set_reg_jpeg(context, lmi_jpeg_read_64bit_bar_high, COND0, TYPE0,
>>   			(addr >> 32), idx);
>> -	set_reg_jpeg(context, vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW, COND0, TYPE0,
>> +	set_reg_jpeg(context, lmi_jpeg_read_64bit_bar_low, COND0, TYPE0,
>>   			addr, idx);
>>   
>>   	/* set jpeg_rb_base */
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_RB_BASE, COND0, TYPE0, 0, idx);
>> +	set_reg_jpeg(context, jpeg_rb_base, COND0, TYPE0, 0, idx);
>>   
>>   	/* set jpeg_rb_base */
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_RB_SIZE, COND0, TYPE0, 0xFFFFFFF0, idx);
>> +	set_reg_jpeg(context, jpeg_rb_size, COND0, TYPE0, 0xFFFFFFF0, idx);
>>   
>>   	/* set jpeg_rb_wptr */
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_RB_WPTR, COND0, TYPE0,
>> +	set_reg_jpeg(context, jpeg_rb_wptr, COND0, TYPE0,
>>   			(JPEG_DEC_BSD_SIZE >> 2), idx);
>>   }
>>   
>> @@ -319,59 +399,66 @@ send_cmd_target_direct(struct mmd_context *context, uint64_t addr,
>>   		uint32_t *idx)
>>   {
>>   
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_PITCH, COND0, TYPE0,
>> +	set_reg_jpeg(context, jpeg_pitch, COND0, TYPE0,
>>   			(JPEG_DEC_DT_PITCH >> 4), idx);
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_UV_PITCH, COND0, TYPE0,
>> +	set_reg_jpeg(context, jpeg_uv_pitch, COND0, TYPE0,
>>   			(JPEG_DEC_DT_PITCH >> 4), idx);
>>   
>> -	set_reg_jpeg(context, vcnipJPEG_DEC_ADDR_MODE, COND0, TYPE0, 0, idx);
>> -	set_reg_jpeg(context, vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE, COND0, TYPE0,
>> +	set_reg_jpeg(context, dec_addr_mode, COND0, TYPE0, 0, idx);
>> +	set_reg_jpeg(context, dec_y_gfx10_tiling_surface, COND0, TYPE0,
>>   			0, idx);
>> -	set_reg_jpeg(context, vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE, COND0, TYPE0,
>> +	set_reg_jpeg(context, dec_uv_gfx10_tiling_surface, COND0, TYPE0,
>>   			0, idx);
>>   
>>   	/* set UVD_LMI_JPEG_WRITE_64BIT_BAR_LOW/HIGH based on target buffer address */
>> -	set_reg_jpeg(context, vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH, COND0, TYPE0,
>> +	set_reg_jpeg(context, lmi_jpeg_write_64bit_bar_high, COND0, TYPE0,
>>   			(addr >> 32), idx);
>> -	set_reg_jpeg(context, vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW, COND0, TYPE0,
>> +	set_reg_jpeg(context, lmi_jpeg_write_64bit_bar_low, COND0, TYPE0,
>>   			addr, idx);
>>   
>>   	/* set output buffer data address */
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 0, idx);
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0, JPEG_DEC_LUMA_OFFSET,
>> -			idx);
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 1, idx);
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
>> +	if (jpeg_luma_base0_0) {
>> +		set_reg_jpeg(context, jpeg_luma_base0_0, COND0, TYPE0,
>> +			JPEG_DEC_LUMA_OFFSET, idx);
>> +		set_reg_jpeg(context, jpeg_chroma_base0_0, COND0, TYPE0,
>>   			JPEG_DEC_CHROMA_OFFSET, idx);
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_TIER_CNTL2, COND0, 0, 0, idx);
>> +	} else {
>> +		set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 0, idx);
>> +		set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
>> +			JPEG_DEC_LUMA_OFFSET, idx);
>> +		set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 1, idx);
>> +		set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
>> +			JPEG_DEC_CHROMA_OFFSET, idx);
>> +	}
>> +	set_reg_jpeg(context, jpeg_tier_cntl2, COND0, 0, 0, idx);
>>   
>>   	/* set output buffer read pointer */
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_OUTBUF_RPTR, COND0, TYPE0, 0, idx);
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_OUTBUF_CNTL, COND0, TYPE0,
>> +	set_reg_jpeg(context, jpeg_outbuf_rptr, COND0, TYPE0, 0, idx);
>> +	set_reg_jpeg(context, jpeg_outbuf_cntl, COND0, TYPE0,
>>   				((0x00001587 & (~0x00000180L)) | (0x1 << 0x7) | (0x1 << 0x6)),
>>   				 idx);
>>   
>>   	/* enable error interrupts */
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_INT_EN, COND0, TYPE0, 0xFFFFFFFE, idx);
>> +	set_reg_jpeg(context, jpeg_int_en, COND0, TYPE0, 0xFFFFFFFE, idx);
>>   
>>   	/* start engine command */
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_CNTL, COND0, TYPE0, 0xE, idx);
>> +	set_reg_jpeg(context, jpeg_cntl, COND0, TYPE0, 0xE, idx);
>>   
>>   	/* wait for job completion, wait for job JBSI fetch done */
>> -	set_reg_jpeg(context, vcnipUVD_JRBC_IB_REF_DATA, COND0, TYPE0,
>> +	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0,
>>   			(JPEG_DEC_BSD_SIZE >> 2), idx);
>> -	set_reg_jpeg(context, vcnipUVD_JRBC_IB_COND_RD_TIMER, COND0, TYPE0,
>> +	set_reg_jpeg(context, jrbc_ib_cond_rd_timer, COND0, TYPE0,
>>   			0x01400200, idx);
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_RB_RPTR, COND3, TYPE3, 0xFFFFFFFF, idx);
>> +	set_reg_jpeg(context, jpeg_rb_rptr, COND3, TYPE3, 0xFFFFFFFF, idx);
>>   
>>   	/* wait for job jpeg outbuf idle */
>> -	set_reg_jpeg(context, vcnipUVD_JRBC_IB_REF_DATA, COND0, TYPE0, 0xFFFFFFFF,
>> +	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, 0xFFFFFFFF,
>>   			idx);
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_OUTBUF_WPTR, COND3, TYPE3, 0x00000001,
>> +	set_reg_jpeg(context, jpeg_outbuf_wptr, COND3, TYPE3, 0x00000001,
>>   			idx);
>>   
>>   	/* stop engine */
>> -	set_reg_jpeg(context, vcnipUVD_JPEG_CNTL, COND0, TYPE0, 0x4, idx);
>> +	set_reg_jpeg(context, jpeg_cntl, COND0, TYPE0, 0x4, idx);
>>   }
>>   
>>   static void
>> -- 
>> 2.25.1
>>
