Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0558FD2ED11
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9737C10E565;
	Tue, 20 Jan 2026 04:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TQvG/NJ9";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010028.outbound.protection.outlook.com
 [52.101.193.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820F710E235
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:18:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cudo6FkIrADzxfagDKCCarEY7cNOIpAOb+dr6Mdc+WcT95FfOkG4C9a7g7vYCXQ/4muIAv+XKle3jLeGxtqKdFvzGZSrnDJ+/CGw7CGVkDVH81BxbqYjGeoLzYCSRQ1RN9YXdUwig/t7OkXCF1n8DdEcRrlkCUL0RC6n5YBlLv2RKZLesJnBHYg4GlVcymc7QVyXz4CoHhYF8NzkARQhQiU5cNq/T9wA6FTQOOlbof9p10IN7mYSKCMIem/vool4nq9MlXe7IUahceyz3dqZPDKBNIE9PijHZ3x1jIUsK8tZ0uK4lXgBaJvOEJZJX/DJXJqzAtLY26WT2l4uoap4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CnHEzXP2pi0tYgPz4Qu1+Q0y6h26e15u8p5zRGiEGk=;
 b=MqOiTzfupxvp3GBo5csvJfG4BvDtkyYEo9y43iiOZ2t6S3EM6rAUUNey+iFpNkXY3Y1I9MsrFGuBVLyYV7ROuTUtw14xG5rPwpgmLuhBUOA4L1rG4xkSIsmvLJq2K6GIrEt0bGEDAywsCxWls284iOJ1QGOHx84PELZ1krcP6FlyFgeJ2rUBv9ey9CZFbeX7OdY1BKC5Yhntq8ClGAvlrF3X7rSMLEKJJS9PjpX1E8Wf9yToOfFEyg7RvJmc7hJJCObwowbwo9wn1HO1DW+OrvRL82Rhabw3FfJqpO1VSbf0c2xbTKhzL+d4pt2+Uy77cK2tp8RYX25CpFttQw40nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CnHEzXP2pi0tYgPz4Qu1+Q0y6h26e15u8p5zRGiEGk=;
 b=TQvG/NJ99INEIi21B00M2q1TDVWWUTWMvLosYIzkV+dGETqgt3hkoiP0XsCCp53TaavblH8EK/7qb43jsvO7fkceZLBX15ocvDZyVsfT/AizmMxzHImxHQlkvzbekNsHxt7SNa8+q+8wMtjBJ46TDLuuWf6SiENk/fjYqxQuieg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS7PR12MB5960.namprd12.prod.outlook.com (2603:10b6:8:7f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 04:18:13 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 04:18:11 +0000
Message-ID: <126dc573-e29d-4982-9803-857763d6b343@amd.com>
Date: Mon, 19 Jan 2026 21:18:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>
References: <20260119224237.561000-1-alex.hung@amd.com>
 <DM3PPF208195D8DF69335A6195C2064A37CE389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <DM3PPF208195D8DF69335A6195C2064A37CE389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:303:8c::29) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS7PR12MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: 51895edf-c4bd-4194-896d-08de57daec33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVRTYlh5ZWh6SXFiU3lRNnRiRDBLV09oRzlqd1hNUGg4WG8xSi9lekhOK3hw?=
 =?utf-8?B?UXgyYm5RMEMzTUFrQUs2dWFueHMrd2dDMVlYbitpOGhzaXN1UjN0N2Jiem9Y?=
 =?utf-8?B?QWtBeWJJUnY1UkJDVnF0NHJ1RnB6S3pQdlJHQmFyQVlYcFIwNGROa3VTVnZ1?=
 =?utf-8?B?ZUZmclFFTHV4TGxXSUh0VUdqb3B2ZnUxTDUxOVVKekZ6cXk3bm8zZmJ4NDI1?=
 =?utf-8?B?bzZGMmxMT0JmeHg0VDlTYTFRa1Jtb1FCWmlZTHp2Njk4cXFJTEs3OFZteWk0?=
 =?utf-8?B?d3FDc2dJV0R4OGg0V0c4c2c0L2ZsQk9ibTcyRElkVmtUV3N5MmF1VlN3Y0J3?=
 =?utf-8?B?a0tBTUZvaWZEdVNuSE93eUdQMHpXSHorc2p5azB3RTI0Mmd2YXI1Wnh6K0Fn?=
 =?utf-8?B?V2Q0L01TdHo4UFRaSFhqTEdaeTd1ZTJQRWZSaW5PR3dmL2gzVEVyV1FyQ1Ru?=
 =?utf-8?B?S082aURTRmgrYWFIMkt4ZTdYNWdFRXB0ZmRUMUVOTXdWdFJFU3I1RXFVMFpS?=
 =?utf-8?B?ZS9rSklVcnh3MVlqM1JWbFdrN2F5bVpleFp0UjhYRDBkN0NMYWpvM0ZGMzU5?=
 =?utf-8?B?UERZeFcxOTg5ZGptUmQ3R1ZqS3owNGR2UVowMURuOGlWWVRXbEVGeTZya3R6?=
 =?utf-8?B?SHJrOGhwdS9UNHFHTUpXc1I5ZWlTQkM5NE1WcmlZWkRXWXp0Kzlpd1NxU0hj?=
 =?utf-8?B?N29Lb0Qxb0d6bWRPU2ZHSFhPUUxvTU1TYVJaU2JSY2xsSWxCenlRRmp0TnRI?=
 =?utf-8?B?OUlRQytTVWQwNTRXaWs4cnRxRk15SGs3OFFmSG1wcVlWWitlcWJLbkxvV1lU?=
 =?utf-8?B?anZwdUhGVitMaDRUZkJxMTJNZ2EwanNNYWQyVGZoa2ZaZ2tDSnQxczJxVytS?=
 =?utf-8?B?ZDhmNE1pdjBsS2FIaHp6Qkppbk1HN3o4SFNTS2ZDME8wMXRNeStBSDZldWRp?=
 =?utf-8?B?Z2F2cUpDZW5UMDBIT2ZhNWFYK1crMCtOVk1CaFZ2NmdTK3hERndGOWFoV3Vx?=
 =?utf-8?B?SlpkcTN0elhUQTh4cEV0b001Nkh3d2hhR2dPUTFINkFtMktrRXhJU01HSmNl?=
 =?utf-8?B?Rmx5cFMxT0NqWm1MUzA2UjErRHpaMUhzWUZVUkw4YUZtVHZ6WURDK1hWMmFz?=
 =?utf-8?B?L282aWF1c1djUzdaRWRFSHJuSWpBbC9LSU1XcSsvVjR4R0U0YzZpWmw5K2Z5?=
 =?utf-8?B?TlZ3aWY0YkhwOGZ4ckZUOUZ4MEl4c1hQWXlnWHVuZUlza3Q2STBnd2RPWVlu?=
 =?utf-8?B?QmhKajljK1dDVlJsUHN2azExR2dGVkM5eGkvdXhCU2pONSt0cXF5S3p4cDBi?=
 =?utf-8?B?YWFxM2pjWkdaVFhzRklTZDN0MVNMLzFQeEttMUh1Rkw4OE1lbmVRZDBHdW5p?=
 =?utf-8?B?M0pXL3NGckJTRjlKZDdvcXM5QS85UmQ5WGRhUTlNb0ovQnlWcUJpUk9BeWM3?=
 =?utf-8?B?VVB0MEQ0NmxTTGs2b2RabWdwdHdWcm9iU25wNnRrRU94SDA2VXkxdnozZnlu?=
 =?utf-8?B?WWJ6amw3SGQ5b28wM1dTNGdjVmZ2TUJaeWY2T0JoV1VTUWVDQVdQNjRpN0hv?=
 =?utf-8?B?N2pHdFhoUHF1NldPMUxLM1duMlQ3d1hOMk5saldRcjdpZjFaTG53VzRraDZx?=
 =?utf-8?B?MHRLQllVZzZ0MXduNC8xNmVBQ3lVOHJzaFUzbzFEMVV3ZFlZTnV5SU1VemxH?=
 =?utf-8?B?eFJLcXhwMTRJUlJSR0huNVZucjRLMlBTSDRKTUhWWWVScDBEK004eXVmNDlI?=
 =?utf-8?B?b3pVVkEyZFd5TGhBS01xVjFNNU50MW5BYWhQN3V5MHhabWRVOERGb21ETWt1?=
 =?utf-8?B?M1BDelVLWGYzMjcwMWEwSUJVVE54MVhCdUxBaHA3K0ZRcU1LNk1vazE5UEJz?=
 =?utf-8?B?dEkvdy9qdDNsYTdudS9ScFdYQmxtMXVGRzRQZmJMWmUzTUNQNHEzc1JTVkdW?=
 =?utf-8?B?NHZpdzNzSm55dHRhZWR4cGN1VUYvcC9lY3FTb2JOYTBuNitsUjkyQ0pIbDVo?=
 =?utf-8?B?WnIrU1ViempqUEI5dkR2amRteXljemlRTW5WNjk1V3JSejFUK1cyc3VyVWdq?=
 =?utf-8?B?aUlzUDUxcmZPMzB3eTFzbjRUMk02dHYyQmhMWDFCaG5RM1BzbUVGUHFsNEFJ?=
 =?utf-8?Q?tslk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2cvblNtMnY5NEo3Zmk4VmRwazV6QkFHOU9UYWdoMEtNZFRsTmFodndDeUYz?=
 =?utf-8?B?SnF3ZGNRbHBJNlIxNEZXUXhLY2QwRnRHeUU4ZXY3OEptZFJ4c1hEWU5Jc2Nn?=
 =?utf-8?B?bGRndmRSb093ZHRhNVIzbHh5b3hBcXNJVkJlZGp4bEZzU3FLSjYvZndiRS90?=
 =?utf-8?B?T2VHcHlTRkJTUnNFb0tsblpIenArTEZmMTNnV2ljYUd3WWdrdjVxcnEzVmtv?=
 =?utf-8?B?ZFFNczNvemFqNkEwSXVPc1gzb2djVGgrVmY0b28rMzBqeitGSlpnY2Jydk80?=
 =?utf-8?B?ZGNURXBKeURiSGhQR2ppeCthV0dqUkh0T2xRTE56NDUydzYydkNGWnppdnNI?=
 =?utf-8?B?K2ZFM1QzUU0yTDZnYm10MnZuZHdVQVdwS2MxK3J3cXAvZHlkalNRN2JiTU1J?=
 =?utf-8?B?Qm5ZRDdTUkdUZ2JIaVFyNEh2eVcxaVBPQjZFbmFOV2ZGMEV4eFlpTkJNbWJw?=
 =?utf-8?B?U1QxVFVkZjlwdzNTbUJ1YlVVWGlsMDc5SExoREFRVWtSdU01ckVKWTI3TmZO?=
 =?utf-8?B?VUN6Y1JOZjNXdzFpa012SEtkVEpFKzBGbEFTQU5jOTJ3eWZ6UEZOTW1KYUpm?=
 =?utf-8?B?YnlhSmRtWVlTUWFBcnJMcjZuSUR6NEd0RklrWk9QMkFtS1ZkU2FRLzRIaENq?=
 =?utf-8?B?K3Y2WXRId2pFaCtxZHpWMmdZamhQdEdSZDQvNmJob25HV1hMaFhUSVlCMVhL?=
 =?utf-8?B?WGdqeERwVUlxdW12QkZlTFNUMERxb1hGemN2YUlHVTlpSEZ5bzJyQUFDVkx2?=
 =?utf-8?B?Y3hCWFlSLzA0SmFPWTdKUE43Y2J4U1QzaWIyd2hiVWVTTXR1cW5qaWk2MW9w?=
 =?utf-8?B?VlRwYWVNWWNZUFl6T01oK1ZrRmhEL242dUx4TGV5SWJlZC9IRUhEemFVWjNW?=
 =?utf-8?B?NHU3SWpKUVpNS1k2OHVpNU9VbERFSkVvdkFmMVlVU3FMQkM3QWQvZWxhU1JN?=
 =?utf-8?B?SUNGOWdRZTZZVFRRcWQ1citKY1RadS85YitzMC9Ub1JkQnZYVDV6UDZxdktk?=
 =?utf-8?B?SHJlMzFxaWhmTEpobzE3S3N1d0VsOXpXcGt2dXpqNTdiTUgzS25TUUNmMHE1?=
 =?utf-8?B?SmdKSkN1TUNDUGJVbFJ0RysyMHIzUy9JT21zdHY4Zk1sMXF5b3BoK0x1blhw?=
 =?utf-8?B?LzN2YlY4UmpQT3lYMmdyb1NYQkdFbzZTVi9PN2RKczArWjRiOVI4Rm5nNlZ0?=
 =?utf-8?B?bURlUFhHOFEvZFllcnVlYzFtSGhnMEFNUXdLUHJ0Zk9JNmxOOGFPUnFPb3FN?=
 =?utf-8?B?M2VRWW0rVDhPc2FqNi9oamtiV3VXOHNNNENLS0ZpSnJReXBPcFJlNnJoTEdQ?=
 =?utf-8?B?cnU3U0dlNllNeGhiRzVDVW9WN3lobkhCMlZvaDY4bU9DUmJkV0tPWVhaaFVz?=
 =?utf-8?B?YVVJMmVYRHJMUTRyTmR3dmhSQm8vZENMSVpRa1NrRjZITHUzS2hlK1c5TW1V?=
 =?utf-8?B?VENldWUzQ0dSQkFkV2R3eW9xdzFSSWZVSnh1WnI5eHNDWTkvS2VLNjZvQU9O?=
 =?utf-8?B?dW9OTk5LZWJtQVJ2NjVTWjdZR3daRUU5eE1lRzllK2ZaQmMrVm9mbmpGUFZW?=
 =?utf-8?B?SEg1dlFzVDVUWTZaWFBCeUh3ZnRTZjN3SUk1K3RSaHJSQ3Z2SElvV2dkeTZr?=
 =?utf-8?B?WlBKM1h2TW12U2wzVVNzWFJaS3pENXUyWFYzdGJZQlkxUDNURWt6TzRYWWVq?=
 =?utf-8?B?TG1qM0NVQ3U0TDc3bjV2Y2p5ZGVEb1pBNkVONzRHWmxUV21qSVk4b3YySTZB?=
 =?utf-8?B?bnJDWWRxeC92R0hqODdpMWZBbFZuM2NJOWdLUktPRHgxLzdXam9SNnRjb0hl?=
 =?utf-8?B?NXNUL0s0QUJ4SkwyRHM0YkJhZVd5a1NHeHNoZUVKckxKMlhnMTJyejZKOWxF?=
 =?utf-8?B?VU1JSHg3TXllZGtreU50ejdwT3ZqOCt4RFRBZnBkVUxtQTlVZnV3bEhROXFE?=
 =?utf-8?B?WG8wUW9HZVE1YkpxekZRZTlCOGtTTzZsU1dOZURLNE1aWEZvMmdhMHFoVHln?=
 =?utf-8?B?dyt2QW9uWThxQStkL0FaTld3N3hCTUF5QURoUGZpWk5DQlRWeWVjbjZMakRG?=
 =?utf-8?B?Z293bHJ0KytjS1lxaFFGYkkrVTN4YzVpSE1sZGtrVHR3OG1WZzhiR0J5RitC?=
 =?utf-8?B?SWhqMlF0Z2ZkdkFVLzQ4eVB1cFNHT2MxS1Bab3RldldVUWovdXhiUUdzL01k?=
 =?utf-8?B?V1FHeVAxZ2VUcG1aeEpVYzRtbi9PaVlaeVV6RzZDK2JFTUJGZUZyNUZxTzUz?=
 =?utf-8?B?cGtTRGtWV2RkT0dyRDZRUGYrWVhidWFCY2dxVWNPV0pqYlNia0piM1Nidmkz?=
 =?utf-8?B?dFQ5MXp6UUNWUmtFU3BsV2xlbmRvSmVWOHcvZEMrZ05BRzFUVXBSZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51895edf-c4bd-4194-896d-08de57daec33
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 04:18:11.2561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N47zfXqN0hfIqUuVrChKR8Et+Owchu1LVH0GbNjWlfI9Iu5dPbnbhO0KyYqBzQ30DjBfnsgbKqp1Ez1D+I6Tow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5960
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



On 1/19/26 20:02, Kandpal, Suraj wrote:
>> Subject: [PATCH 1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS
>>
>> MAX_NUM_COLOROPS = 128 is too small for some hardware and it stops
>> kms_writeback from running.
> 
> How does that stop from kms writeback from running needs to be mentioned in the commit message here.
> Also curious myself ?

There is an assert from "igt_assert(display->n_colorops < 
MAX_NUM_COLOROPS)" as below

(kms_colorop:3233) igt_kms-DEBUG: Test requirement passed: 
resources->count_crtcs <= IGT_MAX_PIPES
(kms_colorop:3233) igt_kms-CRITICAL: Test assertion failure function 
igt_fill_plane_color_pipelines, file ../lib/igt_kms.c:877:
(kms_colorop:3233) igt_kms-CRITICAL: Failed assertion: 
display->n_colorops < MAX_NUM_COLOROPS
(kms_colorop:3233) igt_kms-CRITICAL: Last errno: 95, Operation not supported
(kms_colorop:3233) igt_core-INFO: Stack trace: not implemented

> 
> Regards,
> Suraj Kandpal
> 
>>
>> Double MAX_NUM_COLOROPS to 256 to avoid future frequent changes.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   lib/igt_kms.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 77b3ae2af..dfdebb83f 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -92,7 +92,7 @@
>>   #define MAX_CONNECTORS 32
>>   #define MAX_EDID 2
>>   #define DISPLAY_TILE_BLOCK 0x12
>> -#define MAX_NUM_COLOROPS 128
>> +#define MAX_NUM_COLOROPS 256
>>
>>   typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char
>> *value);
>>
>> --
>> 2.43.0
> 

