Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5AFC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 10:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724B910EA33;
	Fri, 16 May 2025 10:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Av6J4ZKo";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E25B10EA33
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 10:17:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS0rKq3CBBc78Ql319pxySdqXim7d4qdMXkOCogjfPyd8fBadiOPx7ncCZtm2IZy+BEjzzBYOSxv/CcGgMEoSvgiUi+YJjDYTMJ319H8mEoB3rj/cRT3VuG48nIrkFn9cF6iWsVd7lW3SQx3/+OUGmeR+UMDmILsIXrZH1yiyyHXUjRcuJOArZWzxm8tCMNhtILJLbl1BpeUwuWGk8iA9hVOflpQNn33vV/rRcrimGqnvlGuvZmX1zFTcAR1hvLLw5+y77gBjcBgMIApxhBdTSJNcp1vJDSQ/M/71uKKoP9BfwZo6liX/2m4xSo/DBswPXvVjqQDhIaBRfpL6z2JDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F40s5m9IhgMQrFpi/QucQRW8HQR30AC20CiOPbVtYSE=;
 b=OnuP85+nKLWwcvr92NzJfibD0Eq0+mCCAdVNhtyMzyBuTOa79a4eeX7J2/ILjUrRf24lJ4qjI80YWmau8zJBR7WqyKQHYbVRtVad7mC6tk2KW2qeEXjUUN3A5pa9oSQPEMn27Uxm4bYQm4f/ABvRF/eMagtgmUZDMc//z7Y72TjFyGp8HrVkWytj38Kch4d8ncOt/Aww3988K085rEr1eqP3FFo+KkM+2qNe5El2K+WuLfi4k+KP/E6GIW9kXOsvacOzlA6fOtnaatxhulaTNqV/99WNMiB8Gll59bZ4ILb3cRxlHnUz3nGvNraGL8nw7NZ8YJ1OJJ3noWJW/hsXyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F40s5m9IhgMQrFpi/QucQRW8HQR30AC20CiOPbVtYSE=;
 b=Av6J4ZKovASk5ekRlsOOPTZxmzVOPfR7WqJh/PdYNloKWOReJpuZ7bgu3OizeDRGEX5eHCYSmmX1Y+ydWCSFX2MBti/3ow9d93S+h2rQJ4ou7QzZ7T9C7lMp40GqoVn3nUQqla4PotbcyzpgPXzN3vq/rdm97bKoKbrgP3erjUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SJ0PR12MB8092.namprd12.prod.outlook.com (2603:10b6:a03:4ee::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 10:17:06 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 10:17:05 +0000
Content-Type: multipart/alternative;
 boundary="------------7Wk8LYMs724EqPfPsEYUUuht"
Message-ID: <3fe3dd07-7946-4c9c-88ce-bd6b30c4f452@amd.com>
Date: Fri, 16 May 2025 15:47:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/amdgpu: userq skip waiting for signal
 fence
To: "Mohan Marimuthu, Yogesh" <Yogesh.Mohanmarimuthu@amd.com>,
 "Khatri, Sunil" <Sunil.Khatri@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <PH7PR12MB663304D0B79D9251B8660EA0FF90A@PH7PR12MB6633.namprd12.prod.outlook.com>
 <4628ecc6-9303-4c8a-9e30-0f504307ebfa@amd.com>
 <PH7PR12MB6633234BEAD5CA70DA8E35DEFF93A@PH7PR12MB6633.namprd12.prod.outlook.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <PH7PR12MB6633234BEAD5CA70DA8E35DEFF93A@PH7PR12MB6633.namprd12.prod.outlook.com>
X-ClientProxiedBy: PN3PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::22) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|SJ0PR12MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: ce05eada-4b8e-4981-65ed-08dd9462cecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anZNUDVHdldqZWpmeTA5YTYvVkc4NTRaZGNaaEZ4Q0wwblh6dlErbGFOWlRk?=
 =?utf-8?B?dUVvVkd6V0szTGYxMG1vMGZZOHpqUVk5U3Mvano1bmtZUkYrSzNaS0U1VWJx?=
 =?utf-8?B?SWtMSnp6dkNKMFp3cm1zSjlONG9iL25sN2NNODBMc1VhVnVvdE0vb1l3a3Iy?=
 =?utf-8?B?elZKZ0xsZk1GQ2VCeFhSV20xUHdKY1VaSVJ4TWQ5bmJOQkphMWtHNWpGREh4?=
 =?utf-8?B?UEQ2cE5PYnY0RWkyeWU1N2tvRVVuZFVjSU1DVms4bGNCQnFocUFleTl6WW1J?=
 =?utf-8?B?Rjl0UXdTQ1lOTlZiWG9qQ2hjdzZySC9vWk1QSnN0c1Rjb2w3bHNERHNMdDU2?=
 =?utf-8?B?aGdTRXphaGtwVExHeitXMXdyWCtCeWdaclcxT3dwNGlhWHdHUnlvbm5OMmhj?=
 =?utf-8?B?TUxtckRkNUZnaXJqZ0xrZzgzRWlFMmdzOE9tTmhNdk9sUGk2dGltRCtVL0tU?=
 =?utf-8?B?THc3WnEyTVgyU2c3WHhhbzFrd0t5Wk4wV1ZNTEpIVmsrdWdpVGNudEFyeDl2?=
 =?utf-8?B?dkFvYXhGV2FQUHR5US9RWTZFcDIxT0I1RTI3aThBM1ZMdjlPb3pIN0xBL0Ux?=
 =?utf-8?B?MzloYjdJVmlLM2Z1WllkZmloMWJpejRwWXpENFFaM0JRdjlKQmNiaDNmWjdH?=
 =?utf-8?B?ckFWNjFveGh4djhMWFJ3V2xIZHVWbU9seFFHUkhWcmxETzJNVXk5V2RnUEZE?=
 =?utf-8?B?a01oUkhqbUN6YVJ1aGlNeHNpa3NMZ25PMEF5aFdiZlcxVUh5K0lNazA3L090?=
 =?utf-8?B?TDc2UXRrNHhyMVpIblMya215dFZIbzNoL0U1UGVCeENqbU84dkVZSkRQRWpZ?=
 =?utf-8?B?QTFrVXBRMFZrSXdkRG9OSHpXVW91cjM0emlScHlQNUF2cm1TM01wb1NqenFX?=
 =?utf-8?B?SmlGZU5iZXFJcmxoRytJTGFiRGJsQzR2MU50OEJQMXEyK0dsUzNmOWFTY0Vy?=
 =?utf-8?B?M0Z5R2hZakV5bkhJZFJxRDA5ZVhLY1ZOQmtqdDFYblpiQ1VmeTdSb2pkS0FW?=
 =?utf-8?B?Q0VLTmRUTHNTNnBkN0ZkTDlvSjFGUjBWRzB5YXJJcG5FY1ZzejNYQkZ0N1pX?=
 =?utf-8?B?azdHZDMrUXlwMDgwTjlZTWUwczBsY2prK2FROXEyaEt6RjZtYVNJSWJJZXY3?=
 =?utf-8?B?MTJLZ3ZKc2NqOGduU25oSnFMVDJabE1DTm1CMXgvZGtOQjQ1aU5xSjJnZG96?=
 =?utf-8?B?MTQ4cjNFRXNQQ3RkTlVzNUQ3ZEdlK3ZJajk4QlM0VnVBbnlrWHZ2Ui9JOGxT?=
 =?utf-8?B?RHBUZHZheUVIUEFoQXIrSHpOZEFCb0hYOE1uaGRFTVpLYmgraHRlYzB2YWVi?=
 =?utf-8?B?VEFzZ1JnRk5vNFBUNFM5UGk5VENJdmtCQXlnMTBBKzhJRVV2dE0zQ2tHUFYv?=
 =?utf-8?B?Wjl5Q0hxSU9kdUlNaFdLZWxRQ0w5VnE2dVlpM2IvTlFmMkRrL2xHTDFsSTUx?=
 =?utf-8?B?MWI5WWZnSFNKR3U2SU9lZVdZRERFUEZadVcrVFpYTTlqeDZkanRDSzNEMER2?=
 =?utf-8?B?eEo4YnY1UEV2VnY5WXB5K2hPcjJaQ0U4MWtrT05MM1hYdG9RT1lnam1PcHFP?=
 =?utf-8?B?aVRqWWIyaFhNTERMb1o0V0QrZzR6b1lHTGtYNkh3WkhKK3IwOXNXdHVHcTNU?=
 =?utf-8?B?YUZDSWxHYTdObTZ6dm9FZlFyTi9mL1QzS0JCeTgyWDZ4Z003WjFIVjJaNUpJ?=
 =?utf-8?B?U2FObzhPUVNmSUgreFFGVkpZT0NoOVBzZ2I1UkN6aGh2WXVxRnovQUJIWlc1?=
 =?utf-8?B?aTdnUm4zdWs5R29FUmVYRlZUQk55eERCVGNvQzVRcVNpcC80VDhlU0ZzR2tw?=
 =?utf-8?B?WlN4ZnIrVkpvQlRBRytwaHBIRFNLdm9Oc3hHcGZkbkNLNHl2R3J6cy83NXVy?=
 =?utf-8?B?S1NsVlVtQnl1YzlkS0N4Qk5EZU9nWFRDMHRIOWpBS3YyN21Nd25NQ1hQcjh1?=
 =?utf-8?Q?EAppJ6zQahQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1FPS0htU2tYQ3ZvWnh4VlFPTE1JNmNpY3RzSnBzOGIyU2ZWL2RNTVZqcWdo?=
 =?utf-8?B?Si9hdEVZY0IvVS9KV3BhWHJXVXZoUkZDQit2RzQ2R1ZDSTdzYTNQMDNJazcz?=
 =?utf-8?B?ampNYkxpamtqdVExMGFSang5djBjS2k0M1paSDdFTnhvOHZPQUVPSVhUWjdS?=
 =?utf-8?B?QnJFL0R0cU0vOWI3bnJMckdlQlVXYVRqVXpkMVBKQnp6QmN5U2gxYUtjbW50?=
 =?utf-8?B?NldnNmJ4QkZ0bHhidnp3TS84emNyYXBXWEhiM0J2NHBhTUFkMFVDRi9OZXcy?=
 =?utf-8?B?Qk1ib1dXQkxpckZVL2Qwd1hKeHVERmtxWDlrdHRhZkVhSU5QYk93Q1hYdFFa?=
 =?utf-8?B?WUM1WWhsaytmZi9SWTJzMFloR1ZqT3Rqbk5OdUNtUk95ZkFRbFJjdlE5RE5M?=
 =?utf-8?B?emtXTjNpbzV3VkRqcWxMbXQxZmxNUlRlaWVmQWNPYkphUEtSN0s4Q3REMmI3?=
 =?utf-8?B?T0ptNW9iT0FrMVd1TkJiVEcwZnAvUUVBaC9NdVZxRTF2dGhFQTlwbkhCV3pi?=
 =?utf-8?B?a2tmeDcrN1k3SWpBcEs0cGUzdHd3bkM4RjhJRTRYT2xzbWZaOXliQ3M1eUly?=
 =?utf-8?B?STVUTmFHbUVDZFdqNWlwdFB3NjA3MVNTZmU5S0J0MUFiZUdEZHVWdGNmb29L?=
 =?utf-8?B?eTYvbUNQMnJ2WjJyM0JwNk9mRUkwQ3ZtamJmbXNnTjhoVVIvODA4akFlZnc4?=
 =?utf-8?B?ajArcUFqTGo2Mlk5Y3hLNE83czJVOFR2Tis2ZTJhNUl1ZTJiYUhaY1paajl5?=
 =?utf-8?B?YklXYldoOEJ1aHZScUtsTE9Tc3pFOEk5NHJ0REc1MWtyZVhWVmwxZ0I4Szlu?=
 =?utf-8?B?d3U2ZXU1U1pKUjB4aC90d3Jyclk0Q2hNTFVyMnN5eU5uYmYzSklZMHcvUmVJ?=
 =?utf-8?B?MmxXOHlIVjEyUDFVSGFRMTdwWVBYbFJLTHVLWVNCUTNpRVZIcXcxaHZxa2g1?=
 =?utf-8?B?RS8zcE11TGwyNUc4ZFJYajBOaExoR1pLd2RkSW0ySmYyWkRjd2hya0FZeUFr?=
 =?utf-8?B?Tkp3NkpZcmpBc1hZVDZUQUpYTlpsSTBHdDRuajdvVTZZYzNXTUVDS2lIWlht?=
 =?utf-8?B?WnljdzRyY2YwS2UzWDA0b1JDNlBqN0cxUkhTTmViOUtYR3p2Y2N3b3NVbFYx?=
 =?utf-8?B?ZExPYjMzRmMrdXN0RFhxYXZEZXlEcU9VYmZRb21GeDR6Sktvd3hZU0lQdmVH?=
 =?utf-8?B?c0FDM3RtK2FwY3FzdXNORXkxT3MrcWM3dEtYcGJRUHVBQzNLNHpTSEhhTXpH?=
 =?utf-8?B?NXVZS1VFeVJEdE5ZWkYvUWxReTRIUXFSSTJianVuM0NoNE41S1RJR3ZBQjEx?=
 =?utf-8?B?SjJSa3dVZy9HT0ZVUmtvUnI2VCtsV1hibStVU2tMM2pYaStiUG81TVdxbHho?=
 =?utf-8?B?TE1UT3paMmc3bWl3eVFBcnVnd09HSnNSZEVhMFNoWkRpMTBtRFdaRHZ5enZv?=
 =?utf-8?B?cFFmUUVOUHZJdU0wYm1RenN3OFBsY29DaFc1NUVxazdTL3JjVGtrekVpZnNs?=
 =?utf-8?B?a0NGdlRoSGhuSFRmUFd2UmlTMkJ1T09LUHIzdlI2NEdISG11YnpSdUJ5NTk4?=
 =?utf-8?B?Q1dqWUFLNy9NK1hWbFFkVDRjeVFiZXFFTGI4Z3A3bEQxNnNKekFwUWZjRzZI?=
 =?utf-8?B?eC9hQkdDVHZjWXRtSFI0a2NvTkgyYU5ENU5ZeUNBc21rRWRVUFdxbmMxdW9U?=
 =?utf-8?B?UVM1R2JwVjVUOTl4UWlLRWZ5T1Vnemt6MjZxQzF1MDB5UGt3dTROWmtJd002?=
 =?utf-8?B?UWVRZmtCMlJtc01ZTng4dlVQWUhaQjhrZ1duN0pCRy8rWDlKT0NNZmhmYThP?=
 =?utf-8?B?dnBoN01ScUk2VVl2eUhrQUVvRGttV2ZtTWNwV3JOdmlpYUNHWFdtY2JDeDE3?=
 =?utf-8?B?R2c5WmlCQitTOENreUs5QUl0VGUwZXJNaENJTUxqV2xFa1NERjY0M2pRcW1Y?=
 =?utf-8?B?UGVDNmdCNWdyV2lyeTVVb1NsTmJHZ250OU5jUDlNbkp0akMyZDJhV3RGNEhy?=
 =?utf-8?B?Um13UGpLeFZWWXArQTNkaUxwK0xCY0hpSlNnd3JVSkRyV08zTUY1d0w1dWJQ?=
 =?utf-8?B?SzdhK25MMHpMRk5SUTV4TU5UNGVZTWZyaUxVK2phNE5uTmhhejlwV2ZmdW9C?=
 =?utf-8?Q?31hXEn0i1VkGA7L5OFCh7zZxL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce05eada-4b8e-4981-65ed-08dd9462cecb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 10:17:05.7672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cddgXsPtmwUvcNaLBDhDBb+atof9LQdLroCOLIxwf9+apQULphWpVlH1Db3nVNTyd+cB4g1npsnWQ/ECYSRtCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8092
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

--------------7Wk8LYMs724EqPfPsEYUUuht
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/16/2025 3:33 PM, Mohan Marimuthu, Yogesh wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
>
> Hi Sunil,
>
> I did not test with true as logically the code flow does not change if 
> skip_signal is true.
> The indentation is off because of the editor I had used. I will fix in 
> the next patch update.

If you are planning to use this in a new test case then we should 
handle/declare the test as success on failure as this is a negative test 
case. So this needs to be handled while writing a new test case.


Regards
Sunil Khatri

>
> Thank you,
> Yogesh
>
> ------------------------------------------------------------------------
> *From:* Khatri, Sunil <Sunil.Khatri@amd.com>
> *Sent:* Friday, May 16, 2025 11:12 AM
> *To:* Mohan Marimuthu, Yogesh <Yogesh.Mohanmarimuthu@amd.com>; 
> igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> *Subject:* Re: [PATCH i-g-t 1/2] tests/amdgpu: userq skip waiting for 
> signal fence
>
> @yogesh
>
> Functionally code looks good to me but i have a question,
>
> Have you validated the any test case with the skip flag set to true. 
> Test should not fail with that as its a negative test.
> How the igt test work here is that when you return from the 
> amdgpu_user_queue_submit function the next function checks the value 
> written in the memory and test might fail if the values dont match.
>
>
> Also, Indentation seems little off to me.
>
>
> On 5/15/2025 12:13 PM, Mohan Marimuthu, Yogesh wrote:
>
>     [Public]
>
>
>     [Public]
>
>
>     For negative test cases where the job will not complete need to
>     skip signal fence. Pass a flag to amdgpu_user_queue_submit() to
>     skip signal fence wait.
>
>     Signed-off-by: Yogesh Mohan Marimuthu
>     <yogesh.mohanmarimuthu@amd.com> <mailto:yogesh.mohanmarimuthu@amd.com>
>     ---
>      lib/amdgpu/amd_command_submission.c |  2 +-
>      lib/amdgpu/amd_compute.c            |  2 +-
>      lib/amdgpu/amd_userq.c              | 36
>     +++++++++++++++--------------
>      lib/amdgpu/amd_userq.h              |  2 +-
>      tests/amdgpu/amd_basic.c            |  4 ++--
>      tests/amdgpu/amd_cs_nop.c           |  2 +-
>      6 files changed, 25 insertions(+), 23 deletions(-)
>
>     diff --git a/lib/amdgpu/amd_command_submission.c
>     b/lib/amdgpu/amd_command_submission.c
>     index 80d03a498..74091da5a 100644
>     --- a/lib/amdgpu/amd_command_submission.c
>     +++ b/lib/amdgpu/amd_command_submission.c
>     @@ -68,7 +68,7 @@ int
>     amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned
>     int ip_type
>           memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw *
>     sizeof(*ring_context->pm4));
>           if (user_queue)
>     -           amdgpu_user_queue_submit(device, ring_context,
>     ip_type, ib_result_mc_address);
>     +           amdgpu_user_queue_submit(device, ring_context,
>     ip_type, ib_result_mc_address, false);
>
> Indentation here
>
>           else {
>                 ring_context->ib_info.ib_mc_address =
>     ib_result_mc_address;
>                 ring_context->ib_info.size = ring_context->pm4_dw;
>     diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
>     index 95bfa53aa..008186049 100644
>     --- a/lib/amdgpu/amd_compute.c
>     +++ b/lib/amdgpu/amd_compute.c
>     @@ -91,7 +91,7 @@ void
>     amdgpu_command_submission_compute_nop(amdgpu_device_handle device,
>     bool use
>                 if (user_queue) {
>                       amdgpu_user_queue_submit(device, ring_context,
>     AMD_IP_COMPUTE,
>     -                                    ib_result_mc_address);
>     +                                    ib_result_mc_address, false);
>                 } else {
>                       memset(&ib_info, 0, sizeof(struct
>     amdgpu_cs_ib_info));
>                       ib_info.ib_mc_address = ib_result_mc_address;
>     diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
>     index 50d058609..727df8222 100644
>     --- a/lib/amdgpu/amd_userq.c
>     +++ b/lib/amdgpu/amd_userq.c
>     @@ -127,7 +127,7 @@ int
>     amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
>      }
>      void amdgpu_user_queue_submit(amdgpu_device_handle device, struct
>     amdgpu_ring_context *ring_context,
>     -                       unsigned int ip_type, uint64_t mc_address)
>     +                       unsigned int ip_type, uint64_t mc_address,
>     bool skip_signal)
>
> Indentation here too.
>
>      {
>           int r;
>           uint32_t control = ring_context->pm4_dw;
>     @@ -166,22 +166,24 @@ void
>     amdgpu_user_queue_submit(amdgpu_device_handle device, struct
>     amdgpu_ring_co
>           /* Update the door bell */
>           ring_context->doorbell_cpu[DOORBELL_INDEX] =
>     *ring_context->wptr_cpu;
>     -     /* Add a fence packet for signal */
>     -     syncarray[0] = ring_context->timeline_syncobj_handle;
>     -     signal_data.queue_id = ring_context->queue_id;
>     -     signal_data.syncobj_handles = (uintptr_t)syncarray;
>     -     signal_data.num_syncobj_handles = 1;
>     -     signal_data.bo_read_handles = 0;
>     -     signal_data.bo_write_handles = 0;
>     -     signal_data.num_bo_read_handles = 0;
>     -     signal_data.num_bo_write_handles = 0;
>     -
>     -     r = amdgpu_userq_signal(device, &signal_data);
>     -     igt_assert_eq(r, 0);
>     +     if (!skip_signal) {
>     +           /* Add a fence packet for signal */
>     +           syncarray[0] = ring_context->timeline_syncobj_handle;
>     +           signal_data.queue_id = ring_context->queue_id;
>     +           signal_data.syncobj_handles = (uintptr_t)syncarray;
>     +           signal_data.num_syncobj_handles = 1;
>     +           signal_data.bo_read_handles = 0;
>     +           signal_data.bo_write_handles = 0;
>     +           signal_data.num_bo_read_handles = 0;
>     +           signal_data.num_bo_write_handles = 0;
>     +
>     +           r = amdgpu_userq_signal(device, &signal_data);
>     +           igt_assert_eq(r, 0);
>     -     r = amdgpu_cs_syncobj_wait(device,
>     &ring_context->timeline_syncobj_handle, 1, INT64_MAX,
>     -                        DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
>     -     igt_assert_eq(r, 0);
>     +           r = amdgpu_cs_syncobj_wait(device,
>     &ring_context->timeline_syncobj_handle, 1, INT64_MAX,
>     +                                                                 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL,
>     NULL);
>
> Indentation.
>
>     +           igt_assert_eq(r, 0);
>     +     }
>      }
>      void amdgpu_user_queue_destroy(amdgpu_device_handle
>     device_handle, struct amdgpu_ring_context *ctxt,
>     @@ -456,7 +458,7 @@ int
>     amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
>      }
>      void amdgpu_user_queue_submit(amdgpu_device_handle device, struct
>     amdgpu_ring_context *ring_context,
>     -     unsigned int ip_type, uint64_t mc_address)
>     +     unsigned int ip_type, uint64_t mc_address, bool skip_signal)
>      {
>      }
>     diff --git a/lib/amdgpu/amd_userq.h b/lib/amdgpu/amd_userq.h
>     index b29e97ccf..dc39c1ca4 100644
>     --- a/lib/amdgpu/amd_userq.h
>     +++ b/lib/amdgpu/amd_userq.h
>     @@ -50,6 +50,6 @@ void
>     amdgpu_user_queue_destroy(amdgpu_device_handle device_handle,
>     struct amdgpu
>                              unsigned int ip_type);
>      void amdgpu_user_queue_submit(amdgpu_device_handle device, struct
>     amdgpu_ring_context *ring_context,
>     -                       unsigned int ip_type, uint64_t mc_address);
>     +                       unsigned int ip_type, uint64_t mc_address,
>     bool skip_signal);
>      #endif
>     diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
>     index 97a08a9a3..914d27909 100644
>     --- a/tests/amdgpu/amd_basic.c
>     +++ b/tests/amdgpu/amd_basic.c
>     @@ -607,7 +607,7 @@
>     amdgpu_sync_dependency_test(amdgpu_device_handle device_handle,
>     bool user_queue)
>           if (user_queue) {
>                 ring_context->pm4_dw = ib_info.size;
>                 amdgpu_user_queue_submit(device_handle, ring_context,
>     ip_block->type,
>     -                              ib_result_mc_address);
>     +                              ib_result_mc_address, false);
>           } else {
>                 r = amdgpu_cs_submit(context_handle[1], 0,
>     &ibs_request, 1);
>           }
>     @@ -647,7 +647,7 @@
>     amdgpu_sync_dependency_test(amdgpu_device_handle device_handle,
>     bool user_queue)
>           if (user_queue) {
>                 ring_context->pm4_dw = ib_info.size;
>                 amdgpu_user_queue_submit(device_handle, ring_context,
>     ip_block->type,
>     -                             ib_info.ib_mc_address);
>     +                              ib_info.ib_mc_address, false);
>           } else {
>                 r = amdgpu_cs_submit(context_handle[0], 0,
>     &ibs_request, 1);
>                 igt_assert_eq(r, 0);
>     diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
>     index 268bc9201..658c8d050 100644
>     --- a/tests/amdgpu/amd_cs_nop.c
>     +++ b/tests/amdgpu/amd_cs_nop.c
>     @@ -108,7 +108,7 @@ static void nop_cs(amdgpu_device_handle device,
>                       if (user_queue) {
>                             ring_context->pm4_dw = ib_info.size;
>                             amdgpu_user_queue_submit(device,
>     ring_context, ip_type,
>     -                                          ib_info.ib_mc_address);
>     +                                          ib_info.ib_mc_address,
>     false);
>
> Not sure if its the mail editor or what i see its shifted by one. But 
> make sure indentation is correct and you run checkpatch.pl.
>
>                             igt_assert_eq(r, 0);
>                       } else {
>                             r = amdgpu_cs_submit(context, 0,
>     &ibs_request, 1);
>     -- 
>     2.43.0
>
>
--------------7Wk8LYMs724EqPfPsEYUUuht
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/16/2025 3:33 PM, Mohan Marimuthu,
      Yogesh wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:PH7PR12MB6633234BEAD5CA70DA8E35DEFF93A@PH7PR12MB6633.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p style="font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;font-style:normal;font-weight:normal;text-decoration:none;" align="Left">
        [AMD Official Use Only - AMD Internal Distribution Only]<br>
      </p>
      <br>
      <div>
        <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          Hi Sunil,</div>
        <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          I did not test with true as logically the code flow does not
          change if skip_signal is true.</div>
        <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          The indentation is off because of the editor I had used. I
          will fix in the next patch update.</div>
      </div>
    </blockquote>
    <p>If you are planning to use this in a new test case then we should
      handle/declare the test as success on failure as this is a
      negative test case. So this needs to be handled while writing a
      new test case.</p>
    <p><br>
    </p>
    <p>Regards<br>
      Sunil Khatri <br>
    </p>
    <blockquote type="cite" cite="mid:PH7PR12MB6633234BEAD5CA70DA8E35DEFF93A@PH7PR12MB6633.namprd12.prod.outlook.com">
      <div>
        <div><br>
        </div>
        <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          Thank you,</div>
        <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          Yogesh</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <hr style="display: inline-block; width: 98%;">
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          <b>From:</b>&nbsp;Khatri, Sunil <a class="moz-txt-link-rfc2396E" href="mailto:Sunil.Khatri@amd.com">&lt;Sunil.Khatri@amd.com&gt;</a><br>
          <b>Sent:</b>&nbsp;Friday, May 16, 2025 11:12 AM<br>
          <b>To:</b>&nbsp;Mohan Marimuthu, Yogesh
          <a class="moz-txt-link-rfc2396E" href="mailto:Yogesh.Mohanmarimuthu@amd.com">&lt;Yogesh.Mohanmarimuthu@amd.com&gt;</a>;
          <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:igt-dev@lists.freedesktop.org">&lt;igt-dev@lists.freedesktop.org&gt;</a><br>
          <b>Subject:</b>&nbsp;Re: [PATCH i-g-t 1/2] tests/amdgpu: userq skip
          waiting for signal fence
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div style="background-color: white;">
          <p>@yogesh<br>
            <br>
            Functionally code looks good to me but i have a question,<br>
          </p>
          <p>Have you validated the any test case with the skip flag set
            to true. Test should not fail with that as its a negative
            test.<br>
            How the igt test work here is that when you return from the
            amdgpu_user_queue_submit function the next function checks
            the value written in the memory and test might fail if the
            values dont match.<br>
          </p>
          <p><br>
          </p>
          <p>Also, Indentation seems little off to me.</p>
          <p><br>
          </p>
          <div>On 5/15/2025 12:13 PM, Mohan Marimuthu, Yogesh wrote:<br>
          </div>
          <blockquote>
            <p align="left" style="margin: 5pt; font-family: Calibri; font-size: 10pt; color: green;">
              [Public]<br>
            </p>
            <div><br>
            </div>
            <p align="left" style="margin: 5pt; font-family: Calibri; font-size: 10pt; color: green;">
              [Public]<br>
            </p>
            <div><br>
            </div>
            <div><span style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">For
                negative test cases where the job will not complete need
                to</span>
            </div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              skip signal fence. Pass a flag to
              amdgpu_user_queue_submit() to</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              skip signal fence wait.</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              <br>
            </div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              Signed-off-by: Yogesh Mohan Marimuthu <a href="mailto:yogesh.mohanmarimuthu@amd.com" id="OWAb0ecdee4-a6f2-5efd-4c07-fa3f32380eff" class="OWAAutoLink" moz-do-not-send="true">
                &lt;yogesh.mohanmarimuthu@amd.com&gt;</a></div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              ---</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;lib/amdgpu/amd_command_submission.c | &nbsp;2 +-</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;lib/amdgpu/amd_compute.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;2 +-</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;lib/amdgpu/amd_userq.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 36
              +++++++++++++++--------------</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;lib/amdgpu/amd_userq.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;2 +-</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;tests/amdgpu/amd_basic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;4 ++--</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;tests/amdgpu/amd_cs_nop.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;2 +-</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;6 files changed, 25 insertions(+), 23 deletions(-)</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              <br>
            </div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              diff --git a/lib/amdgpu/amd_command_submission.c
              b/lib/amdgpu/amd_command_submission.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              index 80d03a498..74091da5a 100644</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              --- a/lib/amdgpu/amd_command_submission.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +++ b/lib/amdgpu/amd_command_submission.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              @@ -68,7 +68,7 @@ int
              amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
              unsigned int ip_type</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;     memcpy(ring_ptr, ring_context-&gt;pm4,
              ring_context-&gt;pm4_dw * sizeof(*ring_context-&gt;pm4));</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;     if (user_queue)</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -           amdgpu_user_queue_submit(device, ring_context,
              ip_type, ib_result_mc_address);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           amdgpu_user_queue_submit(device, ring_context,
              ip_type, ib_result_mc_address, false);</div>
          </blockquote>
          <div>Indentation here<br>
          </div>
          <blockquote>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;     else {</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;           ring_context-&gt;ib_info.ib_mc_address =
              ib_result_mc_address;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;           ring_context-&gt;ib_info.size =
              ring_context-&gt;pm4_dw;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              diff --git a/lib/amdgpu/amd_compute.c
              b/lib/amdgpu/amd_compute.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              index 95bfa53aa..008186049 100644</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              --- a/lib/amdgpu/amd_compute.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +++ b/lib/amdgpu/amd_compute.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              @@ -91,7 +91,7 @@ void
              amdgpu_command_submission_compute_nop(amdgpu_device_handle
              device, bool use</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;           if (user_queue) {</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;                 amdgpu_user_queue_submit(device,
              ring_context, AMD_IP_COMPUTE,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -                                   
              ib_result_mc_address);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +                                    ib_result_mc_address,
              false);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;           } else {</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;                 memset(&amp;ib_info, 0, sizeof(struct
              amdgpu_cs_ib_info));</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;                 ib_info.ib_mc_address =
              ib_result_mc_address;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              diff --git a/lib/amdgpu/amd_userq.c
              b/lib/amdgpu/amd_userq.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              index 50d058609..727df8222 100644</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              --- a/lib/amdgpu/amd_userq.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +++ b/lib/amdgpu/amd_userq.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              @@ -127,7 +127,7 @@ int
              amdgpu_timeline_syncobj_wait(amdgpu_device_handle
              device_handle,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;}</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;void amdgpu_user_queue_submit(amdgpu_device_handle
              device, struct amdgpu_ring_context *ring_context,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -                  &nbsp; &nbsp; &nbsp;unsigned int ip_type, uint64_t
              mc_address)</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +                  &nbsp; &nbsp; &nbsp;unsigned int ip_type, uint64_t
              mc_address, bool skip_signal)</div>
          </blockquote>
          <div>Indentation here too.<br>
          </div>
          <blockquote>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;{</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;     int r;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;     uint32_t control = ring_context-&gt;pm4_dw;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              @@ -166,22 +166,24 @@ void
              amdgpu_user_queue_submit(amdgpu_device_handle device,
              struct amdgpu_ring_co</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;     /* Update the door bell */</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;     ring_context-&gt;doorbell_cpu[DOORBELL_INDEX] =
              *ring_context-&gt;wptr_cpu;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     /* Add a fence packet for signal */</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     syncarray[0] =
              ring_context-&gt;timeline_syncobj_handle;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     signal_data.queue_id = ring_context-&gt;queue_id;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     signal_data.syncobj_handles = (uintptr_t)syncarray;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     signal_data.num_syncobj_handles = 1;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     signal_data.bo_read_handles = 0;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     signal_data.bo_write_handles = 0;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     signal_data.num_bo_read_handles = 0;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     signal_data.num_bo_write_handles = 0;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     r = amdgpu_userq_signal(device, &amp;signal_data);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     igt_assert_eq(r, 0);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +     if (!skip_signal) {</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           /* Add a fence packet for signal */</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           syncarray[0] =
              ring_context-&gt;timeline_syncobj_handle;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           signal_data.queue_id =
              ring_context-&gt;queue_id;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           signal_data.syncobj_handles =
              (uintptr_t)syncarray;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           signal_data.num_syncobj_handles = 1;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           signal_data.bo_read_handles = 0;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           signal_data.bo_write_handles = 0;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           signal_data.num_bo_read_handles = 0;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           signal_data.num_bo_write_handles = 0;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           r = amdgpu_userq_signal(device,
              &amp;signal_data);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           igt_assert_eq(r, 0);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     r = amdgpu_cs_syncobj_wait(device,
              &amp;ring_context-&gt;timeline_syncobj_handle, 1,
              INT64_MAX,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -                        &nbsp;
              DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     igt_assert_eq(r, 0);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           r = amdgpu_cs_syncobj_wait(device,
              &amp;ring_context-&gt;timeline_syncobj_handle, 1,
              INT64_MAX,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
+                                                                 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL,
              NULL);</div>
          </blockquote>
          <div>Indentation.<br>
          </div>
          <blockquote>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +           igt_assert_eq(r, 0);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +     }</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;}</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;void amdgpu_user_queue_destroy(amdgpu_device_handle
              device_handle, struct amdgpu_ring_context *ctxt,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              @@ -456,7 +458,7 @@ int
              amdgpu_timeline_syncobj_wait(amdgpu_device_handle
              device_handle,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;}</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;void amdgpu_user_queue_submit(amdgpu_device_handle
              device, struct amdgpu_ring_context *ring_context,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -     unsigned int ip_type, uint64_t mc_address)</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +     unsigned int ip_type, uint64_t mc_address, bool
              skip_signal)</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;{</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;}</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              diff --git a/lib/amdgpu/amd_userq.h
              b/lib/amdgpu/amd_userq.h</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              index b29e97ccf..dc39c1ca4 100644</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              --- a/lib/amdgpu/amd_userq.h</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +++ b/lib/amdgpu/amd_userq.h</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              @@ -50,6 +50,6 @@ void
              amdgpu_user_queue_destroy(amdgpu_device_handle
              device_handle, struct amdgpu</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;                  &nbsp; &nbsp; &nbsp; unsigned int ip_type);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;void amdgpu_user_queue_submit(amdgpu_device_handle
              device, struct amdgpu_ring_context *ring_context,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -                  &nbsp; &nbsp; &nbsp;unsigned int ip_type, uint64_t
              mc_address);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +                  &nbsp; &nbsp; &nbsp;unsigned int ip_type, uint64_t
              mc_address, bool skip_signal);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;#endif</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              diff --git a/tests/amdgpu/amd_basic.c
              b/tests/amdgpu/amd_basic.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              index 97a08a9a3..914d27909 100644</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              --- a/tests/amdgpu/amd_basic.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +++ b/tests/amdgpu/amd_basic.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              @@ -607,7 +607,7 @@
              amdgpu_sync_dependency_test(amdgpu_device_handle
              device_handle, bool user_queue)</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;     if (user_queue) {</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;           ring_context-&gt;pm4_dw = ib_info.size;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;           amdgpu_user_queue_submit(device_handle,
              ring_context, ip_block-&gt;type,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -                              ib_result_mc_address);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +                              ib_result_mc_address,
              false);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;     } else {</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;           r = amdgpu_cs_submit(context_handle[1], 0,
              &amp;ibs_request, 1);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;     }</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              @@ -647,7 +647,7 @@
              amdgpu_sync_dependency_test(amdgpu_device_handle
              device_handle, bool user_queue)</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;     if (user_queue) {</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;           ring_context-&gt;pm4_dw = ib_info.size;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;           amdgpu_user_queue_submit(device_handle,
              ring_context, ip_block-&gt;type,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -                             ib_info.ib_mc_address);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +                              ib_info.ib_mc_address,
              false);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;     } else {</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;           r = amdgpu_cs_submit(context_handle[0], 0,
              &amp;ibs_request, 1);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;           igt_assert_eq(r, 0);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              diff --git a/tests/amdgpu/amd_cs_nop.c
              b/tests/amdgpu/amd_cs_nop.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              index 268bc9201..658c8d050 100644</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              --- a/tests/amdgpu/amd_cs_nop.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +++ b/tests/amdgpu/amd_cs_nop.c</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              @@ -108,7 +108,7 @@ static void
              nop_cs(amdgpu_device_handle device,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;                 if (user_queue) {</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;                       ring_context-&gt;pm4_dw =
              ib_info.size;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;                       amdgpu_user_queue_submit(device,
              ring_context, ip_type,</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              -                                         
              ib_info.ib_mc_address);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              +                                         
              ib_info.ib_mc_address, false);</div>
          </blockquote>
          <div>Not sure if its the mail editor or what i see its shifted
            by one. But make sure indentation is correct and you run
            checkpatch.pl.<br>
          </div>
          <blockquote>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;                       igt_assert_eq(r, 0);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;                 } else {</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              &nbsp;                       r = amdgpu_cs_submit(context, 0,
              &amp;ibs_request, 1);</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              --&nbsp;</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              2.43.0</div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              <br>
            </div>
            <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
              <br>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------7Wk8LYMs724EqPfPsEYUUuht--
