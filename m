Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEED66E42E
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2020 14:13:41 +0000 (UTC)
Date: Tue, 23 Jun 2020 17:13:38 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200623141338.jiwitu3nh6fnsb6j@ahiler-desk1.fi.intel.com>
References: <20200623133416.4275-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623133416.4275-1-ankit.k.nautiyal@intel.com>
Subject: Re: [igt-dev] [Patch][i-g-t v3 0/3] Add support to detect HDCP
 events
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
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 23, 2020 at 07:04:13PM +0530, Ankit Nautiyal wrote:
> This patch-series modifies the igt_kms to add support to detect
> connector events. This support is then used for detecting
> HDCP events in kms_content_protection. 
> Third patch, renames the APIs to have generic names.
> 
> Ankit Nautiyal (3):
>   lib/igt_kms: Add support for detecting connector events
>   tests/kms_content_protection: Use library functions for handling
>     uevents
>   lib: Use generic names for APIs that handle uevents

Acked-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

on the whole thing, thanks!
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
