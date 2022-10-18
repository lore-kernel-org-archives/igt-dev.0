Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E70110E288
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 16:06:55 +0000 (UTC)
Message-ID: <640e3f12-db6d-1ea1-9a43-441b36540776@linux.intel.com>
Date: Tue, 18 Oct 2022 17:06:29 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221018091001.18552-1-kamil.konieczny@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20221018091001.18552-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] lib/igt_device_scan: add filer
 card=all
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 18/10/2022 10:09, Kamil Konieczny wrote:
> Allow to select all (up to 16) discrete cards with the help of
> card=all or card=*, for example:
> 
> ./gem_basic --device=pci:vendor=intel,device=discrete,card=all

What should this do btw? Run the tests on more than one card in 
sequence? Isn't that test runner's job?

Regards,

Tvrtko

> Kamil Konieczny (2):
>    lib/igt_device_scan: refactor filer adding
>    lib/igt_device_scan: add card=all filter selector
> 
>   lib/igt_device_scan.c | 36 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 34 insertions(+), 2 deletions(-)
> 
