Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0A810E752
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 16:53:43 +0000 (UTC)
Date: Fri, 25 Feb 2022 18:53:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Message-ID: <YhkJj1YEk+/kyZGr@intel.com>
References: <20220223133422.17032-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220223133422.17032-1-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5] tests/i915:Extend
 kms_frontbuffer_tracking to test FBC on multiple pipes
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

On Wed, Feb 23, 2022 at 07:04:22PM +0530, Nidhi Gupta wrote:
> In future more platforms will support FBC on
> multiple pipes, so to validate the same extending
> the kms_frontbuffer_tracking test.
> 
> In kernel code now  FBC debugfs files are exposed
> for each crtc so added debugfs_read_crtc function
> to get the per pipe fbc status.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>

Thanks. Pushed. I tweaked the patch subject a bit to conform to the
standard "tests/foo: do stuff" form.

git grep tells me tests/i915/kms_fbcon_fbt.c may also need adjusting.
Can you look into that next?

-- 
Ville Syrjälä
Intel
