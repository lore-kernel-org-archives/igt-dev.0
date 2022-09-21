Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CEF10E8B9
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 07:48:00 +0000 (UTC)
Date: Wed, 21 Sep 2022 10:47:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Message-ID: <YyrBrDSeogdOq4zs@intel.com>
References: <20220831101100.1242315-1-mwen@igalia.com>
 <c97e81d2-3aaa-db11-ebb1-b6df5bf0b1ce@intel.com>
 <20220919155421.nauj7e4dp2dwmqza@mail.igalia.com>
 <9c8f18bc-a815-84a0-93eb-698a4083bbe0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c8f18bc-a815-84a0-93eb-698a4083bbe0@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_color: fix crc assert
 condition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 03:32:39PM +0530, Modem, Bhanuprakash wrote:
> On Mon-19-09-2022 09:24 pm, Melissa Wen wrote:
> > On 09/01, Modem, Bhanuprakash wrote:
> >> On Wed-31-08-2022 03:41 pm, Melissa Wen wrote:
> >>> In test_pipe_degamma/gamma/ctm, igt_assert_crc_equal() was replaced by
> >>>
> >>> ret = !igt_skip_crc_compare || igt_check_crc_equal()
> >>> and then igt_assert(ret)
> >>>
> >>> where igt_check_crc_equal returns !mismatch, and therefore we can
> >>> translate as:
> >>>
> >>> ret = !igt_skip_crc_compare || !mismatch
> >>>
> >>> However, the original igt_assert_crc_equal() assertion does:
> >>>
> >>> igt_assert(!mismatch || igt_skip_crc_compare)
> >>>
> >>> That means, the replacement changes the original assertion. Moreover,
> >>> negating `igt_skip_crc_compare` makes the test assertion to be always
> >>> true (sucessful) by default and reverses the logic of
> >>> --skip-crc-compare.
> >>>
> >>> Fixes: d61e4598142 ("tests/kms_color: Convert tests to dynamic")
> >>> Signed-off-by: Melissa Wen <mwen@igalia.com>
> >>
> >> LGTM
> >> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> >>
> >> - Bhanu
> > 
> > Thanks for reviewing, Bhanu.
> > 
> > Siqueira,
> > 
> > Is it okay from AMD side? If so, can you apply it?
> 
> Applied.

It did _not_ pass CI and so should not have been pushed!

-- 
Ville Syrjälä
Intel
