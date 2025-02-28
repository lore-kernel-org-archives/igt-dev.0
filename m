Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACC3C19F32
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 03:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A5710E125;
	Fri, 28 Feb 2025 03:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yxcQ9QXX";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2051E10E125
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 03:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFYczBeG5p+93A78JflwAPGN7a9AwqccQxBp2v7KPM7sje672rbxik7Hg3+0G0Fr/ossUVbaucdVBfiwrjL4bfQ7LK5x154IDGsZbzjVe6njRAITf1kZzMjWnGhBtHylOc3FfXJhFt3IUaWorowFLbyQFXlC8zCntcJbhHuzNfQ0htm+gVl/uyi+QM8/S39OhrX0tI1FBACvJQMVlsVbEywFAubrPfJLeqxqqh5lXuMXRqFuQIg32EhT7Ubpg1D7O0qvdp1vmxlbBLCvH5G5ks8lwlCMLNWGPDkye3JcrpLfRk9iDIdEXBCRlXOhuP+jpDqXkjqM3pfT4lSHifj/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQfKtZuvjM7q1Mh4GQyiXyfqiJXSIxNkCIjzATUzgPk=;
 b=SDDTha7vSboVsp9eCqTiyJzGP8GWXnlS4FZF4f71k/1Ut+Qs79fD/SE8l/I/eiPNahIA3oWqdFGJY6ZONQATaokQFgyo8IVY4XW+w5vaKoRtuKba8ISx9jWGBn1ZxwhH+TzmoU3Rjj1dkbDcDRPsBTNUJxZWrzkpwcPf5GcFRQwpAuwblYZyxxFyHWbFYzMRXBGK/sFKlpxxi9Az8/+jlAFjaym1T+ZNVNgWJDbVbxSCfrPtPgCmTtAPzTr9MaPJumtD05HMn3Xx10axg4TAQJtENATlAcF5xr+9HhBoMBl9j9VrGSKr0DN8mmnK7dn2u7ezOIoS2G5/Cbe71eku2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQfKtZuvjM7q1Mh4GQyiXyfqiJXSIxNkCIjzATUzgPk=;
 b=yxcQ9QXXBvcf381eoJjwmKkVQb71gqzRY5z/UCj30Odac16Qu0nrJzBTAT6LO7MKMaEbvxk7CkZiPp5euVED8rRVnBLC2aPMCPYDXIHWCFN95N/zVQtyh/H35oN5CwHo+q0WFg8Bgi/hJbqTaflr2G8ovR5qEeypJSPFE8BMFCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by BY5PR12MB4323.namprd12.prod.outlook.com (2603:10b6:a03:211::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 03:01:48 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 03:01:48 +0000
Message-ID: <307a34b8-5c94-48fd-9abc-7103a88bbecb@amd.com>
Date: Thu, 27 Feb 2025 22:01:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amd: add memleak functions
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 "Strawbridge, Michael" <Michael.Strawbridge@amd.com>
References: <20250218114341.122653-1-vitaly.prosyak@amd.com>
 <20250219104149.npgbvmtr5vikkkhr@kamilkon-desk.igk.intel.com>
 <93281b6c-1ae1-426e-aae7-46974d355532@amd.com>
 <20250226090958.32igx6wiy4svxw3h@zkempczy-mobl2>
 <9c5d27e4-12b2-4597-97cd-da72bc07d1dc@linux.intel.com>
 <20250226100926.2qkfqmrm4e5qsunb@zkempczy-mobl2>
 <1ec35fc8-92a5-4e69-a562-142745f59659@linux.intel.com>
 <2a494d9e-d771-4bd6-b328-517b7cc7dc50@amd.com>
 <dc46ac89-04da-49eb-be06-ce700d9c780e@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <dc46ac89-04da-49eb-be06-ce700d9c780e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|BY5PR12MB4323:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ded530c-4a1a-48ab-997b-08dd57a43e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bC9NVTZUQjU1cWRxRC9BWWl2TXVhNStXVlU1bzg1N1JMYWZWQnZoQThUZStw?=
 =?utf-8?B?b2g5bVg1YU45RklvN0RhRWtGYVZCTjg4RXA5ZkhWZ1NiRDZRRFpUbGUyL3JI?=
 =?utf-8?B?c1I2U0RvaUZocGRITmZxSTlBcVI0bUFQdDFpVEJ1N3h2RnBSQ2thQVRLU0ps?=
 =?utf-8?B?SWxWREQrTkhocktIZlNKRVVac0FxbzlhakJ5SWJZR09oeGFzYWdPSVVkVVVD?=
 =?utf-8?B?dHlCMnB5TWRmYVY4NGt0T1ZFS08weXJkRVdvV0NRZ0crckIvUmtaenRObHZ5?=
 =?utf-8?B?S0t4NjdWVkNlRnZydVFmenRoWVJYK3lqTkdzelpxZlZaRnBYWEV1T2FpYWtE?=
 =?utf-8?B?UVB2K3c0SDU1QnJxMnJvNWR2ZjcrWEpST2UyN2ozYVNPMGpMN1BTbjl0TCtD?=
 =?utf-8?B?RW9iTnV0Tzc5SCtiZDNoQ1BPLzVCcFlhN3ZKSjVjUlMrUzZEclRLQ1NnbXI2?=
 =?utf-8?B?OVZQQ2hkZzI5d0IxclpVTGtweHVJMjhSZzFQRzR6RnZYY2FtN3F1allwSFFt?=
 =?utf-8?B?UEkwT0gvbVpySjRNZEF2RVY4WklHdVdqRDlmUWRyekozVTZOR0lpQXNuQnAz?=
 =?utf-8?B?bGgwaTBVK1hRTnp3SnBDYTBKN3NiVkdFSVJUUHM0ZDAza2dZZHBRM2QwVDJv?=
 =?utf-8?B?Sjd5ZVkwWC9HMCtwa1ptbFFxMDJONzhNYURJeldVZjgwZXNmdm1KRGNHM0o5?=
 =?utf-8?B?U2xUTmQ3VnB4ZkVQTTBUT2FhQU5iNDY2Y1F2NUZleXNJVTBPMldxVHdhcHlX?=
 =?utf-8?B?dWMwendOVFR6bE1aVThVNlUwbVN4WDNEQ1lMOTNBWHoxdmZSZEdkd0duYzgz?=
 =?utf-8?B?T21CaGkyMUdscW5KWGg3cDdQTy9KUEpWYllQOUZPMEdETnlsV0U0aEZYcm1n?=
 =?utf-8?B?TGlMbHVxS3BSQ2tuTzZ5M0FqUXpaN0s4RDZPdFlMbnV5UjNTQVRST291Y1Ft?=
 =?utf-8?B?UmFyLzFKT0YveTBTMlFDQ0dWa3Z2L2lod3dCNE1LQWxoTEo0L2FHWUl1QzhZ?=
 =?utf-8?B?SEdDUjdQY0kza1dFeUFuZE4yRzkyeFRadkRVMytCY0tRT2R5TkE3U2crdUdL?=
 =?utf-8?B?SndDREtteTZ4QjFhZ0FjZEIwVmI4VG1ncGRZb2l3alc4dlQ4cnVDcmRSbzFB?=
 =?utf-8?B?a2NrbU1jRmZvOS9WTW1aQkxwMzhraTdTeGE0eUwxQWFaeXYvb3d2UitJY08v?=
 =?utf-8?B?UEMrRlVhdGdEMjZBNEFJNlJRbUM3REw5M1VCTFNyWCtNZkY0MGFuRzdNY0J0?=
 =?utf-8?B?RVRKY2F5ZGhDaFVQc2piZnVZbjVQUlRyNXdPMEVwR0dsK21YVUYvVzlaaDBP?=
 =?utf-8?B?YjZSbG9xenBTVXNhNE1Xd24vNWEvTDNUL3VKKzh3NXJkOWZSM0FxdmRETnBr?=
 =?utf-8?B?MzNnVHJUaDRDTTVLV2M2SWI2aTZydE15QUU0MThFN1JxbzJacDlPbGVMSVZo?=
 =?utf-8?B?UGYwSXA1UEFoazRPNXo3SW5kVXY5aG1Cd2NZL0RYVXBET3l6T1IxZmRENFds?=
 =?utf-8?B?Sk1CTmczbndQcEhoa2d3Uy8xRkc3eThsR1BJTTZiQ0lKdXBXUElDamk4bHIr?=
 =?utf-8?B?UTkzT2R0OEVzZ0ZaL0pHMG5LNWRkcWlTUjdTWlB1NUtmZTBneFowUGlXallK?=
 =?utf-8?B?RHNtNUtzeTBxN045UUpxaTJYZSswcThBR0c2eGdvSDJlcmNhd2lFZitWVkt4?=
 =?utf-8?B?YTFzV1hSbThFT1BtWVpYMmVsZGYvbFdLUjY3RDF0VXRqaDdXQ1lsSkMzbGRR?=
 =?utf-8?B?d2ZlNlQ0ejRXTlZFWWdUc29BeFlBZ2JjUW0yRVlqa3dIZmdudjk0MGtNU1ZY?=
 =?utf-8?B?YVRYb2JPUG5Vci81SWovQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0VPV2RmTU5KRHAyUkZpSHRDb3ZLYi9VYkNHRTZaK0RQaW0vWE5hekFaMFJH?=
 =?utf-8?B?YzlEVGFncjZQREc3SlM3cGRFenRQdURrRGpyYTJUaUg5S205MjJzcHVnZitZ?=
 =?utf-8?B?SmxFUVdqbWhoc0pqVGU2OVE3ZXdzY1ZpMjY1QzJXME1kRDB0ekVSSE43MUpU?=
 =?utf-8?B?UHF3UzhHZ0hXQzUvVmRaOXpicUxHaW5aNHRpeUpvNEFSMXRoa0s4ZkVXV3lk?=
 =?utf-8?B?b25hdy81TFdqY0FvTCtYOWZjNE9ueloyNTFsU2pzNW92dXN5bEk5bW4zeHdI?=
 =?utf-8?B?MFgxS3BCalc1TzhLR2d5YU1hdm1GVmE4MGdKZmRCaThBa2FiWkxHTHBLNFBH?=
 =?utf-8?B?MkVjYitUd2RvMmNNbWNyb2tUOGFkU1Z2K3pvc2tXQlFCb3h1dm5ha2crR0lh?=
 =?utf-8?B?U3JmK3ExamtrT2RKemhpc1h3TnNWQjFVQm4zNk9PUWZmclg5ZnZsY0pVR2Fs?=
 =?utf-8?B?cDRGTVFla2FlWGFvWjlzQjI1azlQNVFMc3V1Ris5LzJNbmxaWGdHdjY0VVI5?=
 =?utf-8?B?VjhucEtacHU0d2hucDc3a2YycnN6dklRY3RVZStHSXV0dW9iZExpTXNZeFJr?=
 =?utf-8?B?WEJUTjJCYWpkWWgrWU9CbFNWcDJIdkYwZ0dFbzd1VXlwTDUrT2xCL2Z1bTBm?=
 =?utf-8?B?SzhWSjhNTTZmaWVDdzh4bWRDYjRkUHIrSTRZOHRMNGZhOHdGMEZ5UGhsNVFq?=
 =?utf-8?B?S25wK0VjQ0diWDI0cTNZbEN4NytGS29uZG52TzRqeS8rbll1Sk1hSUJlVHFN?=
 =?utf-8?B?aHNHcGM1NWw0RTRvWUxZY0JUTzhyS2RkQ2lvdndVOVVyZTFRbk5RdWx0aTZN?=
 =?utf-8?B?YUZKeTh1ckI5YS9oOEpxRkk2UCtwNTdrYTNQaU11aWxiNU5YQWpZY3YxLzhG?=
 =?utf-8?B?MEYweTVmalo2eUQ3TSt1SGxBMjE1dE9WVXBYWUc0WVpUK1ppOWc1Y05OU2hn?=
 =?utf-8?B?dWRUMFpJMnI3OUFUcGo2T1ArM280OG1GdWpWMitrM2ovVGtoSElMNFF5dEdG?=
 =?utf-8?B?SVZLVFFGQ2pNU1FXMVdMd2gzVFM2NU9JQTcvTVV3bk12ZVlCQWNKb3RSeTlD?=
 =?utf-8?B?QzNUdVc0L1ZTOXZLNVFzenBYaTQ0Nkw2Y2FlSzUxTzhnRWlib3VockVLNWE5?=
 =?utf-8?B?OHREZzl6WE4wckltV09qVVI5Y1FpdDJGblpJS2FnWXJpQ0p6Zmk3NlhGcWhj?=
 =?utf-8?B?d2tYWm1reHcyczB4ZHhVWXNzWkxXcXdlU2JERFBtendyNVY3Z1dqMk9veDRP?=
 =?utf-8?B?RWVGMGNDQ1NVM1F3RlUxMWs4aTNyNjVKbDhNU1BWd3pMVk44c1FEUGIycnpQ?=
 =?utf-8?B?MDZ5WmoySDNuTGcweEU1U2EzV1VnZkZWM2REVEo2VjhKMFBEbUw5T0E1T01K?=
 =?utf-8?B?QmRmc0FXcXNBbUp4THVWMW9Yb0JndnNlKzRzdVpSeUluSHlqbkRKZndiSks3?=
 =?utf-8?B?K09VT2h1NzZRNDl1Y3c4clZ4ZFZVS3RDZmJobkFnVDRiQlYyQnJWcmVnWmho?=
 =?utf-8?B?LzJ4U01YK1M0MFpKNklWUU9UZGpaOWl2Z21GbGNJYzFUYmd0NXJ5a1dNMEZl?=
 =?utf-8?B?VTZ1WTRRVWZZV29zN1FmSXdwZVNpQm9HNVZkOEVTdTJuR3Bnc3d0SEdsZ0NL?=
 =?utf-8?B?czdWS01CNFZhRUVXcWNudnl1MFA4WHBzSXBmRmVJV1ZzWjlPTXNGcHBJMkdk?=
 =?utf-8?B?MDFUT1M1V1VzV3NLUVo4NWpMcjNsTFBzaGpmMExmU1ZHSjJ5emp5TytEUTZm?=
 =?utf-8?B?UEI0ZEt0TGJKTjRVdWtxVFpnczhZWE9YOUlwbEVndHVoMzJHZzVuWllDS1VJ?=
 =?utf-8?B?ODZ1Q29uVVB3dE5wcndMZmo4U2d0c0NNZmViWFllZDFwS3FTU3VDTUVDMUhj?=
 =?utf-8?B?WXVtZ2hJb1YweUhhK0pNL2hHZW4zMmVHUSsrbEdLQkJvR1VRdVNMTVVwN0lD?=
 =?utf-8?B?aUJFWlV2RS9xYzlkdWNMNmkzSXV5M01RWHdVK1B2UytnbVBIRWlwenBSSVdK?=
 =?utf-8?B?cTFmSmJEcWJQdXR0U1AvUjdra3hBY2g5TFlHREdsWXdPY1A1RlBCVHhmeEpV?=
 =?utf-8?B?U0thaENWMi9OWURVUEVhcUJTUmNmRzFSYWZTU3pWQnJIamRXZXQ3Ty9mYmZJ?=
 =?utf-8?Q?rEoxkyaeUHw+IKOsejVGibmHT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ded530c-4a1a-48ab-997b-08dd57a43e1a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 03:01:48.6595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMvkOKfzs9+gOxoX/MTtbIpqSH70H76IlD5vGqRivnskXeW072i/bQVA7Njk+DdcGFMxS7Svwmc8TF8GZ0YWtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4323
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


On 2025-02-27 04:08, Peter Senna Tschudin wrote:
>
> On 27.02.2025 06:08, vitaly prosyak wrote:
> [...]
>
> Hi Vataly,
>
> Thank you for your message.
>
>> Hi Peter,
>>
>> Thanks for the update! I really appreciate the effort you’ve put into making the approach more global and vendor-agnostic—great work!
>>
>> It would be incredibly useful to have both --kmemleak options available (for the entire test list and individual tests).
>>
>> Could you kindly provide guidance on how to add these options (-konce or -keach) to igt-runner? For example, how should I modify the following commands to include them?
> The kmemleak patch has not been merged yet. If you'd like to try it before it
> gets merged, you can find the patches here:
>
> https://patchwork.freedesktop.org/series/143996/
>
> Regarding the kmemleak integration, I apologize for any confusion in the
> discussion. The intended usage is as follows:
>  - Create a test list that includes only the tests you want kmemleak to
>    scan.
>  - Pass the -keach option to igt_runner.
>
>> sudo ./scripts/run-tests.sh -t -v /home/vprosyak/src/igt-gpu-tools/build/tests/amd/amd_basic
> I'm assuming this script calls igt_runner. If so, please add -keach as an
> additional command-line argument to igt_runner.
>
> Once the patch is merged, this will enable igt_runner to generate a file
> named kmemleak.txt in the results directory. The file will include entries
> like:
>
>  "kmemleaks found after running test@name"
>
> to separate different scans within the same file.
>
> Additionally, you can modify your test list to include only the tests you
> want kmemleak to scan. This is where I unintentionally added noise to
> the discussion.
>
> Since you can create a custom test list and use it with -keach, there is
> no need to extend the kmemleak library to support a separate test list.
>
>> or
>>
>> sudo ./scripts/run-tests.sh -v -T /home/infra/igt/custom.testlist  
>>
>> Thanks again for your great work and support!
> Happy to help, let me know if you need anything else!


Hi Peter,

Thanks a lot for your patches! I applied them and validated everything locally—everything works exactly as you described.
To further verify, I also tested by running igt-runner directly with:

gdb --args /home/vprosyak/src/igt-gpu-tools/build/runner/igt_runner -o -s "$RESULTS" $VERBOSE $FILTER --prune-mode "$PRUNE_MODE" -keach

This allowed me to step through the code and confirm everything in detail.

Thanks again for your great work! Once your patch is merged, we'll proceed with testing it in our CI.

Vitaly

>
> Peter
>
>> Vitaly
>>> [...]
