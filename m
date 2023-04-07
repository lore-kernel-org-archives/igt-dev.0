Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC1110E377
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Apr 2023 09:55:39 +0000 (UTC)
Date: Fri, 7 Apr 2023 11:55:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230407095534.t2ijfxgbm7uxjniv@kamilkon-desk1>
References: <MN0PR12MB6053390E4EDABCC7BD86D545D3909@MN0PR12MB6053.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN0PR12MB6053390E4EDABCC7BD86D545D3909@MN0PR12MB6053.namprd12.prod.outlook.com>
Subject: Re: [igt-dev] Feature request: intel-GPU-top,
 support iGPU+dGPU simultaneous readout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Felix LeClair <felix.leclair123@hotmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-04-05 at 21:58:54 +0000, Felix LeClair wrote:
> Hi all,
> 
> The manual lists this ML as the place to go for information
> related to the intel_gpu_top application. I'm currently
> running application version 1.26 with an Arc A770 with host
> platform of an AlderLake 12700k, with upstream mesa (.23)
> and kernel 6.2.
> 
> I'd like to request the ability/ behaviour of listing all
> available cards in the application.
> 
> As of now I can target individual devices via the CLI
> switches, but no "combined" view.
> 
> If this feature can be added to the roadmap, that'd be swell.
> 
> Felix LeClair

+cc Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

Regards,
Kamil

> 
> P.S.
> Output of intel_gpu_top -L
> card1                    8086:56a0                         pci:vendor=8086,device=56A0,card=0
> └─renderD129
> card0                    Intel Alderlake_s (Gen12)         pci:vendor=8086,device=4680,card=0
> └─renderD128
