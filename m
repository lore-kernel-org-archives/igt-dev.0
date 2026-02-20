Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7AEC531F8
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 01:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2468510E762;
	Fri, 20 Feb 2026 01:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="urGz6oBZ";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010035.outbound.protection.outlook.com
 [52.101.193.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382E010E762
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 01:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZESyCSlKoeZ8PNUjNRkpiuXOzrhaU4Zyffrt+4Kib/AVHMXjDaZ4Z6IY43Eb0GVqhxVTFlARxvQj6DHZD+/PcQdcVeH7QD424Ksgj1b5vBeTy3UvyjLyw2MTEDJDi3bSB2zONh3Wll5z+j0/QvIHszE8qW4OIaBuDY/IhUCyLP+j8RYaiFwc/kE1b3X5IUsy42qYAOYsCeCgV9vur1ehMNNTXBzABxSJpiifNDp79KZv3TsplrfvkcGA7TUiTt6hnk8wuoNvfJkZK2VgaINSMXnno03hA4dVXnSNOtjwQu+Sk1i8ZL2geuIH01CqD+n8fkNsGToq72LxyWQn2zgJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JctgWuIlOreTIbB/sgLBmlOX4c8+poEotNpKwuCctlE=;
 b=NlniC3/mUMLC9JRIWQ6sZzeLghg1oMSxsLUrft71pnMLCx09H9jo+E14JQKbwXmH2vfoRpK3I7Xg3B5wCAMjd9LWQxvhyFTKnxa7DzgN5DeopJFTVEMP4GRqXxSMAliY2C4gkuPAC9ghfWTsxwLbsYCfx6WJo5Kv1U+QhuochToC3SUAxbTIMQQNuiEs8CbKjb9ChEMqjJS29bOf6cXCxMBPzWozQWx9aNVu+O/HIj5H0QKGxgZXx9ZYM3KuU4iancoYXQITOX3cxTllJ0NgcDAye0FgOf86pE+eyzB5U91iRXeNvlDO7EwnssfRCa2aiiXocAmnifGqVzTGlgXKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JctgWuIlOreTIbB/sgLBmlOX4c8+poEotNpKwuCctlE=;
 b=urGz6oBZJN9w0Xd0qJGp6CsI3HxdvZ4YYCPMrkl/eprEUXMS7nX5NGAbY0/kD+IohEOWsLBnEcm8v/HCb0db+28uT6equsE4XFwuy+1zp6i9jU4K9kzungZLdbpeXoCRW9jBRhf8pJngeVRRW3K0UdVItLx68jU7dZNqMzwP7Y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CYYPR12MB8940.namprd12.prod.outlook.com (2603:10b6:930:bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 01:55:15 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 01:55:14 +0000
Message-ID: <f758946a-bbbc-4d9c-8e3e-a8b110b21269@amd.com>
Date: Thu, 19 Feb 2026 20:55:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] tests/amdgpu: add fence wait multi packet
 test
To: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>,
 igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com
References: <20260219171209.2296-1-yogesh.mohanmarimuthu@amd.com>
 <20260219171209.2296-2-yogesh.mohanmarimuthu@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260219171209.2296-2-yogesh.mohanmarimuthu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::22) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CYYPR12MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: 05296236-47ef-4258-f1f1-08de702316d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDlodDlVc1VycVltV3VQUVpaWE5leFBYL2ZmVUs1ejBGdVdscjk2bEZsQnhG?=
 =?utf-8?B?TXM4MTNVKzZCLzJnd29YMVpRV3p5S3B4TUpFNlZsTTNkVGFRMW1ZVGNaVGVZ?=
 =?utf-8?B?ZlBlU0VIN2NuTDFNNHdrb2U0c25tcWJCbGRpSkQ3NmNieno2SWUzUWJENjFZ?=
 =?utf-8?B?SHdGVVJTcXlVOE1MVjBDSGUrb1c0Q00wL2FzcExwS3dvWkFjTWJPNDNaa3RM?=
 =?utf-8?B?K0VwMkFqSTgvVk9JK1IyUzI4dkRId3NtN21tRVViUzZEVi9KTHpLd2poYnU4?=
 =?utf-8?B?cG80d0xtNC9nd3lUcUpBRUhIN0cvcS9RdlJJTUZ6OU81MDNWZVRUNnd1VTBN?=
 =?utf-8?B?TUtMYkZENFYwNnQxK1R1aTM4YUcyQlp5RFBjR1dSTEdLcUV2cStFd0RyVFA3?=
 =?utf-8?B?S0pESExnRS91VjFDZGlES3djMURpcTBzTm5VODVSbTdHeVhrOUxMbFZSaE92?=
 =?utf-8?B?SW9oZkRPSFdZSDg4MFdoQUZTbzFteWFoc1JyOHpwYlRVb2VLaFRvNUZyMDhS?=
 =?utf-8?B?eVhTQkZHNDA2UTJvL0ZtUlI4TkJ3SCtlL0tyamdxSWF3YlZhNDRLY29QSFNX?=
 =?utf-8?B?M0NZeDFLWFdyT3dJendQZ0lRRWlnVk1pekJ5aXJMT0F0SkNlUkxvdURjaFRp?=
 =?utf-8?B?UCtIN0lTdklYMk5lcjRlWjFWejFNcUVKb3dFbHRPZjhSVVNwRWRQdEtyTCtE?=
 =?utf-8?B?NnhncTVKQzFYT0dGam9sQTdXR09NK1BhSkZobXB3WXVRRDJJUGozUU1hcmF3?=
 =?utf-8?B?a1F0aElHVUh4RHZmTFBadWVWOUZGSUNvckxYWGp3L1AwZEVZcEJwZHE0b1Ny?=
 =?utf-8?B?cWRyWmkzSXZzNmtHcjJGM1Bjb3dEbVhGRzR5ZXlWSitzeWROaUVKUlMxYjdu?=
 =?utf-8?B?NXY0ZkdFSG41RkNqNFFjOXZ0ZjNmQ3BnM2xnaWpqbmxhYmIrZ1NKMmNsZFZv?=
 =?utf-8?B?QTMxZmdVOWFNcHZSK1dmdFo3WThwcEV4bWQ4aVpBOFNjSFE2anVCZU5CQjZY?=
 =?utf-8?B?VGk0WE1xMzVYN3pHU1VvRm1CU2h2clErWVRMbHNoY1VNdTRZRWk1S29UMGlK?=
 =?utf-8?B?UGVnSGNKdG9vdUpQaDdZbTU5TER1N2tnSk00ZWFGa0FHNHR0dWZyaDhWUU1N?=
 =?utf-8?B?NVUxWERXT3dtbGF3OEd3MlR3QWhhV3hDbGNNeFYzTUlXUmxjUWlHd0ZSQVJr?=
 =?utf-8?B?VzRrRUI5djkwazcwT1M3cUZuWE5zbXBqb0lKdDZyaUtSMXZmS2tCWjNSM2c0?=
 =?utf-8?B?VDN6VUF4eXBWcDVTeFVaVFBodWlHaUhqVTNDV2JWdXErVlJ3dzZteVlqcjlS?=
 =?utf-8?B?WHJuMURDc0FoRmpWM1BsWU1KQ1BLdkVZVEpDNXo2YlkyR1BidE5FNnQ4VDF0?=
 =?utf-8?B?Q3dlc2lNRjAvQUJFb2Z0WFJDdkV6NE9VK09SNHVGTmltMGF0c3FTd0p0aVJr?=
 =?utf-8?B?bVN4dnVPcVB2T1AwNjhWVGFXMktEUkJFNCtRK0tES0dyTkpHT0FESHlkOUdq?=
 =?utf-8?B?RWFORkVIS01LbmtoQkRKbXFmSVFkY1lGUktzRE5NYnRsWTRRd1hHTmdZNlR3?=
 =?utf-8?B?OEdWdEpLNHhGVEZEUEsyd3EvbzZVUnNhY2lRVkFtcVAwaU10MkdBcjR6VFdq?=
 =?utf-8?B?TURVYUpic0RPdkFyampURW9mTHhHSFprV2FjR0J6cFJFK3NjWGZuVnc0NVdY?=
 =?utf-8?B?ZXdEVDkwNFpRTUZIdVhXaFpxRkplNWVJbEcyN2MvNk9FclNMaFdXSWRwMysr?=
 =?utf-8?B?RVM1N0FuK0Rpb1RzeG5IZzc3bVhVWHQraW5SeFl2U3pBeVB2ai94VU9JdVo1?=
 =?utf-8?B?KzVUTjU2amJmQUtGVm1QWkllckJRUWk2RGJqdGJaZ0l1V1dDVlRXS1h5QXdu?=
 =?utf-8?B?bGRBZlVRdWpFWWlXZnhjck5xQTdsTE1xZEd0Njc3cjMzbXk5NllwcjJCdGRz?=
 =?utf-8?B?ZlF2ZzNZczhyM1dxWUdwQ2RZcUZZQUh2NHc5dC9SV0VDTjlrZmswUzFBcnh5?=
 =?utf-8?B?dXdGTW9TS2hqMjM4V0FyN05XV1RRbWRVeENrM1JpK29peDJuc3pUY3pFOGpi?=
 =?utf-8?B?bWUyTHlhdWI0YldUbEFkS2NodVFoRTBjMVZnemExdFJKaHI5eWx4V1JGdTVx?=
 =?utf-8?Q?SCjA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE1nR0RQS1pXN01mVmxhKzdIaGxacVdyVEhuQmZJc2NoMGJDMVZ0Rml5Q1Aw?=
 =?utf-8?B?QlgwR09tZFpEYU40KzFuT2VnR2h3MkcrZzIya1dOZEdPTXQ2cjVoZGM5aGlo?=
 =?utf-8?B?Q0hsbU1SNWRMR2pmYXcwQ2FEM1k1U2FLVEVwMzdFVUQxKzRjTFYyWXFSbUJk?=
 =?utf-8?B?Z0hrYi9Tb2UvR0JaaFNSNDBxSXIxZXdBbGlQN2tUSmJneDFUM0IwbGgvQW5a?=
 =?utf-8?B?QS9aWUdLaFVwRDV0VmVQZkl0dmFudmE2MU9FRkw3RTE4aDg2eGZMRVFCSS9v?=
 =?utf-8?B?Q3hmclo1UFZPdUNxcjRlSHpEeDdhd250bWozWndOL1J1Ym93KzRxdzMvbzdL?=
 =?utf-8?B?RXZrK2RySU0yMEkyUnhZblNnREhjeXRHd2JQcGNGUUZ4UXM2R0xwa3hNZktJ?=
 =?utf-8?B?WHdTdXdiTy9yRC9LaEwvSFRRWWRHank1WGNPeUJjUEcxelZUSzNrdk1QQnZ2?=
 =?utf-8?B?Q3FuSGhabmRVd09La3ZNNjJwOGg1aWpBZFdJVlNQVDhxdEFyNGxha3QzakQ3?=
 =?utf-8?B?c2kvZ0IvYWlOekdvYTBVb01lTTM4dmY2V0x6WWVBNm1SMjgwL0NONG4vaGZW?=
 =?utf-8?B?cy9waWxuYTMzcnJEU1pINW0yOVR0SjVHVkN2ZTlvSURMZUplSGZuM0lGRTJW?=
 =?utf-8?B?eHl3WnJENERBQ3ZxTDhUdTVuMEdscnp2NndPODVuNkxQa1dTWEprK3UrRXpi?=
 =?utf-8?B?UHZ5aC9Wb05LdUgvd1dWMHdscXZjUC9WVUtHbHJnOVNPeUpOYWhYRnpXR3Rh?=
 =?utf-8?B?RDc3eGFWek5lSmt2QkQ4clNhZnlTc3dnTW5OdzJ1dE1IVktRZ3RaNnVvVkEy?=
 =?utf-8?B?N2RxbWprS3VOWHVsYUVrMXZxaWIyUWdWQTUxZTFrdGZ0NXdLUWdIK2Npamtx?=
 =?utf-8?B?MWdiSWFmR001Ulo2U0UvOWJVMFdMQ2NVVmNQZ1J3cnVBMCthTUgzTHVnb0JT?=
 =?utf-8?B?YUJIVFlWcWZrV3g2Wng4OCtpQlVqK2hkMDdDWGtQTzRYWmNBMC9xR01yeE1v?=
 =?utf-8?B?T2RGTE94c2dtQTUzQUhCb05raUkrUmxnVk1ZcC8vbzBCNW1pRGtQTU0wQlds?=
 =?utf-8?B?a0lZdlc2L2lYd2FtK3AyOWN0bDExZlJ2RE1IZXRzQ25NZGNzMllzVUNxZU9x?=
 =?utf-8?B?M1JXd1BOS2oyVXQveSs5ZEdaVWNsdlB6QmkxcUZQUy92aGRObFF1aVBQanFU?=
 =?utf-8?B?R3YyVWVEUjlZRHBPVldTZ01rQVJ2QjFsZGNKc2haOTFyTkJrUk5CUmYraXNh?=
 =?utf-8?B?NHpOQmM5L1doUUNoTWpDak51Zzg2NzMzbVJ4WVNYemRBeFg5elBMQ0cxaFdV?=
 =?utf-8?B?STBVNGNPOUpFeDFuM2VFRXhtQjRHQjJXMVEvdE0wdE1icjczYVZWbUVBcHhL?=
 =?utf-8?B?TVBUWkF3aEcrRE40SDMrN05XQVdlZnRRak1nMjVyaHpsVzNVcmtwdURySjVP?=
 =?utf-8?B?SmRSbnNmVmFxa2prK2NJaC9tV1BDZWdaYlFNYjlLblJJTGlZZVd6eW5TOCtq?=
 =?utf-8?B?Tlovc1ovZFcyTUdDSDdGZnhGY0lkU0tOd2JkZk1XdmFQcXlUaTZMT2VxYitJ?=
 =?utf-8?B?eVZQWFBVUEVVaU5iRVRBeUJ2N0lwTXBZS0Y2cXo5Nlo1bVpPR3Y4VnVPVWhC?=
 =?utf-8?B?ZUo2c1FUMkR6RmNWb243c24yNVFoakhQZ2JPRkoza3VUellIc1c0eTFseENZ?=
 =?utf-8?B?Q1dMRVZJS2hyT0s0bDh1VllISkh0djNWUFFSY1FqYk9tR0luejZSZ3pnZG4y?=
 =?utf-8?B?SGVyVkVOZnJ6S0RHblhJOGt6cTNpOVNDTE1jbml2RzBnY1liYzhBc1VhcXU4?=
 =?utf-8?B?U2p4NS9HT0pHNkZ6NkY1MjNNTkt0Sk5oTXJuakg0MTZPQmFER3NKeElYSjJZ?=
 =?utf-8?B?aXlreCtUMGtpbTJVaEhFNVRMbFJjd0VlVXlZTlRERXprdy9UcDZyNlI4QzhR?=
 =?utf-8?B?OWpDYlk5VVhRaFRDNjFNM21KcVgyNEMyQ2NsMTVra3lsL0cwdnRqcHkxTmd1?=
 =?utf-8?B?MDZES2pjSFdPZWtCbUgybWQ4YURsM2FSTi8weEprWThSME1GdXRaUHZ0VGJI?=
 =?utf-8?B?WjVSb2xtbW83OWZIZWdLb3VqL0RSYU9yZ2RVS3BVNXNHb0JvWkJJVkdxVEx3?=
 =?utf-8?B?WEN4WW56bHR4R2h6bzBWOXNHcUtjR1JnVU1wMkdTUFVUb1ZKZTBCUmhPb0hX?=
 =?utf-8?B?dlJFbXo5NjZmK3ZxK3pyczhCVU9KQjFCdUpwNndIZjZUVC96RTg2eWdFcis4?=
 =?utf-8?B?ZTJaTTZDdUthd3hXSWI0ZkF2dUVIeWtzZmpPS2o2R2JtQjIwOW03V0lUVi8x?=
 =?utf-8?B?U05tVUhBOVRmNVVFYm1qVVdkVENva1pXb1U5cVA4NW9TajNRS0VGdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05296236-47ef-4258-f1f1-08de702316d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 01:55:14.5602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZZwcWnL71vp+Q6p11Ch4pjxrK1vN3f1LDvW8v05Etd8XxVNZTjZcIHy4ClrxgktTfm5Mjdvub+/5Axblh9klg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8940
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

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>


On 2026-02-19 12:12, Yogesh Mohan Marimuthu wrote:
> The test submits a job with FENCE_WAIT_MULTI packet that has 32 fences.
> The test passes if the WRITE_DATA packet after FENCE_WAIT_MULTI packet
> is executed and desired value is observed in result buffer.
>
> To check if FENCE_WAIT_MULTI packet is passing without checking any fence,
> a negative testing is done. This is done by having the 32 fences in
> FENCE_WAIT_MULTI packet not satisifed during initialization. Then check
> in a separate thread if desire value is observed in result buffer even if
> fences are not satisifed.
>
> v2: Declare all variables in begining of function (Vitaly)
>     use upper_32_bits lower_32_bits (Vitaly)
> v3: keep struct amdgpu_ring_context small.  (Vitaly)
>
> Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
> ---
>  tests/amdgpu/amd_basic.c | 196 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 196 insertions(+)
>
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index e57eb7969..d78a4f2c9 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -5,6 +5,7 @@
>   * Copyright 2023 Advanced Micro Devices, Inc.
>   */
>  
> +#include <pthread.h>
>  #include "lib/amdgpu/amd_memory.h"
>  #include "lib/amdgpu/amd_sdma.h"
>  #include "lib/amdgpu/amd_PM4.h"
> @@ -13,6 +14,8 @@
>  #include "lib/amdgpu/amd_gfx.h"
>  #include "lib/amdgpu/shaders/amd_shaders.h"
>  #include "lib/amdgpu/compute_utils/amd_dispatch.h"
> +#include "lib/amdgpu/amdgpu_asic_addr.h"
> +#include "ioctl_wrappers.h"
>  
>  #define BUFFER_SIZE (8 * 1024)
>  
> @@ -662,6 +665,183 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
>  	free(ring_context);
>  }
>  
> +static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
> +			    uint64_t timeout_ns, uint64_t check_interval_ns)
> +{
> +	struct timespec start, now, sleep_time;
> +	uint64_t elapsed_ns;
> +
> +	if (!ptr)
> +		return -EINVAL;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +
> +	if (check_interval_ns > 0) {
> +		sleep_time.tv_sec = check_interval_ns / 1000000000ULL;
> +		sleep_time.tv_nsec = check_interval_ns % 1000000000ULL;
> +	}
> +
> +	while (1) {
> +		/* Check current value */
> +		if (*ptr == expected)
> +			return 0;
> +
> +		/* Check timeout if specified */
> +		if (timeout_ns > 0) {
> +			clock_gettime(CLOCK_MONOTONIC, &now);
> +			elapsed_ns = (now.tv_sec - start.tv_sec) * 1000000000ULL +
> +				     (now.tv_nsec - start.tv_nsec);
> +
> +			if (elapsed_ns >= timeout_ns)
> +				return -ETIMEDOUT;
> +		}
> +
> +		/* Sleep if interval specified, otherwise tight loop */
> +		if (check_interval_ns > 0)
> +			nanosleep(&sleep_time, NULL);
> +		else
> +			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
> +	}
> +}
> +
> +static void* amdgpu_fwm_test_thread(void *data)
> +{
> +	struct amdgpu_ring_context *ring_context = data;
> +	uint64_t *job_start_write_data_ptr = (uint64_t*)ring_context->bo3_cpu;
> +	uint64_t *fwm_fence_ptr = (uint64_t*)ring_context->bo3_cpu + 1;
> +	int *ret = calloc(1, sizeof(int));
> +
> +	/* Poll to confirm if job has started. This is done to have low timeout for fences
> +	 * wrongly satsified check.
> +	 */
> +	*ret = wait_for_value64((uint64_t*)job_start_write_data_ptr, 0x1, 2 * 1000000, 1000);
> +	if (*ret)
> +		return ret;
> +
> +	/* Poll if job completed without fence satisfied */
> +	*ret = wait_for_value64((uint64_t*)ring_context->bo_cpu, 0xdeadbeef, 100 * 1000, 2000);
> +	if (*ret == 0) {
> +		*ret = -EINVAL;
> +		return ret;
> +	}
> +
> +	for (unsigned i = 0; i < 32; i++)
> +		fwm_fence_ptr[i] = i + 1;
> +
> +	*ret = 0;
> +	return ret;
> +}
> +
> +/**
> + * FWM PACKET TEST
> + * @param device_handle
> + * @param ip_type
> + */
> +static void amdgpu_fwm_test(amdgpu_device_handle device_handle, unsigned ip_type)
> +{
> +	struct amdgpu_ring_context *ring_context;
> +	struct amdgpu_cmd_base *cmd_base = get_cmd_base();
> +	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, ip_type);
> +	int r;
> +	unsigned int i;
> +	struct amdgpu_userq_params *userq_params;
> +	pthread_t fwm_test_thread;
> +	int *thread_ret;
> +
> +	ring_context = calloc(1, sizeof(struct amdgpu_ring_context));
> +	igt_assert(ring_context);
> +	if (ip_block->funcs->family_id == FAMILY_GFX1150)
> +		ring_context->max_num_fences_fwm = 4;
> +	else
> +		ring_context->max_num_fences_fwm = 32;
> +
> +	ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
> +
> +	/* Allocate bo for dma */
> +	ring_context->write_length = 1024;
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle , ring_context->write_length, 4096,
> +					 AMDGPU_GEM_DOMAIN_GTT, AMDGPU_GEM_CREATE_CPU_GTT_USWC,
> +					 AMDGPU_VM_MTYPE_UC, &ring_context->bo,
> +					 (void **)&ring_context->bo_cpu, &ring_context->bo_mc,
> +					 &ring_context->va_handle,
> +					 ring_context->timeline_syncobj_handle,
> +					 ++ring_context->point, true);
> +	igt_assert_eq(r, 0);
> +	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length);
> +
> +	/* Allocate bo2 for ib */
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle, 8192, 4096, AMDGPU_GEM_DOMAIN_GTT,
> +					 AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,
> +					 &ring_context->bo2, (void **)&ring_context->bo2_cpu,
> +					 &ring_context->bo_mc2, &ring_context->va_handle2,
> +					 ring_context->timeline_syncobj_handle,
> +					 ++ring_context->point, true);
> +	igt_assert_eq(r, 0);
> +	memset((void *)ring_context->bo2_cpu, 0, 8192);
> +
> +	/* Allocate bo3 for fence wait packet fences */
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle, 4096, 4096, AMDGPU_GEM_DOMAIN_GTT,
> +					 AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,
> +					 &ring_context->bo3, (void **)&ring_context->bo3_cpu,
> +					 &ring_context->bo_mc3, &ring_context->va_handle3,
> +					 ring_context->timeline_syncobj_handle,
> +					 ++ring_context->point, true);
> +	igt_assert_eq(r, 0);
> +	memset((void *)ring_context->bo3_cpu, 0, 4096);
> +
> +	/* wait for gtt mapping to complete */
> +	r = amdgpu_timeline_syncobj_wait(device_handle, ring_context->timeline_syncobj_handle,
> +					 ring_context->point);
> +	igt_assert_eq(r, 0);
> +
> +	/* assign cmd buffer for ring context */
> +	cmd_base->attach_buf(cmd_base, (void *)ring_context->bo2_cpu, 8192);
> +
> +	userq_params = (struct amdgpu_userq_params*)alloca(sizeof(struct amdgpu_userq_params) +
> +							   sizeof(struct drm_amdgpu_userq_fence_info) * 32);
> +	userq_params->fence_info = (struct drm_amdgpu_userq_fence_info*)(userq_params + 1);
> +
> +	ring_context->userq_params = userq_params;
> +	userq_params->job_start_write_data_va_addr = ring_context->bo_mc3;
> +	userq_params->job_start_write_data_val = 0x1;
> +	userq_params->num_fences = 32;
> +	for (i = 0; i < 32; i++) {
> +		userq_params->fence_info[i].va = ring_context->bo_mc3 + 8 + (i * 8);
> +		userq_params->fence_info[i].value = i + 1;
> +	}
> +
> +	cmd_base->emit(cmd_base, PACKET3(PACKET3_WRITE_DATA, 3));
> +	cmd_base->emit(cmd_base, WRITE_DATA_DST_SEL(5) | WR_CONFIRM |
> +		       WRITE_DATA_CACHE_POLICY(3));
> +	cmd_base->emit(cmd_base, lower_32_bits(ring_context->bo_mc));
> +	cmd_base->emit(cmd_base, upper_32_bits(ring_context->bo_mc));
> +	cmd_base->emit(cmd_base, 0xdeadbeef);
> +
> +	/* satisfy fence wait multi packet fences in separate thread for checking if fences
> +	 * gets satisifed incorrectly.
> +	 */
> +	pthread_create(&fwm_test_thread, NULL, amdgpu_fwm_test_thread, ring_context);
> +
> +	ring_context->pm4_dw = cmd_base->cdw;
> +	ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
> +				      ring_context->bo_mc2);
> +
> +	pthread_join(fwm_test_thread, (void **)&thread_ret);
> +	igt_assert_eq(*thread_ret, 0);
> +	igt_assert_eq_u32(*ring_context->bo_cpu, 0xdeadbeef);
> +
> +	free(thread_ret);
> +	ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
> +	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle,
> +				 ring_context->bo_mc, ring_context->write_length);
> +	amdgpu_bo_unmap_and_free(ring_context->bo2, ring_context->va_handle2,
> +				 ring_context->bo_mc2, 8192);
> +	amdgpu_bo_unmap_and_free(ring_context->bo3, ring_context->va_handle3,
> +				 ring_context->bo_mc3, 4096);
> +	free_cmd_base(cmd_base);
> +	free(ring_context);
> +}
> +
>  int igt_main()
>  {
>  	amdgpu_device_handle device;
> @@ -811,6 +991,22 @@ int igt_main()
>  		}
>  	}
>  
> +	igt_describe("Check-GFX-CS-FENCE_WAIT_MULTI-packet");
> +	igt_subtest_with_dynamic("cs-gfx-fwm-UMQ") {
> +		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("cs-gfx-fwm-umq")
> +				amdgpu_fwm_test(device, AMDGPU_HW_IP_GFX);
> +		}
> +	}
> +
> +	igt_describe("Check-COMPUTE-CS-FENCE_WAIT_MULTI-packet");
> +	igt_subtest_with_dynamic("cs-compute-fwm-UMQ") {
> +		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("cs-compute-fwm-umq")
> +				amdgpu_fwm_test(device, AMDGPU_HW_IP_COMPUTE);
> +		}
> +	}
> +
>  	igt_fixture() {
>  		amdgpu_device_deinitialize(device);
>  		drm_close_driver(fd);
