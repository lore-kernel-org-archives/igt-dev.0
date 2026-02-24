Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B59DEFB806
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 06:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFED210E4B3;
	Tue, 24 Feb 2026 06:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dNEb8UKW";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5DC10E4B3
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 06:01:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fARzCk3pd3fcToWdKK3qhBkRrBMqa+AZ3g9Y8lNhCuLUQxavgc5+qi7q0AXCvvtuf34+7X+kSsC0+9KCcTQZF5uu6p19xe7TVmdtOQlK2ffl7XMz0aHjX6nWy9o8MHLenvxNs5CvDeTRlTg/dNpQf4H+NpCoI35nCqm3mRMkUYScpXspy+SBwZ6iEI/rWXGoA24KJv0fAEgR/V5303qdjeY67yRZbKDXpL9UlvyuaU+4vqwR2bwD/6PlI1KoPfzLa8sqUieUI3Jwzn+YGndrs0Nn6YwpZs9nM8K3bqsYPDRycXAVIGNd7KVUGJIE9lg0vsq/0cYoB0864RMI3QbQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhc1qRQso9OJdq0ontxQMD/i6J5d8FKGKM9kXmuMkNo=;
 b=vebhf/zEmMYSECH6dRSEWipsA8I2Eb63VHSlJojWBoR9OOax+Jy3qSZiPpXxx4lTXw6OG65GOd07pqJrmSVQiL7xcObUPPdMPYGrNVbdz2vbZ7AefLTXw/Oc61RsiZ/Fnt/XQAkN6ugUl/6p0SFlaVyzG/jYM826jcX+sYqc51VNvoCM7IbyVMrIsi9F8rkqV31bQUPakAcpdLrJ7q6v/9kZA6yXoQ2V2KeYYFgbavwxGIe0tXA1vxbicuY4Daax9JVvc6P8+5fW1b6YyRp6wGpteijQrv9tD9CmsPvUXv1szZytmKEDhoLZeQfaUt733mXshHyfKf7qq1D+1vqkHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhc1qRQso9OJdq0ontxQMD/i6J5d8FKGKM9kXmuMkNo=;
 b=dNEb8UKWQ75J5c0BQtA7tUoFlj2O5pf9DJ5qbjAdwODzdc9EwYWZTuiDbI0gR0x24IZJIrhr06YSluc2LoY9LlXxlxPfv8cD/6hBVe3oBHSeRlkQeCwgUKLlIMEAz8XhhvM3DSu/BxbkoXrTJ+DV/6d2/y3m/OupVeypXU3rmsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DS0PR12MB7777.namprd12.prod.outlook.com (2603:10b6:8:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 06:01:14 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 06:01:14 +0000
Message-ID: <9ce2776e-e483-4eda-99a1-2b6b2aab044d@amd.com>
Date: Tue, 24 Feb 2026 01:01:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Assistance Requested: GitLab CI build Failure During Docker Image
 Pull (unexpected EOF)
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <b7e4b022-731b-4c2f-93f5-25c52f42f904@amd.com>
 <20260223123644.wkbk2pkfw7ctmnfv@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260223123644.wkbk2pkfw7ctmnfv@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0497.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::15) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DS0PR12MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: d02bf6cc-19ad-4fec-b73e-08de736a1d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OS82R3NnR3c2NE45bWQvRVkxb1dkNHB2cVFsUVZJNkRJc01pWXc0NU81c2pL?=
 =?utf-8?B?eSt3MDVhT09wN3psT3YxN1V0aHJIc3B6Q21pMUJwNTA2cHAzTjV4WlgyV1Yz?=
 =?utf-8?B?RUE0cThxU2RwTTVvQzN6dFgydS9UVWRIRzBtNWxuRW1IdFpLK0dzTjNSeTds?=
 =?utf-8?B?aEFjRk8zbXk5SnlJNzZwQ1hUeGdka3JCQ3F1YWt1L3dHWWNWWlZZejRTN3Ru?=
 =?utf-8?B?cWdTeE9lTjdCTTR4aFZ5WDg1T0g5K29XK1NTdlNzU2crbXpValB5TVMyWTBG?=
 =?utf-8?B?cnp0UEJ6RmtnRHhJeVVmZ1NMblBhcmxOQW56UktTbVMwcE93TWkzSVJhcGt6?=
 =?utf-8?B?cTJ1ZXZPZGNkNUJ1NzZQVGhITFMrRkZxZnVrSFhCK0tsRVMyNFNMRDBqYUt6?=
 =?utf-8?B?QUpJdlpSdEc3R2piS3ozU0FiOE5ROFdpYU5mTktybXBsQ0I4TjdsSUk3bEFp?=
 =?utf-8?B?V3dCakRGRWg5WkdLaEMwak8xVjZ2cnUwTGFickdpY1VRVmVxbkZQQUJBSy9t?=
 =?utf-8?B?dDM1ZFJqM0FpTjRYMm5mRFRxN3lBWVcyb3htbjhjY3BkUVRtTFlSVE81NTBx?=
 =?utf-8?B?Qk5XekpEU1FNUStFaTZtWi9HZEJQbzM2SXZZdGgzY0JDVWkybmx6aG5xOUVN?=
 =?utf-8?B?OTJSSDBoaitEQ3BhRGw2UVR4dUYxOWtmdGNSc2ZvSlNrcGVwWGpUeFRqNFR1?=
 =?utf-8?B?WTA3ODYzbm5DaE5QUnBlL01XTmpIV0h3ci9ubUlNenVEdmZjSHlkODMvaFJY?=
 =?utf-8?B?Z1ZETGlVUzhHWnkxQk53YnhndjVFNGw2NXRPRGhoSFFEVFRtWXZtMTdJREFu?=
 =?utf-8?B?MWoreTBFRWhONkNXekQwRG5wQm1BLzFqSUtEdFZ4SGVzM2o4cUt2bjVMN3VR?=
 =?utf-8?B?dGJaTVJWUEZHL2l6NklZWURUcXVzRlFuM3RSa04yYkc2c2FqVkVreEtjUnRV?=
 =?utf-8?B?aFBGMVhELzh0MkwxQVNiQXdJK01HRndHTFFVeE8ySDh2VjIrNHhZQk5FVWNB?=
 =?utf-8?B?RzRMSERIVzhPV2NjK2oxVXFPMVFybWpWNVBmd285bEJPSkpQckJzSloyakdB?=
 =?utf-8?B?QjA4Wi80RWsyUlhSb2NpQ0ZybnV4L3NDSFhoc2N1bHFxZTEyMktCZEIzeFBC?=
 =?utf-8?B?RkJBOU1UNDE1ekhRTGVtMlBBTGFxd1QrZmxkR2gzZUU2RjdqeklSYTFwUFNO?=
 =?utf-8?B?MVFTOWxpYmMzM1RLbEpBejdFbmRDTkpwaVIwaDRMZ0NvQlh1RE56OTRTSVVT?=
 =?utf-8?B?ckV3L2ZITytUNllLQ1hmS2s3c1dTdmtRSWM0a042RzFjQkE2YzJaemkyYWdt?=
 =?utf-8?B?RlplQjgwYWFLWmo0aU53L3ZFMHhNa081QWlmZXFKb2Z4TU8yVGx5SXpMTjgv?=
 =?utf-8?B?ZS8yV3hvNmVYMWpiUXpaZXpaOE45Q01YL3JoN01xSjZFYmgxaG9ROWs0WWFT?=
 =?utf-8?B?akRMbEdYdjFJTDVNRU8yb3ZqZ25WVFg2Um1KYmNFd01uN3ZwWUhWTzNTS1BL?=
 =?utf-8?B?RDI3TGl5RUQzNzBUa0NuMFdzVmtUWncwYWtqbCtxNHJpUmkxeFphN2tVWFdo?=
 =?utf-8?B?WlloU1dzb1hiaGI5M2U4Y0hYTExFcXhUNGxJY0lKTW1wcWx4YU5XWXdqcE5U?=
 =?utf-8?B?STBjdDlyenlYamNSY0l3cXB0QTR5YnVJUlI4YTYyTStPNFU2TEw2ZVBXY1E4?=
 =?utf-8?B?MklTNmlWb1o3YXpHajY3ZGVwWHQ1NjRKYURjS3BYYnBRQ3NrZ0Q1UlhCZkg5?=
 =?utf-8?B?MGFOcmxuWVd0aWc0NHh2TFdVV253cStOSTZobS8xSTFYRlV2RmZqSCtLYlh2?=
 =?utf-8?B?Lzk5WG9Mak9tYllvYnFPWWlFdTduUWNxaDNud2xkdjNuWEI5THF0ZjNwck9E?=
 =?utf-8?B?TGUvMis0Q0krcHVHWWV2MWQraThyRkxISkg0UDBUYWwyUVZ3R3JYZE1vU3JH?=
 =?utf-8?B?TlRZYkdsRVVPcXpBVkl2eE1MYk55OGM3Yk04eHVCai8xQU5FNHVRcW5rWmRY?=
 =?utf-8?B?VSs4bWNOU0tzNG5FZ0lrV1RsNUxqYXZRUjA4NDU3VW9hWTFCaEdpWVpTb0lG?=
 =?utf-8?Q?h5jpYp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjY5TitTY0NLelNlcnN5NG5hOUpPRE9PdkZlT1JOTFZFTlhvUmwya2c2a2hI?=
 =?utf-8?B?SDRUWWlDU0pxOXhHdkp3OEN1eUpWem9TallhVHVqVjcrTkwvTFUxbytKQ1ZY?=
 =?utf-8?B?b0xUbGU3a2orLzBIY0taQlI4Rm1FVm9xRlVBelRST0dRT0ZtYWxIMFhmazM1?=
 =?utf-8?B?MC9LQVB6OFpxM3BhcGlXd29UV1NQM3JGKzRnZENxb0dCT21KMDNwNFNWV0o0?=
 =?utf-8?B?MHhQS1ZwS1FMVUZvSWZBVDRtbHhvd3hHNVJjc3k0YjdPdEFUVmloSmk0RS8r?=
 =?utf-8?B?U1kvUHZ6dmR6bFRlMXBnTUc1bDh3UDRUaSsrWXpqUWVzVXBYclV5Sjh4Nmxq?=
 =?utf-8?B?Z1dBS1lSOElwVjlUZzkrbHdQYVl4Si9Xd09PSng0bEY1WmpwbFZ2V2NTbXVP?=
 =?utf-8?B?QVNQK3pueko4NnROcUFCZy8zOTdCTFM1d2ZDS2NOcEJWMVRzR2YwNlFJb1pM?=
 =?utf-8?B?ajNpRitrNkZEQm12S3pHaWxLU28rQ0ZMT04rcmdWWldNV2s0djlWRzJ4cmJP?=
 =?utf-8?B?VnB3WkVCNWFFdXdCVU8vYXZOME9PU1FmZEkrRjhtZGliWnNlTUI3d0NPeDhW?=
 =?utf-8?B?Y0hRdUpZdnFrTWEvVGt3aWh2UDRlUW0xS0czZXJ0bGhRMldIa0kraFlhVUxp?=
 =?utf-8?B?cWZ1MXBOVzV6bjRkZmttcXVLQnBhR2YxRDUxN1VKUlJ2c2k3cjlUSzdPNWgw?=
 =?utf-8?B?dmVDRUFWMFFVMEtFZVp0RHVXTWZvUGJ5UUhBQjNBSHNkOXRVajV5VlFaK0Fs?=
 =?utf-8?B?R3hnTW8zb0hXbFN1d3ArejZlNDBLSlIyVnR2MTc1SWJGNGVQKzRtU1lsZTI5?=
 =?utf-8?B?dnNRSUs3bUdLUnkrMXRFVXIwMTJXODNZWldPemh6THNxM1MvaWs3UkVlVzd6?=
 =?utf-8?B?aVV6MEY0L1AybVdUVkhmMDBmTnlJa2djZXpoMmtQRGJ6SDVyQU0xUUtJS2lU?=
 =?utf-8?B?QVU2VHY5U0IwM1BSOHFrUjRiaGdqYzB0cEVDZkVxdDhEOFlwU1FPL3BPM2ZS?=
 =?utf-8?B?MUtyRW05WWRRc2hFTm1uc3lWUlIvQUFKazBqam82L0ZYTUJzLzVpNEcwMk14?=
 =?utf-8?B?azNvSHdSVjQzSWdsTXBDTjM4eEozV09iTzZBNWtvVDFvVGpMZmVIM3BxVXRM?=
 =?utf-8?B?eXkreTVZVXNqT2JkQjAySlM2WUdlZGFlSktBTWV3VjUxdDRGU3RvUUtHTjFr?=
 =?utf-8?B?Wk1QYi95eWRsdjBpbFhsdk9wWUZkR1FoeDdXT0M3OEsrZFVJNU9YNWxZb1VR?=
 =?utf-8?B?T2g4N1VScFdGVnorbHFHU2JvaEQzTDZDNDNrczR2aGd5ZGgvTkFBWTNsK2V2?=
 =?utf-8?B?enVhVnJsVE82R2lHTGg1ME5vd1JZR0Y3TVRCUG9GMUhka2NuNHhwMUJWVkJa?=
 =?utf-8?B?azV3ajVjTjU5Q2Jkei8rQ013Yko2RG5vY1p5SXRuemxoaTF6aHk0bGRzbFNF?=
 =?utf-8?B?K0JPeGgyeDA3OTlSVWY0VVduRFlKMzdCM0ZXL09XVFJDVkVaN3VydkI0eWJo?=
 =?utf-8?B?NWl3TldWUHE1YTRzdHlidWVYSmRkRHFYb3pBQisxU2lhcUdTTFdjN1lJdFlw?=
 =?utf-8?B?TVZ5NzJmb2pnbE9FTHhmRFRQcDBjcDV5aTF3bTAyZitLeDF4OG9XMWZVcTM5?=
 =?utf-8?B?Kzk2Z0NmWWNXU2dZbFNCUVlCNlZPZDQ4RXhNZG1MY05qek1VN2ZhajVFQ3Rk?=
 =?utf-8?B?UHZ0NHhxMDVoR3YyQ1BBYURrc3hpUDdVNTRoNmRxM3NLbXZrQnk2bC9meXZH?=
 =?utf-8?B?bHROc0l5QU15eUljdFVIWXZjeEQyUm1BWitzS0dNYUNYcW04Z3p0cmdOeE81?=
 =?utf-8?B?K3BvSUJpR2gwa0hQM2NLaWJhWmQ5MXE1Mmd0S2dqdm1WZDdQVmo2WTFQV2M2?=
 =?utf-8?B?UkR3NW11a3YrVEhWZ2g3VjI5VlhFODRoVmNMVmFDS0tMaWUwVFprVTUxOENi?=
 =?utf-8?B?VEJmSzJ5Qy8wZE1WZVRWRy9LbDJpWE5EaHc3WEpRVENRRld1UzlBRnFOSGll?=
 =?utf-8?B?WDZwWURiZUlkVXRkVGtMQ1VCU2pQVExoaGJIc3hEOTlWTjB2S3BuaE5xMlZn?=
 =?utf-8?B?cEtrUHNOejlFNFpieDVxWmNsOUV5QkFBY3B6bFhPbDVKQURWUzgvNS9aRktq?=
 =?utf-8?B?UUdwM3J1LzJWMHpXWnpHMjE3RkN0dVJ0QUhWNW1MVVg2Ni9sVHNkaFdVcVlT?=
 =?utf-8?B?YnMzdFVPbU0zUE1Fa3lpbkhQRlJ2SHUyNGJPdGd4WUd0T0d5QWNrVVJTS0lK?=
 =?utf-8?B?K1dkYU9KdXdVdEFPTlZ6Um5ha1pFUHBLMjI2V0V3T1NyVHBlVVJTQnBEQXlu?=
 =?utf-8?B?dU1jMGFJbDQvTmZ0RlEvaEk4MGNLcHZtNE83a3E5SlFiWUxsdTdSZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02bf6cc-19ad-4fec-b73e-08de736a1d3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 06:01:14.3210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80WWhWEP56jS5YaOCBiVBSHwayhCCSgZ/Bkt/g4ohHbMdRyxqmmNrcFTd8z2UWF5Rvwmny3qIAdc5TuWOhiWfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7777
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

Thank you very much for the clarification and for re-running the pipeline — I really appreciate you taking the time to look into it and confirm it was just a transient network issue.

That makes perfect sense. It’s good to know that these kinds of Docker pull failures can occasionally happen and usually resolve after a re-run. I’m glad everything looks fine now.

Thanks as well for explaining that there isn’t much to do from my side in such cases. I’ll keep that in mind and won’t worry if I see a similar failure again unless it’s a real build or test issue.

And thank you for the note about IRC — I’ll keep #igt on OFTC in mind if something urgent comes up. Of course, I completely understand there can be delays, especially around holidays.

Really appreciate your help and support.

Best regards,
Vitaly


On 2026-02-23 07:36, Kamil Konieczny wrote:
> Hi Vitaly,
> On 2026-02-21 at 23:43:08 -0500, vitaly prosyak wrote:
>> Hi Kamil,
>>
>> I hope you’re doing well.
>>
>> I noticed a GitLab CI failure(https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/93765548) 
>>
>>  after the recent IGT patches were merged, but it looks unrelated to the code changes—the job fails before any build or test steps start.
>>
>> The failure happens while pulling the Docker image:
>>
>> registry.freedesktop.org/drm/igt-gpu-tools/build-debian
>>
>> The runner reports:
>> “failed to pull image … writing blob … storing blob to file under /var/tmp … happened during read: unexpected EOF”
>>
>> This seems consistent with an interrupted image download (e.g., transient network/registry issue) or a runner-side storage/tmp problem (since it fails while writing into /var/tmp).
>>
>> If you have a moment, could you please take a look on the runner side—especially:
>>
>>   *
>>
>>     available disk space (including /var/tmp),
>>
>>   *
>>
>>     whether there may be a corrupted cached image layer,
>>
>>   *
>>
>>     and whether a cache cleanup / forced re-pull would help?
>>
> That was network problem, for example broken or slow connection.
> I happens sometimes and could go away at next merged changes or
> when admin (for example me) re-run failed pipelines. I did it
> today and seems all is ok now.
>
>> Also, please let me know if there’s anything I can do from my side to help (e.g., provide the full job log link/details, re-run specific jobs, or test a workaround).
>>
> I do not know of any other way besides re-run. The only problem
> where you could help would be when an actual compilation bug would
> happen.
>
> Btw you could also ping me on irc oftc #igt channel. Please expect
> few hours/days/sometimes weeks delay, especially when on holidays.
>
>> Thank you very much for your help.
>>
>> Best regards,
>> Vitaly
>>
> +cc other admins, Karthik, J-P and Ashutosh
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
> Regards,
> Kamil
