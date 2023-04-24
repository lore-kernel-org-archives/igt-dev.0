Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE87C10E1D7
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 18:04:05 +0000 (UTC)
Date: Mon, 24 Apr 2023 11:03:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
Message-ID: <zxl4fmtglh7yyrppsetxtvmi2jbddhbsef7nph7efx754lsw2o@rkqnfspg4igc>
References: <20230419160724.324191-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230419160724.324191-1-matthew.s.atwood@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/xe/xe_huc_copy: check debugfs
 for huc running
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

On Wed, Apr 19, 2023 at 09:07:24AM -0700, Matt Atwood wrote:
>Use debugfs to make sure that huc is loaded for xe_huc_copy. This
>test will eventually need to determine if huc failed to load or if the
>platform supports it.
>
>v2: support multitile (Lucas)
>v3: style/commit message (Lucas)
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

Applied.

thanks
Lucas De Marchi
