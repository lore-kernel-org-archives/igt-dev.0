Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA71C10E3BF
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Oct 2022 15:35:37 +0000 (UTC)
Date: Fri, 21 Oct 2022 08:35:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Y1K8Nn/Gem9BCgg8@unerlige-ril>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
MIME-Version: 1.0
Subject: [igt-dev] Merge patches that are failing to land in the ML and
 patchworks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

Reg: [igt-dev] [PATCH i-g-t v6 00/36] Add DG2 OA test

I posted this series a while ago and I have some large XML files in 
these patches that are not landing in the ML because mail servers reject 
it. Hence, it does not make it to patchworks and I am not able to run 
pre-merge CI on the kernel patches.

To resolve this, I am planning to just merge the XML files and relevant 
scripts as a separate series of 10 patches shared here:

https://gitlab.freedesktop.org/unerlige/igt-gpu-tools/-/commits/master

Once that is merged, I will post the remaining patches to the ML so that 
pre-merge can run. I did a sanity check on these patches with kbl, tgl, 
adlp (with guc) and I don't see any issues.

Requesting an Ack for this.

Thanks,
Umesh
