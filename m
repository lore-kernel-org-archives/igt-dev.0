Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7456F383
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jun 2021 15:55:29 +0000 (UTC)
Date: Fri, 11 Jun 2021 18:50:20 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20210611052005.303-4-venkata.sai.patnana@intel.com>
Message-ID: <alpine.DEB.2.22.394.2106111849440.3922722@eliteleevi.tm.intel.com>
References: <20210611052005.303-1-venkata.sai.patnana@intel.com>
 <20210611052005.303-4-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 04/17] tests/core_hotunplug: Unload snd
 driver before i915 unbind
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On Fri, 11 Jun 2021, venkata.sai.patnana@intel.com wrote:

> From: Uma Shankar <uma.shankar@intel.com>
> 
> Unload the snd module before unbinding i915. Audio holds a wakeref
> which triggers a warning otherwise, resulting in below warning and
> test failure. Currently HSW/BDW and DG1 are the platforms affected,
> can be extended to other platforms as well.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>                                                                                                              
                                                                                                                                                                      
Br, Kai   
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
