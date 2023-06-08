Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363E210E196
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jun 2023 14:11:48 +0000 (UTC)
Date: Thu, 8 Jun 2023 14:11:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <janga.rahul.kumar@intel.com>
Message-ID: <ZIHhfQZsk8P2pCbN@DUT025-TGLU.fm.intel.com>
References: <20230607080352.950226-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230607080352.950226-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Add VM error capture tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 07, 2023 at 01:33:50PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Add tests to check VM error capture.
> 
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 

This uAPI is changing soon, please don't more tests for it.

Matt

> Janga Rahul Kumar (2):
>   tests/xe_vm.c: Add VM bind error capture test
>   tests/xe_vm.c: Add Negative test to VM error capture
> 
>  tests/xe/xe_vm.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> -- 
> 2.25.1
> 
